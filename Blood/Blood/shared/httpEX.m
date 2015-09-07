//
//  httpEX.m
//  shennong-produce
//
//  Created by Lee, Chia-Pei on 2015/2/13.
//  Copyright (c) 2015年 Lee, Chia-Pei. All rights reserved.
//

#import "httpEX.h"

@implementation HttpEx:NSObject

@synthesize httpGetRequest;
@synthesize httpGetResponse;
@synthesize bHttpGetResponse;
@synthesize httpGetBody;
@synthesize httpPostRequest;
@synthesize httpPostResponse;
@synthesize bHttpPostResponse;
@synthesize httpPostBody;
@synthesize httpPostFilename;
@synthesize httpErrorMsg;

//URL
+(NSURL*) toURL:(NSString*) sURL
{
    return [NSURL URLWithString:sURL];
}

-(BOOL) bCheckConnect:(NSURL*)sURL
{
    BOOL bCheck = YES;
    
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:sURL];
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if (!conn)
    {
        bCheck = NO;
        httpErrorMsg = sHttpConnectDisable;
    }
    
    return bCheck;
}

//HTTP GET
-(void) HttpGetRequest:(NSURL *)sURL
{
    httpGetRequest = [[NSURLRequest alloc]initWithURL:sURL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
}

-(BOOL) HttpGetResponseDataType
{
    BOOL bReturn = NO;
    
    NSURLResponse *response;
    NSError *err;

    [NSURLConnection sendSynchronousRequest:httpGetRequest returningResponse:&response error:&err];
    httpGetResponse = response;
    
    if(err == nil)
    {
        bReturn = YES;
    }
    else
    {
        httpErrorMsg = [err localizedDescription];
    }

    return  bReturn;
}

-(BOOL) HttpGetResponseData
{
    BOOL bReturn = NO;
    
    NSURLResponse *response;
    NSError *err;
    
    httpGetBody = [NSURLConnection sendSynchronousRequest:httpGetRequest returningResponse:&response error:&err];
    httpGetResponse = response;
    
    if(err == nil)
    {
        if(httpGetBody == nil)
        {
            httpErrorMsg = sHttpConnectTimeout;
        }
        else
        {
            bReturn = YES;
        }
    }
    else
    {
        httpErrorMsg = [err localizedDescription];
    }

    bHttpGetResponse = bReturn;
    return bReturn;
}

//HTTP POST
-(void) HttpPostRequest:(NSURL*) sURL andPostData:(NSString *)sPostData
{
    //NSLog(@"send HTTP Post Request");
    httpPostRequest = [[NSMutableURLRequest alloc]initWithURL:sURL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
    [httpPostRequest setHTTPMethod:sHttpMethodPOST];

    NSData *dPostData = [sPostData dataUsingEncoding:NSUTF8StringEncoding];
    //Send
    [httpPostRequest setHTTPBody:dPostData];
}

-(void) HttpPostUpload:(NSURL*) sURL andPostData:(NSData *)dPostData
{
    httpPostRequest = [[NSMutableURLRequest alloc]initWithURL:sURL cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:30];

    //设置HTTPHeader中Content-Type的值
    NSString *content=[[NSString alloc]initWithFormat:@"multipart/form-data; boundary=%@",sHttpBoundary];

    //设置HTTPHeader
    [httpPostRequest setValue:content forHTTPHeaderField:@"Content-Type"];
    
    //设置Content-Length
    NSInteger iLength = [dPostData length];
    NSString *sLength=[[NSString alloc]initWithFormat:@"%lu",(long)iLength];
    [httpPostRequest setValue:sLength forHTTPHeaderField:@"Content-Length"];
    
    //设置http body
    [httpPostRequest setHTTPBody:dPostData];
    
    //http method
    [httpPostRequest setHTTPMethod:sHttpMethodPOST];
}

-(BOOL) HttpPostResponseDataType
{
    BOOL bReturn = NO;
    
    NSURLResponse *response;
    NSError *err;
    
    [NSURLConnection sendSynchronousRequest: httpPostRequest returningResponse:&response error:&err];
    httpPostResponse = response;
    
    if(err == nil)
    {
        bReturn = YES;
    }
    else
    {
        NSLog(@"Error:%@",err.description);
        httpErrorMsg = [err localizedDescription];
    }
    
    return  bReturn;
}

-(BOOL) HttpPostResponseData
{
    BOOL bReturn = NO;
    
    NSURLResponse *response;
    NSError *err;

    httpPostBody = [[NSData alloc] initWithData:[NSURLConnection sendSynchronousRequest: httpPostRequest returningResponse:&response error:&err]];
    
    httpPostResponse = response;
    //NSLog(@"get HTTP Post Response");
    
    if(err == nil)
    {
        bReturn = YES;
        
        if([httpPostResponse.MIMEType isEqualToString:sCommonMineZip])
        {//application/zip
            NSString *sGetPackageFileName;
            sGetPackageFileName = httpPostResponse.suggestedFilename;
            NSString *sPath = NSTemporaryDirectory();;
            NSString *sFile = [sPath stringByAppendingPathComponent:sGetPackageFileName];
            httpPostFilename = sGetPackageFileName;
            
            NSFileManager *fm = [NSFileManager defaultManager];            
            if([fm fileExistsAtPath:sFile] == NO)
            {
                BOOL bWrite = [httpPostBody writeToFile:sFile atomically:YES];

                if(bWrite == NO)
                {//寫檔失敗
                    bReturn = NO;
                }
            }
        }
        else
        {//text/plain
            if((httpPostBody == nil) || ([httpPostBody length] <= 0))
            {
                httpErrorMsg = sHttpConnectTimeout;
            }
            else
            {
                bReturn = YES;
                httpPostFilename = nil;
            }
        }
    }
    else
    {
        httpErrorMsg = [err localizedDescription];
    }
    
    bHttpPostResponse = bReturn;
    return bReturn;
}

@end