//
//  MessageBox.h
//  shennong-produce
//
//  Created by Lee, Chia-Pei on 2015/2/26.
//  Copyright (c) 2015年 Lee, Chia-Pei. All rights reserved.
//

#ifndef shennong_produce_MessageBox_h
#define shennong_produce_MessageBox_h

#import "Global.h"

@interface MessageBox: NSObject
+(void)showWarningMsg:(NSString *)sTitle and:(NSString *)sWarning;
+(void)showWaitMessage:(UIView *)thisView and:(UILabel *)lwait and:(NSString *)sMsg;
+(void)endWaitMessage:(UIView *)thisView and:(UILabel *)lwait;
//+(UIAlertView *)showWaitMessageAlert:(NSString *)sMsg;
//+(void)endWaitMessageAlert:(UIAlertView *)message;
@end
#endif
