//
//  CustomSlider.m
//  ObjCExample
//
//  Created by Nguyen Thanh Tung on 7/12/15.
//  Copyright (c) 2015 Nguyen Thanh Tung. All rights reserved.
//

#import "CustomSlider.h"
#import <UIKit/UIKit.h>

@implementation CustomSlider

- (id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
       
        [self createView];

    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        [self createView];
    }
    return self;
}

- (void)createView{
    [self setThumbImage:[UIImage imageNamed:@"thumb.png"] forState:UIControlStateNormal];
    UIEdgeInsets inset = UIEdgeInsetsMake(0, 0, 0, 5);
    
    UIEdgeInsets insetMin = UIEdgeInsetsMake(0 , 5, 0, 0);
    
    UIImage* maxTrack = [[UIImage imageNamed: @"maxtrack.png"] resizableImageWithCapInsets:inset];
    
    UIImage* minTrack = [[UIImage imageNamed: @"mintrack.png"] resizableImageWithCapInsets:insetMin];
    
    // Set image for slider's maxtrack
    [self setMaximumTrackImage:maxTrack
                      forState:UIControlStateNormal];
    // Set image for slider's min track
    [self setMinimumTrackImage:minTrack forState:UIControlStateNormal];
}

@end
