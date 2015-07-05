//
//  DemoFunction.m
//  ObjCExample
//
//  Created by Nguyen Thanh Tung on 6/27/15.
//  Copyright (c) 2015 Nguyen Thanh Tung. All rights reserved.
//

#import "DemoFunction.h"

@interface DemoFunction ()

@end

@implementation DemoFunction

- (void)viewDidLoad {
    [super viewDidLoad];
    [self sayFirstName:@"Steve" andLastName:@"Jobs"];
    float tempDegree = 30.1;
    NSString* result = [NSString stringWithFormat:@"%2.1f degree equal to %3.1f"
                                                    ,tempDegree, [self celciusToFahrenheigt:tempDegree]];
    [self writeln:result];
    [self performSelector:@selector(celciusToFahrenheigt2:) withObject:@(30.1)];
}

- (void) sayFirstName: (NSString*) firstName andLastName: (NSString*) lastname{
    NSLog(@"%@ %@",firstName,lastname);
}

- (float) celciusToFahrenheigt: (float) degree{
    return degree * 1.8 + 32.0;
}

- (void) celciusToFahrenheigt2: (NSNumber*) degree{
    float result = [degree floatValue]* 1.8 + 32.0;
    NSLog(@"Result = %2.1f",result);
}
@end
