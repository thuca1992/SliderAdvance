//
//  DemoSelector.m
//  ObjCExample
//
//  Created by Nguyen Thanh Tung on 6/27/15.
//  Copyright (c) 2015 Nguyen Thanh Tung. All rights reserved.
//

#import "DemoSelector.h"

@interface DemoSelector ()
{
    NSTimer* _timer;
}

@property (weak, nonatomic) IBOutlet UISlider *slider;

@property (weak, nonatomic) IBOutlet UIImageView *backgroud_slider;

@property (weak, nonatomic) IBOutlet UILabel *label;

@property (weak, nonatomic) IBOutlet UIImageView *image_label;

@property (weak, nonatomic) IBOutlet UISlider *btnCrunch;

@end

@implementation DemoSelector

- (void)viewDidLoad {
    [super viewDidLoad];
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(onTimer) userInfo:nil repeats:true];
    //hehe
    //self.slider.transform = CGAffineTransformMakeRotation(M_PI_2);
    self.slider.tintColor = [UIColor blackColor];
    self.slider.thumbTintColor = [UIColor grayColor];
    self.slider.value = 0;
    UIImage *thumb = [UIImage imageNamed:@"thumb"];
    [self.slider setThumbImage:thumb forState:UIControlStateNormal];
    
    [self performSelector:@selector(hideSlider) withObject:nil afterDelay:4];
    //[self performSelector:@selector(processData:) withObject:@{@"apple":@"tao", @"lemon":@"chanh"}];
    


}




- (IBAction) onCrunchData:(id)sender {
    [self performSelectorOnMainThread:@selector(doCrunchData) withObject:nil waitUntilDone:true];
    
}

- (void) hideSlider{
    self.slider.hidden = true;
}

- (void) doCrunchData{
    [NSThread sleepForTimeInterval:2];
}

- (void) processData: (NSDictionary*) data{
    for (NSString* key in [data allKeys]) {
        NSLog(@"%@ - %@",key, [data valueForKey:key]);
    }
}

- (void) onTimer{
    self.slider.value+=0.1f;

}



@end
