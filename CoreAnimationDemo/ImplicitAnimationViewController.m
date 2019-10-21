//
//  ImplicitAnimationViewController.m
//  CoreAnimationDemo
//
//  Created by 凡客 on 2019/8/6.
//  Copyright © 2019 凡客. All rights reserved.
//

#import "ImplicitAnimationViewController.h"

@interface ImplicitAnimationViewController ()
@property (weak, nonatomic) IBOutlet UIView *layerView;
@property (nonatomic, strong)  CALayer *colorLayer;
@property (nonatomic, assign) BOOL clicked;
@end

@implementation ImplicitAnimationViewController

- (IBAction)btnEvent:(id)sender {
    if (self.clicked) {
        return;
    }
    NSLog(@"button clicked");
    [CATransaction begin];
    [CATransaction setAnimationDuration:2];
    [CATransaction setCompletionBlock:^{
        NSLog(@"completed");
    }];
    
//
    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat)INT_MAX;
    CGFloat blue = arc4random() / (CGFloat)INT_MAX;
    self.layerView.layer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;
    
    [CATransaction commit];
    
    self.clicked = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.colorLayer = [CALayer layer];
//    self.colorLayer.frame = CGRectMake(50.0f, 50.0f, 100.0f, 100.0f);
//    self.colorLayer.backgroundColor = [UIColor blueColor].CGColor;
//    //add it to our view
//    [self.layerView.layer addSublayer:self.colorLayer];

//    self.layerView.layer.backgroundColor = [UIColor blueColor].CGColor;
    
    [CATransaction begin];
    UIView *container = [[UIView alloc] initWithFrame:CGRectMake(150, 200, 100, 100)];
    container.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
    [self.view addSubview:container];
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:container.bounds];
    label1.backgroundColor = [UIColor redColor];
    label1.text = @"1";
    label1.font = [UIFont boldSystemFontOfSize:30];
    label1.textAlignment = NSTextAlignmentCenter;
    [container addSubview:label1];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:container.bounds];
    label2.backgroundColor = [UIColor orangeColor];
    label2.text = @"2";
    label2.font = [UIFont boldSystemFontOfSize:30];
    label2.textAlignment = NSTextAlignmentCenter;
    [container addSubview:label2];
    
    [CATransaction commit];
    
    CATransition *fade = [[CATransition alloc] init];
    fade.duration = 2;
    fade.type = kCATransitionPush;
    fade.subtype = kCATransitionFromRight;

    //位置1
    [container.layer addAnimation:fade forKey:nil];
    //位置2
    [container insertSubview:label2 belowSubview:label1];

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
