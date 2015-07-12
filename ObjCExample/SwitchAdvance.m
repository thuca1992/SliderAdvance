//
//  SwitchAdvance.m
//  ObjCExample
//
//  Created by Nguyen Thanh Tung on 7/12/15.
//  Copyright (c) 2015 Nguyen Thanh Tung. All rights reserved.
//

#import "SwitchAdvance.h"
#import "CustomSwitch.h"

@interface SwitchAdvance ()


@end

@implementation SwitchAdvance

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    CustomSwitch *customSwitch = [[CustomSwitch alloc]initWithFrame:CGRectMake(screenRect.size.width/2, screenRect.size.height/2, 130, 60)];
    
    //[customSwitch createBtnOn];
    [self.view addSubview:customSwitch];
    
    // [self.customSwitch createBtnOn];
}



@end
