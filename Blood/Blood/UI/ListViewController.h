//
//  ViewController.h
//  FarmTransData
//
//  Created by Lee, Chia-Pei on 2015/9/4.
//  Copyright (c) 2015年 Lee, Chia-Pei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Global.h"

@interface ListViewController : UIViewController
{
    IBOutlet UILabel        *ltime;
    IBOutlet UITableView    *thisTableView;
    NSDictionary            *dAllBloodStatus;
    NSMutableArray          *tableArray;
}
@end

