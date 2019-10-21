//
//  CAAnimationViewController.m
//  CoreAnimationDemo
//
//  Created by 凡客 on 2019/8/9.
//  Copyright © 2019 凡客. All rights reserved.
//

#import "CAAnimationViewController.h"

@interface CAAnimationViewController ()
@property (weak, nonatomic) IBOutlet UIView *myView;
@property (strong, nonatomic) CALayer *colorLayer;
@end

@implementation CAAnimationViewController

- (IBAction)print:(id)sender {
    //NSLog(@"count = %@", @(self.myView.layer.animationKeys.count));
    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat)INT_MAX;
    CGFloat blue = arc4random() / (CGFloat)INT_MAX;
    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"backgroundColor";
    animation.toValue = (__bridge id)color.CGColor;
    
    [self.colorLayer addAnimation:animation forKey:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = self.myView.bounds;
    
    self.colorLayer.backgroundColor = [UIColor blueColor].CGColor;
    [self.myView.layer addSublayer:self.colorLayer];
    
    
    UIBezierPath *bezierPath = [[UIBezierPath alloc] init];
    [bezierPath moveToPoint:CGPointMake(0, 150)];
    [bezierPath addCurveToPoint:CGPointMake(300, 150) controlPoint1:CGPointMake(75, 0) controlPoint2:CGPointMake(225, 300)];

    //create the position animation
    CAKeyframeAnimation *animation1 = [CAKeyframeAnimation animation];
    animation1.keyPath = @"position";
    animation1.path = bezierPath.CGPath;
    animation1.rotationMode = kCAAnimationRotateAuto;
    //create the color animation
    CABasicAnimation *animation2 = [CABasicAnimation animation];
    animation2.keyPath = @"backgroundColor";
    animation2.toValue = (__bridge id)[UIColor redColor].CGColor;
    //create group animation
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.animations = @[animation1, animation2];
    groupAnimation.duration = 4.0;
    //add the animation to the color layer
//
    groupAnimation.removedOnCompletion = NO;
    groupAnimation.fillMode = kCAFillModeForwards;
//
    [self.myView.layer addAnimation:groupAnimation forKey:@"12"];
//    NSLog(@"count = %@", @(self.myView.layer.animationKeys.count));
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
