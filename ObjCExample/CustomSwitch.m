//
//  CustomSwitch.m
//  ObjCExample
//
//  Created by Nguyen Thanh Tung on 7/12/15.
//  Copyright (c) 2015 Nguyen Thanh Tung. All rights reserved.
//

#import "CustomSwitch.h"

@implementation CustomSwitch{
    UIButton *btnOn;
    UIButton *btnOff;
    BOOL isOn;
}

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
    
    //Create On button
    UIImage *imgOnBackground = [UIImage imageNamed:@"on_black"];
    CGRect onRect = CGRectMake(0, 0, self.bounds.size.width/2, self.bounds.size.height);
    [self createButtonOn:imgOnBackground rect:onRect];
    
    // Create Off button
    UIImage *imgOffBackground = [UIImage imageNamed:@"off_white"];
    CGRect offRect =CGRectMake(btnOn.bounds.size.width, 0, self.bounds.size.width/2, self.bounds.size.height);
    [self createButtonOff:imgOffBackground rect:offRect];
    
    [self disableHightLight];

}

- (void)createButtonOn: (UIImage*)imgBackground rect:(CGRect)rect{
    btnOn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btnOn addTarget:self
              action:@selector(onButtonOnClick)
    forControlEvents:UIControlEventTouchUpInside];
    
    [btnOn setBackgroundImage:imgBackground forState:UIControlStateNormal];
    
    [btnOn setFrame:rect];
    
    [self addSubview:btnOn];


}

- (void)createButtonOff: (UIImage*)imgBackground rect:(CGRect)rect{
    btnOff = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btnOff addTarget:self
               action:@selector(onButtonOffClick)
     forControlEvents:UIControlEventTouchUpInside];
    
    [btnOff setBackgroundImage:imgBackground forState:UIControlStateNormal];
    
    [btnOff setFrame:rect];
    
    [self addSubview:btnOff];
}

- (void)changeButtonOnBackground: (UIImage*)imgOnBackground{
    [btnOn setBackgroundImage:imgOnBackground forState:UIControlStateNormal];

}

- (void)changeButtonOffBackground: (UIImage*)imgOffBackground{
    [btnOff setBackgroundImage:imgOffBackground forState:UIControlStateNormal];
    
}

- (void)onButtonOnClick{
    [self changeButtonWhenClick];
}

- (void)onButtonOffClick{
    [self changeButtonWhenClick];
}

- (void)changeButtonWhenClick{
    if (isOn) {
        [self changeButtonOnBackground:[UIImage imageNamed:@"on_black"]];
        [self changeButtonOffBackground:[UIImage imageNamed:@"off_white"]];
        isOn = false;
    }
    else{
        [self changeButtonOnBackground:[UIImage imageNamed:@"on_white"]];
        [self changeButtonOffBackground:[UIImage imageNamed:@"off_black"]];
        isOn = true;
    }
}

- (void)disableHightLight{
    btnOn.adjustsImageWhenHighlighted = NO;
    btnOff.adjustsImageWhenHighlighted = NO;
}

@end
