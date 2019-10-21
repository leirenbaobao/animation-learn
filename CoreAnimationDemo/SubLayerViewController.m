//
//  SubLayerViewController.m
//  CoreAnimationDemo
//
//  Created by 凡客 on 2019/8/9.
//  Copyright © 2019 凡客. All rights reserved.
//

#import "SubLayerViewController.h"

@interface SubLayerViewController ()
@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation SubLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIBezierPath *path = [UIBezierPath new];
    [path addArcWithCenter:CGPointMake(150, 100) radius:25 startAngle:0 endAngle:2 * M_PI clockwise:YES];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.strokeColor = [UIColor redColor].CGColor;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.lineWidth = 5;
    layer.lineJoin = kCALineJoinRound;
    layer.lineCap = kCALineCapRound;
    layer.path = path.CGPath;
    
    [self.containerView.layer addSublayer:layer];
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
