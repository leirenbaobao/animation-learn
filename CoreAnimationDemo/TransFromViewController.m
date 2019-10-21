//
//  TransFromViewController.m
//  CoreAnimationDemo
//
//  Created by 凡客 on 2019/8/8.
//  Copyright © 2019 凡客. All rights reserved.
//

#import "TransFromViewController.h"

@interface TransFromViewController ()
@property (weak, nonatomic) IBOutlet UIView *layerView;
@property (weak, nonatomic) IBOutlet UIView *layerView2;

@end

@implementation TransFromViewController

CGAffineTransform CGAffineTransformMakeShear(CGFloat x, CGFloat y) {
    CGAffineTransform transform = CGAffineTransformIdentity;
    transform.c = -x;
    transform.b = y;
    return transform;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
//    CGAffineTransform tranform = CGAffineTransformMakeRotation(M_PI);
//    self.layerView.layer.affineTransform = tranform;
    
//    CGAffineTransform transform = CGAffineTransformIdentity;
//    transform = CGAffineTransformScale(transform, 0.5, 0.5);
//    transform = CGAffineTransformRotate(transform, M_PI / 180.0 * 30.0);
//    transform = CGAffineTransformTranslate(transform, 200, 0);
    
//    self.layerView.layer.affineTransform = CGAffineTransformMakeShear(1, 0);
    
    
//    self.layerView.layer.affineTransform = transform;
    
//    CATransform3D transform = CATransform3DIdentity;
//    transform.m34 = - 1.0 / 500;
//    transform = CATransform3DRotate(transform, M_PI_4, 0, 1, 0);
//    self.layerView.layer.transform = transform;
    UIImage *image = [UIImage imageNamed:@"pic"];
    self.layerView.layer.contents = (__bridge id)image.CGImage;
//    self.layerView2.layer.contents = (__bridge id)image.CGImage;
//
//    CATransform3D transform = CATransform3DIdentity;
//    transform.m34 = 1.0 / -500.0;
//    self.view.layer.sublayerTransform = transform;
    
//    transform = CATransform3DMakeRotation(M_PI, 0, 1, 0);
    CATransform3D transform1 = CATransform3DIdentity;
    transform1 = CATransform3DRotate(transform1, M_PI, 0, 1, 0);
    self.layerView.layer.transform = transform1;
//
//    CATransform3D transform2 = CATransform3DIdentity;
//    transform2 = CATransform3DRotate(transform2, M_PI_4, 0, 1, 0);
//    self.layerView2.layer.transform = transform2;
    
    //rotate layerView1 by 45 degrees along the Y axis
//    CATransform3D transform1 = CATransform3DMakeRotation(M_PI_4, 0, 1, 0);
//    self.layerView.layer.transform = transform1;
//    //rotate layerView2 by 45 degrees along the Y axis
//    CATransform3D transform2 = CATransform3DMakeRotation(-M_PI_4, 0, 1, 0);
//    self.layerView2.layer.transform = transform2;
    
}
- (IBAction)start:(id)sender {
}

- (IBAction)break:(id)sender {
}

@end
