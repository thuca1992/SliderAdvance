//
//  SkewImage.m
//  ObjCExample
//
//  Created by Nguyen Thanh Tung on 7/12/15.
//  Copyright (c) 2015 Nguyen Thanh Tung. All rights reserved.
//

#import "SkewImage.h"
#import "CustomSlider.h"

@interface SkewImage ()
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet CustomSlider *slider;

@end

@implementation SkewImage

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setImage];
}

- (void)setImage{
    [self.image setImage:[UIImage imageNamed:@"skewimage.jpg"]];
}

- (void)skewImage: (UIImageView*) skewImage rotateAngle:(CGFloat) angle zCoordinate: (CGFloat)zCoordinate{
    if ( skewImage.layer.anchorPoint.x > 0.0 )
    {
        CGPoint position = skewImage.layer.position;
        position.x -= skewImage.layer.bounds.size.width / 3.0;
        skewImage.layer.anchorPoint = CGPointMake( 0, 0.5 );
        skewImage.layer.position = position;
    }
    
    CATransform3D t = CATransform3DIdentity;
    t.m34 = zCoordinate  ;
    t = CATransform3DRotate( t, M_PI / angle, 0.0, 1.0, 0.0 );
    skewImage.layer.transform = t;
}

- (IBAction)onValueChanged:(id)sender {
    
    int value = self.slider.value;
    int averageValue = (self.slider.maximumValue - self.slider.minimumValue) / 2 + self.slider.minimumValue;
    CGFloat zCoordinate;
    if (value < averageValue) {
        zCoordinate = -0.005;
    }
    else {
        zCoordinate = 0.005;
    }
    
    [self skewImage:_image rotateAngle:value/5 zCoordinate:zCoordinate];
    
}


@end
