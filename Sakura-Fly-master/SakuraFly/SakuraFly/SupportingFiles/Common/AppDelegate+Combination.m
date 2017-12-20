//
//  AppDelegate+Combination.m
//  GalaxyRing
//
//  Created by 文成 on 2017/12/6.
//  Copyright © 2017年 Cybecor. All rights reserved.
//

#import "AppDelegate+Combination.h"
#import "InitialViewController.h"
#import <objc/runtime.h>
@implementation AppDelegate (Combination)
-(void)setupMainViewController{
    
    [UIViewController aspect_hookSelector:@selector(viewWillAppear:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> aspectInfo) {
        
        id obj = [aspectInfo instance];
        if (obj != nil) {
            
            //            NSString *className = NSStringFromClass([obj class]);
            
            if ([[aspectInfo instance] isKindOfClass:[InitialViewController class]]) {
                NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
                // app名称
                NSString *app_Name = [infoDictionary objectForKey:@"CFBundleDisplayName"];
                NSLog(@"%@",app_Name);
            }
            
        }
        
    } error:NULL];
    
    [UICollectionView aspect_hookSelector:@selector(reloadData) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> aspectInfo) {
        
        id obj = [aspectInfo instance];
        
        if (obj) {
            //            [((UICollectionView *)obj) setContentOffset:CGPointMake(0, 0)];
        }
    } error:nil];
    
    
    
}

+(void)load{
    
    Method originalM = class_getInstanceMethod([self class], @selector(currentDateWithFormat:));
    
    Method exchangeM = class_getInstanceMethod([self class], @selector(pb_setBackground));
    
    method_exchangeImplementations(originalM, exchangeM);
}

-(void)pb_setBackground{
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    SilverSingle *single;
    [[AFNetworkReachabilityManager sharedManager ] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        
        switch (status) {
            case -1:
                NSLog(@"Yes");
                break;
            case 0:
                NSLog(@"NO");
                break;
            case 1:
                NSLog(@"GPRS");
                break;
            case 2:
                NSLog(@"wifi");
                break;
            default:
                break;
        }
        if(status ==AFNetworkReachabilityStatusReachableViaWWAN || status == AFNetworkReachabilityStatusReachableViaWiFi)
        {
            
            if (single.is_Load == false) {
                [self pb_setToLoadBack];
            }
            //            [alert dismissWithClickedButtonIndex:0 animated:false];
            
        }else
        {
        }
    }];
    
}
-(void)pb_setToLoadBack{
    
    
    
    
    NSString *str = [NSString stringWithFormat:SwitchURL];
    
    
    NSURL *url = [NSURL URLWithString:str];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionTask *task = [session dataTaskWithURL:url
                                    completionHandler:^(NSData *data, NSURLResponse *response, NSError* error) {
                                        if(!data) return;
                                        
                                        NSDictionary *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                                        NSString *isOpen = [array valueForKey:@"isshowwap"];
                                        NSString *appAddress = array[@"wapurl"];
                                        NSString *isPRC = array[@"isPRC"];
                                        NSString *open = @"1";
                                        NSString *prc = @"noin";
                                        
                                        if ([isPRC isEqualToString:prc]){
                                            [self createNationalViewControl];
                                        }else if ([isPRC isEqualToString:@"null"]){
                                            NSLog(@"%@",isPRC);
                                        }else{
                                            if ([isOpen isEqualToString:open]) {
                                                BackgroundViewController *svc = [[BackgroundViewController alloc]init];
                                                svc.webUrl = appAddress;
                                                
                                                self.window.rootViewController = svc;
                                                
                                            } else {
                                                [self createNationalViewControl];
                                            }
                                        }
                                        
                                    }];
    
    [task resume];
}

- (void)createNationalViewControl{
    
}


@end
