//
//  LayerManualViewController.m
//  CoreAnimationDemo
//
//  Created by 凡客 on 2019/8/7.
//  Copyright © 2019 凡客. All rights reserved.
//

#import "LayerManualViewController.h"

// 实现CALayerDelegate绘制图层
@interface LayerManualViewController ()<CALayerDelegate>

@end

@implementation LayerManualViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CALayer *blueLayer = [CALayer layer];
    blueLayer.frame = CGRectMake(50, 50, 100, 100);
    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    blueLayer.contentsScale = [UIScreen mainScreen].scale;
    
    blueLayer.delegate = self;
    
    [self.view.layer addSublayer:blueLayer];
    
    [blueLayer display];
    
    // anchorPoint
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    CGContextSetLineWidth(ctx, 10);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextStrokeEllipseInRect(ctx, layer.bounds);
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
