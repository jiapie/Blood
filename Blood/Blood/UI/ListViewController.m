//
//  ViewController.m
//  FarmTransData
//
//  Created by Lee, Chia-Pei on 2015/9/4.
//  Copyright (c) 2015年 Lee, Chia-Pei. All rights reserved.
//

#import "ListViewController.h"

@interface ListViewController ()

@end

@implementation ListViewController

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *simpleTableIdentifier =  @"SimpleTableItem";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    cell.textLabel.lineBreakMode = NSLineBreakByTruncatingTail;//NSLineBreakByCharWrapping;
    cell.textLabel.numberOfLines = 1;
    cell.textLabel.text = [tableArray objectAtIndex:indexPath.row];
    
    NSString *sBloodStatus = [tableArray objectAtIndex:indexPath.row];
    NSArray *aBloodStatus = [sBloodStatus componentsSeparatedByString:@" "];
    cell.textLabel.text = aBloodStatus[0];
    //NSLog(@"aBloodStatus(%d):%@",indexPath.row,aBloodStatus);

    NSMutableArray *aIconStatus = [[NSMutableArray alloc]initWithArray:aBloodStatus];
    for(NSInteger iIndex=1; iIndex < aBloodStatus.count; iIndex++)
    {
        if([aBloodStatus[iIndex]isEqualToString:@"full"])
        {
            aIconStatus[iIndex] = @"StorageIcon003.jpg";
        }
        else if([aBloodStatus[iIndex] isEqualToString:@"medium"])
        {
            aIconStatus[iIndex] = @"StorageIcon002.jpg";
        }
        else //if(aBloodStatus[iIndex] isEqualToString:@"")
        {
            aIconStatus[iIndex] = @"StorageIcon001.jpg";
        }
    }
    
    //NSLog(@"aIcon:%@",aIconStatus);
    
    CGFloat W = 120.0f;
    CGFloat Icon_H  = 40.0f;
    CGFloat Icon_W  = 55.0f;
    //CGFloat cell_H = 40.0f; //(55,40)
    UIImage *iIcon = [UIImage imageNamed:aIconStatus[1]];
    UIButton *bStoreageA =[UIButton buttonWithType:UIButtonTypeCustom];
    bStoreageA.frame = CGRectMake((W + Icon_W * 0), 3.0f, (Icon_W - 3.0f), (Icon_H - 3.0f));
    [bStoreageA setImage:iIcon forState:UIControlStateNormal];
    [cell addSubview:bStoreageA];
    
    iIcon = [UIImage imageNamed:aIconStatus[2]];
    UIButton *bStoreageAB =[UIButton buttonWithType:UIButtonTypeCustom];
    bStoreageAB.frame = CGRectMake((W + Icon_W * 1), 3.0f, (Icon_W - 3.0f), (Icon_H - 3.0f));
    [bStoreageAB setImage:iIcon forState:UIControlStateNormal];
    [cell addSubview:bStoreageAB];
    
    iIcon = [UIImage imageNamed:aIconStatus[3]];
    UIButton *bStoreageB =[UIButton buttonWithType:UIButtonTypeCustom];
    bStoreageB.frame = CGRectMake((W + Icon_W * 2), 3.0f, (Icon_W - 3.0f), (Icon_H - 3.0f));
    [bStoreageB setImage:iIcon forState:UIControlStateNormal];
    [cell addSubview:bStoreageB];
    
    iIcon = [UIImage imageNamed:aIconStatus[4]];
    UIButton *bStoreageO =[UIButton buttonWithType:UIButtonTypeCustom];
    bStoreageO.frame = CGRectMake((W + Icon_W * 3), 3.0f, (Icon_W - 3.0f), (Icon_H - 3.0f));
    [bStoreageO setImage:iIcon forState:UIControlStateNormal];
    [cell addSubview:bStoreageO];
    return cell;
}

- (void)showBloodStatus
{//dAllBloodStatus
    
    //NSLog(@"dAllBloodStatus:%@",dAllBloodStatus);
    
    tableArray = [[NSMutableArray alloc]init];
    
    NSString *sTime = [dAllBloodStatus valueForKey:@"time"];
    ltime.text = sTime;
    
    //Taipei
    NSDictionary *dTaipei = [dAllBloodStatus valueForKey:cTaipei];
    NSString *sTaipei = [NSString stringWithFormat:@"%@ %@ %@ %@ %@",
                         [dTaipei valueForKey:@"name"],
                         [dTaipei valueForKey:@"StorageA"],
                         [dTaipei valueForKey:@"StorageAB"],
                         [dTaipei valueForKey:@"StorageB"],
                         [dTaipei valueForKey:@"StorageO"]];
    [tableArray addObject:sTaipei];
    //NSLog(@"Taipei:%@",sTaipei);

    //Hsinchu
    NSDictionary *dHsinchu = [dAllBloodStatus valueForKey:cHsinchu];
    NSString *sHsinchu = [NSString stringWithFormat:@"%@ %@ %@ %@ %@",
                         [dHsinchu valueForKey:@"name"],
                         [dHsinchu valueForKey:@"StorageA"],
                         [dHsinchu valueForKey:@"StorageAB"],
                         [dHsinchu valueForKey:@"StorageB"],
                         [dHsinchu valueForKey:@"StorageO"]];
    [tableArray addObject:sHsinchu];
    //NSLog(@"Hsinchu:%@",sHsinchu);
    
    //Taichung
    NSDictionary *dTaichung = [dAllBloodStatus valueForKey:cTaichung];
    NSString *sTaichung = [NSString stringWithFormat:@"%@ %@ %@ %@ %@",
                          [dTaichung valueForKey:@"name"],
                          [dTaichung valueForKey:@"StorageA"],
                          [dTaichung valueForKey:@"StorageAB"],
                          [dTaichung valueForKey:@"StorageB"],
                          [dTaichung valueForKey:@"StorageO"]];
    [tableArray addObject:sTaichung];
    //NSLog(@"Taichung:%@",sTaichung);
    
    //Tainan
    NSDictionary *dTainan = [dAllBloodStatus valueForKey:cTainan];
    NSString *sTainan = [NSString stringWithFormat:@"%@ %@ %@ %@ %@",
                           [dTainan valueForKey:@"name"],
                           [dTainan valueForKey:@"StorageA"],
                           [dTainan valueForKey:@"StorageAB"],
                           [dTainan valueForKey:@"StorageB"],
                           [dTainan valueForKey:@"StorageO"]];
    [tableArray addObject:sTainan];
    //NSLog(@"Tainan:%@",sTainan);
    
    //Kaohsiung
    NSDictionary *dKaohsiung = [dAllBloodStatus valueForKey:cKaohsiung];
    NSString *sKaohsiung = [NSString stringWithFormat:@"%@ %@ %@ %@ %@",
                         [dKaohsiung valueForKey:@"name"],
                         [dKaohsiung valueForKey:@"StorageA"],
                         [dKaohsiung valueForKey:@"StorageAB"],
                         [dKaohsiung valueForKey:@"StorageB"],
                         [dKaohsiung valueForKey:@"StorageO"]];
    [tableArray addObject:sKaohsiung];
    //NSLog(@"Kaohsiung:%@",sKaohsiung);
    
    //Hualian
    NSDictionary *dHualian = [dAllBloodStatus valueForKey:cHualian];
    NSString *sHualian = [NSString stringWithFormat:@"%@ %@ %@ %@ %@",
                            [dHualian valueForKey:@"name"],
                            [dHualian valueForKey:@"StorageA"],
                            [dHualian valueForKey:@"StorageAB"],
                            [dHualian valueForKey:@"StorageB"],
                            [dHualian valueForKey:@"StorageO"]];
    [tableArray addObject:sHualian];
    //NSLog(@"Hualian:%@",sHualian);


    [thisTableView reloadData];
}

-(BOOL)getBloodStatus
{
    //0) Init
    BOOL bSend = YES;
    
    NSString *sUrl = sGetBloodStatusJson;
    NSURL *url = [HttpEx toURL:sUrl];
    
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
    
    NSURLResponse *response;
    NSError *err;
    NSData *httpBody = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&err];
    
    __autoreleasing NSError* error =nil;
    dAllBloodStatus = [NSJSONSerialization JSONObjectWithData:httpBody options:NSJSONReadingMutableContainers error: &error];
    
    if(error != nil)
    {
        bSend = NO;
    }
    /*
     else
     {
     NSLog(@"dAllBloodStatus:%@",dAllBloodStatus);
     }
     */
    return bSend;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //NSLog(@"dAllBloodStatus:%@",dAllBloodStatus);
    if([self getBloodStatus])
    {
        [self showBloodStatus];
    }
    
    [NSTimer scheduledTimerWithTimeInterval:30 target:self selector:@selector(updateTime:) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updateTime:(NSTimer *)timer
{
    if([self getBloodStatus])
    {
        [self showBloodStatus];
    }
}

@end
