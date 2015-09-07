//
//  jsonEX_h
//  shennong_produce
//
//  Created by Lee, Chia-Pei on 2015/2/10.
//  Copyright (c) 2015年 Lee, Chia-Pei. All rights reserved.
//

#import "jsonEX.h"

@implementation NSDictionary (JSONCategories)

+(NSDictionary*)dictionaryWithContentsOfJSONURLString:(NSString*)urlAddress
{
    NSData* data =[NSData dataWithContentsOfURL:[NSURL URLWithString: urlAddress]];
    
    if(data != nil)
    {
        __autoreleasing NSError* error =nil;
        id result =[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        
        if(error !=nil)
        {
            return nil;
        }
        return result;
    }
    return nil;
}

+(NSDictionary*)dictionaryWithContentsOfJSONFile:(NSString*)jsonFile
{
    NSData* data =[NSData dataWithContentsOfFile:jsonFile];

    if(data != nil)
    {
        __autoreleasing NSError* error =nil;
        id result =[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        
        if(error !=nil)
        {
            return nil;
        }
        return result;
    }
    return nil;
}

+(NSDictionary*)dictionaryWithJSONData:(NSData *)jsonData
{
    if(jsonData != nil)
    {
        __autoreleasing NSError* error =nil;
        id result =[NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
        
        if(error !=nil)
        {
            return nil;
        }
        return result;
    }
    return nil;
}

+(NSString *)NSDictionarytoJSON:(NSMutableDictionary *)myDictionary
{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:myDictionary options:0 error:&error];
    NSString *JSONString;
    
    if ((!jsonData) || (error != nil))
    {
        return nil;
    }
    else
    {
        JSONString = [[NSString alloc] initWithBytes:[jsonData bytes] length:[jsonData length] encoding:NSUTF8StringEncoding];
    }
    return  JSONString;
}
@end

@implementation NSArray (JSONCategories)
+(NSArray*)arrayWithContentsOfJSONURLString:(NSString*)urlAddress
{
    NSData* data =[NSData dataWithContentsOfURL:[NSURL URLWithString: urlAddress]];
    
    if(data != nil)
    {
        __autoreleasing NSError* error =nil;
        id result =[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        
        if(error !=nil)
        {
            return nil;
        }
        return result;
    }
    return nil;
}

+(NSArray*)arrayWithContentsOfJSONFile:(NSString*)jsonFile
{
    NSData* data =[NSData dataWithContentsOfFile:jsonFile];
    
    if(data != nil)
    {
        __autoreleasing NSError* error =nil;
        id result =[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        
        if(error !=nil)
        {
            return nil;
        }
        return result;
    }
    return nil;
}

+(NSArray*)arrayWithJSONData:(NSData *)jsonData
{
    if(jsonData != nil)
    {
        __autoreleasing NSError* error =nil;
        id result =[NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
        
        if(error !=nil)
        {
            return nil;
        }
        return result;
    }
    return nil;
}

+(NSString *)NSArraytoJSON:(NSMutableDictionary *)myArray
{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:myArray options:0 error:&error];
    NSString *JSONString;
    
    if ((!jsonData) || (error != nil))
    {
        return nil;
    }
    else
    {
        JSONString = [[NSString alloc] initWithBytes:[jsonData bytes] length:[jsonData length] encoding:NSUTF8StringEncoding];
    }
    return  JSONString;
}
@end
