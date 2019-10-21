//
//  LayerViewController.m
//  CoreAnimationDemo
//
//  Created by 凡客 on 2019/8/6.
//  Copyright © 2019 凡客. All rights reserved.
//

#import "LayerViewController.h"

@interface LayerViewController ()
@property (weak, nonatomic) IBOutlet UIView *layerView;

@end

@implementation LayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    CALayer *blueLayer = [CALayer layer];
//    blueLayer.frame = CGRectMake(50, 50, 100, 100);
//    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
//    [self.layerView.layer addSublayer:blueLayer];
    
//    UIImage *image = [UIImage imageNamed:@"pic"];
//    self.layerView.layer.contents = (__bridge id)image.CGImage;
//    self.layerView.layer.contentsGravity = kCAGravityResizeAspect;
    
//    self.layerView.layer.contentsGravity = kCAGravityCenter;
//    self.layerView.layer.contentsScale = image.scale;
//    self.layerView.layer.contentsScale = [UIScreen mainScreen].scale;
    
    self.layerView.frame = CGRectMake(100, 100, 100, 40);
    UIImage *image = [UIImage imageNamed:@"right_bubble"];
    self.layerView.layer.contentsScale = image.scale;
    self.layerView.layer.contents = (__bridge id)image.CGImage;
    self.layerView.layer.contentsCenter = CGRectMake(0.25, 0.25, 0.75, 0.75);
    
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
