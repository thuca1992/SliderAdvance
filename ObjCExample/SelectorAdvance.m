//
//  SelectorAdvance.m
//  ObjCExample
//
//  Created by Nguyen Thanh Tung on 7/3/15.
//  Copyright (c) 2015 Nguyen Thanh Tung. All rights reserved.
//

#import "SelectorAdvance.h"

@interface SelectorAdvance()

@property (weak, nonatomic) IBOutlet UISlider *slider;

@property (weak, nonatomic) IBOutlet UILabel *label;

@property (weak, nonatomic) IBOutlet UIImageView *imgSlider;

@property (weak, nonatomic) IBOutlet UIImageView *imgLabel;


@end

@implementation SelectorAdvance

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self customSlider];
    
    [self setBackground];
    
}

- (void) customSlider{
    [self.slider setThumbImage:[UIImage imageNamed:@"thumb.png"] forState:UIControlStateNormal];
    UIEdgeInsets inset = UIEdgeInsetsMake(0, 0, 0, 5);
    
    UIEdgeInsets insetMin = UIEdgeInsetsMake(0 , 5, 0, 0);
    
    UIEdgeInsets insetImage = UIEdgeInsetsMake(15, 10 , 15, 10);
    
    UIEdgeInsets insetImageLabel = UIEdgeInsetsMake(10, 24 , 10, 10);
    
    UIImage *imgImageLabel = [[UIImage imageNamed:@"image_label"]resizableImageWithCapInsets:insetImageLabel];
    
    UIImage *imgBackgroundSlider = [[UIImage imageNamed: @"abc"] resizableImageWithCapInsets:insetImage];
    
    UIImage* maxTrack = [[UIImage imageNamed: @"maxtrack.png"] resizableImageWithCapInsets:inset];
    
    UIImage* minTrack = [[UIImage imageNamed: @"mintrack.png"] resizableImageWithCapInsets:insetMin];
    
    
    [self.imgLabel setImage:imgImageLabel];
    // Set Image for imageview behind the slider
    [self.imgSlider setImage: imgBackgroundSlider];
    // Set image for slider's maxtrack
    [self.slider setMaximumTrackImage:maxTrack
                             forState:UIControlStateNormal];
    // Set image for slider's min track
    [self.slider setMinimumTrackImage:minTrack forState:UIControlStateNormal];
    
    // Set label and imageview behind slider position base on thumb position
    self.imgSlider.center = CGPointMake(self.slider.center.x, self.slider.center.y);
    self.label.center = [self getThumbPosition];
    self.imgLabel.center = [self getThumbPosition];
    self.imgLabel.alpha = 0.6f;
}

- (void) setBackground{
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"background.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    // Set background image
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
}

- (IBAction)onSliderChanged:(id)sender {
    self.imgLabel.center = [self getThumbPosition];
    // Set label position base on thumb position
    self.label.center = [self getThumbPosition];
    
    self.label.text = [NSString stringWithFormat:@"%2.0f", self.slider.value];
}

- (CGPoint) getThumbPosition{
    // Get slider position
    CGFloat sliderPosition = self.slider.center.x;
    // Slider max position
    CGFloat sliderMaxPosition = sliderPosition + self.slider.bounds.size.width/2;
    // Slider min position
    CGFloat sliderMinPosition = sliderPosition - self.slider.bounds.size.width/2;
    
    // Ratio between current slider's value and slider
    CGFloat ratio = (self.slider.value - self.slider.minimumValue ) / (self.slider.maximumValue -self.slider.minimumValue);
    // Calculate current position of thumb
    CGFloat thumbCurrentPosition = sliderMinPosition + (sliderMaxPosition - sliderMinPosition )* ratio;

    return CGPointMake(thumbCurrentPosition, self.slider.center.y - 40);
}


@end
