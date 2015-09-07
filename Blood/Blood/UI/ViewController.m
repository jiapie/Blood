//
//  ViewController.m
//  FarmTransData
//
//  Created by Lee, Chia-Pei on 2015/9/4.
//  Copyright (c) 2015年 Lee, Chia-Pei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //UIViewController *send = segue.destinationViewController;
    //[send setValue:dAllBloodStatus forKey:@"dAllBloodStatus"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

-(void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self performSegueWithIdentifier:@"List" sender:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
