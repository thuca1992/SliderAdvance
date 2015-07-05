//
//  SelectorAdvance3.m
//  ObjCExample
//
//  Created by Nguyen Thanh Tung on 7/4/15.
//  Copyright (c) 2015 Nguyen Thanh Tung. All rights reserved.
//

#import "SelectorAdvance3.h"

@interface SelectorAdvance3 ()
@property (weak, nonatomic) IBOutlet UISlider *slider;

@property (weak, nonatomic) IBOutlet UISlider *slider2;

@end

@implementation SelectorAdvance3

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createSlider];
    
    
    [self setBackground];
    
    //[self customSlider:_slider];
    self.slider.hidden = true;
    self.slider2.hidden = true;
    
    //[self customSlider:_slider2];

}

- (void) setBackground{
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    
    [[UIImage imageNamed:@"background3.png"] drawInRect:self.view.bounds];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];

}

- (void) customSlider: (UISlider*) slider{
    [slider setThumbImage:[UIImage imageNamed:@"thumb3.png"] forState:UIControlStateNormal];
    
    UIEdgeInsets insetMin = UIEdgeInsetsMake(0 , 5, 0, 0);
    
    UIEdgeInsets insetMax = UIEdgeInsetsMake(0, 0, 0, 5);
    
    UIImage* maxTrack = [[UIImage imageNamed: @"maxtrack3.png"] resizableImageWithCapInsets:insetMax];
    UIImage* minTrack = [[UIImage imageNamed: @"mintrack3.png"] resizableImageWithCapInsets:insetMin];
    
    
    // Set image for slider's maxtrack
    [slider setMaximumTrackImage:maxTrack forState:UIControlStateNormal];
    
    [slider setMinimumTrackImage:minTrack forState:UIControlStateNormal];
    
    slider.transform = CGAffineTransformMakeRotation(M_PI_2);
    
   // [self createLineBehindSlider:slider];
    // Set background image
    
}


- (void) createLineBehindSlider: (UISlider*)slider andLineWidth:(CGFloat) lineWidth{
    
    // Get slider position
    CGFloat sliderPosition = slider.center.y;
    // Slider max position
    CGFloat sliderMaxPosition = sliderPosition + slider.bounds.size.width/2;
    // Slider min position
    CGFloat sliderMinPosition = sliderPosition - slider.bounds.size.width/2;
    
    CGFloat linePosition;
    
    for(int i = 0; i < 9; i++){
         linePosition = sliderMinPosition + (sliderMaxPosition - sliderMinPosition )* i/9;
        
        UIImageView *line =[[UIImageView alloc] initWithFrame:CGRectMake(slider.center.x,linePosition,3,40)];
         NSLog(@"%f ", linePosition);
        line.image=[UIImage imageNamed:@"line.png"];
        
        [self.view addSubview:line];

        line.transform = CGAffineTransformMakeRotation(M_PI_2);

    }
        
}

- (void) createSlider{
    CGSize mainSize = [UIScreen mainScreen].bounds.size;
    
    CGFloat lineWidth = 40;
    
    CGFloat sliderPositionX = 0;
    
    for(int i = 0; i < 5; i++){
        
        sliderPositionX+= lineWidth;
        
        UISlider *slider = [[UISlider alloc]initWithFrame:CGRectMake(sliderPositionX, mainSize.height/2, 200, 20)];
        
        [slider setThumbImage:[UIImage imageNamed:@"thumb3.png"] forState:UIControlStateNormal];
        
        UIEdgeInsets insetMin = UIEdgeInsetsMake(0 , 5, 0, 0);
        
        UIEdgeInsets insetMax = UIEdgeInsetsMake(0, 0, 0, 5);
        
        UIImage* maxTrack = [[UIImage imageNamed: @"maxtrack3.png"] resizableImageWithCapInsets:insetMax];
        
        UIImage* minTrack = [[UIImage imageNamed: @"mintrack3.png"] resizableImageWithCapInsets:insetMin];
        
        // Set image for slider's maxtrack
        [slider setMaximumTrackImage:maxTrack forState:UIControlStateNormal];
        
        [slider setMinimumTrackImage:minTrack forState:UIControlStateNormal];
        
        slider.transform = CGAffineTransformMakeRotation(M_PI_2);
        
        [self.view addSubview:slider];
        
        [self createLineBehindSlider:slider andLineWidth:lineWidth];

    }
}


@end
