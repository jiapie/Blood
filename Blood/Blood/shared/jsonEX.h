//
//  jsonEX_h
//  shennong_produce
//
//  Created by Lee, Chia-Pei on 2015/2/10.
//  Copyright (c) 2015年 Lee, Chia-Pei. All rights reserved.
//

#ifndef shennong_produce_jsonEX_h
#define shennong_produce_jsonEX_h

#import "Global.h"

@interface NSDictionary(JSONCategories)
{
}
+(NSDictionary*) dictionaryWithContentsOfJSONURLString:(NSString*)urlAddress;
+(NSDictionary*) dictionaryWithContentsOfJSONFile:(NSString*)jsonFile;
+(NSDictionary*) dictionaryWithJSONData:(NSData *)jsonData;
+(NSString *) NSDictionarytoJSON:(NSDictionary *)myDictionary;
@end

@interface  NSArray(JSONCategories)
{
}
+(NSArray*) arrayWithContentsOfJSONURLString:(NSString*)urlAddress;
+(NSArray*) arrayWithContentsOfJSONFile:(NSString*)jsonFile;
+(NSArray*) arrayWithJSONData:(NSData *)jsonData;
+(NSString *) NSArraytoJSON:(NSArray *)myArray;
@end
#endif
