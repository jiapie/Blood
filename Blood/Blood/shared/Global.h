//
//  Global.h
//  shennong-produce
//
//  Created by Lee, Chia-Pei on 2015/4/21.
//  Copyright (c) 2015年 Lee, Chia-Pei. All rights reserved.
//

#ifndef shennong_produce_Global_h
#define shennong_produce_Global_h
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "httpEX.h"
#import "jsonEX.h"
#import "MessageBox.h"

//IOS Version
#define UI_IS_IOS8_AND_HIGHER   ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0)
//UI IPAD,IPHONE
#define UI_IS_IPAD      ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
#define UI_IS_IPHONE    ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
//IPHONE
#define IPHONE4_SCREEN_WIDTH    320
#define UI_IS_IPHONE4   (UI_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height < 568.0)
#define UI_IS_IPHONE5   (UI_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 568.0)
#define UI_IS_IPHONE6   (UI_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 667.0)
#define UI_IS_IPHONE6PLUS   (UI_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 736.0 || [[UIScreen mainScreen] bounds].size.width == 736.0) // Both orientations

#define UI_SCREEN_H [[UIScreen mainScreen] bounds].size.height
#define UI_SCREEN_W [[UIScreen mainScreen] bounds].size.width

static NSString *sGetBloodStatusJson = @"http://g0v.github.io/blood/blood.json";

static NSString *cOK                = @"確定";
static NSString *cCancel            = @"取消";

static NSString *cDataProcessWait   = @"資料處理中";
static NSString *cTaipei            = @"台北捐血中心";
static NSString *cHsinchu           = @"新竹捐血中心";
static NSString *cTaichung          = @"台中捐血中心";
static NSString *cTainan            = @"台南捐血中心";
static NSString *cKaohsiung         = @"高雄捐血中心";
static NSString *cHualian           = @"花蓮捐血中心";

@interface Global: NSObject
{
    NSMutableDictionary *dGlobal;
}

@property NSMutableDictionary *dGlobal;
-(void)createData;
@end

#endif
