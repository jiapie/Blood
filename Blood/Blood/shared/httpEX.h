//
//  httpEX.h
//  shennong-produce
//
//  Created by Lee, Chia-Pei on 2015/2/13.
//  Copyright (c) 2015年 Lee, Chia-Pei. All rights reserved.
//

#ifndef shennong_produce_httpEX_h
#define shennong_produce_httpEX_h

#import "Global.h"

static NSString *sHttpMethodPOST = @"POST";
static NSString *sHttpMethodGET  = @"GET";
static NSString *sHttpBoundary = @"AaB03x";

static NSString *sHttpConnectDisable    = @"網路連線不正常";
static NSString *sHttpConnectTimeout    = @"網路連線逾時";
static NSString *sHttpConnectNULL       = @"無法取得遠端網路資料";

//HTTP MIME Type
static NSString *sCommonMineText        = @"text/plain";
static NSString *sCommonMineZip         = @"application/zip";

@interface HttpEx: NSObject
{
    NSURLRequest        *httpGetRequest;
    NSURLResponse       *httpGetResponse;
    BOOL                bHttpGetResponse;
    NSData              *httpGetBody;
    NSMutableURLRequest *httpPostRequest;
    NSURLResponse       *httpPostResponse;
    BOOL                bHttpPostResponse;
    NSData              *httpPostBody;
    NSString            *httpPostFilename;
    NSString            *httpErrorMsg;
}

@property NSURLRequest          *httpGetRequest;
@property NSURLResponse         *httpGetResponse;
@property BOOL                  bHttpGetResponse;
@property NSData                *httpGetBody;
@property NSMutableURLRequest   *httpPostRequest;
@property NSURLResponse         *httpPostResponse;
@property BOOL                  bHttpPostResponse;
@property NSData                *httpPostBody;
@property NSString              *httpPostFilename;
@property NSString              *httpErrorMsg;

+(NSURL*) toURL:(NSString*) sURL;
-(BOOL) bCheckConnect:(NSURL*)sURL;
//GET
-(void) HttpGetRequest:(NSURL *)sURL;
-(BOOL) HttpGetResponseDataType;
-(BOOL) HttpGetResponseData;
//POST
-(void) HttpPostRequest:(NSURL*) sURL andPostData:(NSString *)sPostData;
-(void) HttpPostUpload:(NSURL*) sURL andPostData:(NSData *)dPostData;
-(BOOL) HttpPostResponseDataType;
-(BOOL) HttpPostResponseData;
@end
#endif