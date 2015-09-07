//
//  MessageBox.m
//  shennong-produce
//
//  Created by Lee, Chia-Pei on 2015/2/26.
//  Copyright (c) 2015年 Lee, Chia-Pei. All rights reserved.
//

#import "MessageBox.h"

@implementation MessageBox:NSObject

+(void)showWarningMsg:(NSString *)sTitle and:(NSString *)sWarning
{
    UIAlertView *warningMsgAlert = [[UIAlertView alloc]
                                    initWithTitle:sTitle message:sWarning delegate:nil cancelButtonTitle:cOK otherButtonTitles:nil];
    [warningMsgAlert show];
}

+(void)showWaitMessage:(UIView *)thisView and:(UILabel *)lwait and:(NSString *)sMsg
 {
     lwait.text = sMsg;
     lwait.backgroundColor = [UIColor blackColor];
     //lwait.backgroundColor = [UIColor whiteColor];
     lwait.alpha = 0.7;
     //lwait.frame = CGRectMake(UI_SCREEN_W/4, UI_SCREEN_H/4, UI_SCREEN_W/2, UI_SCREEN_H/4);
     lwait.frame = CGRectMake(UI_SCREEN_W, UI_SCREEN_H, UI_SCREEN_W, UI_SCREEN_H);
     lwait.center = CGPointMake(UI_SCREEN_W/2, UI_SCREEN_H/2);
     lwait.adjustsFontSizeToFitWidth = YES;
     lwait.contentMode = UIControlContentVerticalAlignmentTop;
     lwait.textAlignment = NSTextAlignmentCenter;
     lwait.textColor = [UIColor whiteColor];
     //lwait.layer.cornerRadius = 10;
     //lwait.layer.borderColor = [UIColor grayColor].CGColor;
     //lwait.layer.borderWidth = 3;
     [lwait setHidden:NO];
     
     UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
     spinner.color = [UIColor whiteColor];
     //spinner.frame = CGRectMake(UI_SCREEN_W/4, UI_SCREEN_H/4, UI_SCREEN_W/2, UI_SCREEN_H/4);
     spinner.center = CGPointMake(UI_SCREEN_W/2, UI_SCREEN_H/2 + 40);
     [spinner startAnimating];
     [lwait addSubview:spinner];
     [thisView addSubview:spinner];
     
     [thisView bringSubviewToFront:lwait];
     [thisView bringSubviewToFront:spinner];     
     //[self.view bringSubviewToFront:view2]; // 將 view2 推到最上層
     //[self.view sendSubviewToBack:view2];   // 將 view2 移到最下層
 }

+(void)endWaitMessage:(UIView *)thisView and:(UILabel *)lwait
 {
     [lwait setHidden:YES];
     
     for (UIView *i in thisView.subviews)
     {
         if([i isKindOfClass:[UIActivityIndicatorView class]])
         {
             UIActivityIndicatorView *spinner = (UIActivityIndicatorView *)i;
             [spinner stopAnimating];
             [spinner removeFromSuperview];
             [thisView sendSubviewToBack:lwait];
             break;
         }
     }
    
 }

/*
+(UIAlertView *)showWaitMessageAlert:(NSString *)sMsg
{
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:sMsg message:cPleaseWait delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
    
    [message show];
    
    return message;
}
*/
/*
+(void)endWaitMessageAlert:(UIAlertView *)message
{
    [message dismissWithClickedButtonIndex:-1 animated:YES];
}
*/
@end
