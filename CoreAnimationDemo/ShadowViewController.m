//
//  ShadowViewController.m
//  CoreAnimationDemo
//
//  Created by 凡客 on 2019/8/7.
//  Copyright © 2019 凡客. All rights reserved.
//

#import "ShadowViewController.h"

@interface ShadowViewController ()
@property (weak, nonatomic) IBOutlet UIView *bottom;
@property (weak, nonatomic) IBOutlet UIView *center;
@property (weak, nonatomic) IBOutlet UIView *top;

@end

@implementation ShadowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _bottom.layer.shadowRadius = 5;
    _bottom.layer.shadowColor = [UIColor redColor].CGColor;
    _bottom.layer.shadowOpacity = 0.5;
    _bottom.backgroundColor = [UIColor yellowColor];
    
    _bottom.layer.borderColor = [UIColor blackColor].CGColor;
    _bottom.layer.borderWidth = 1;
    _bottom.layer.cornerRadius = 5;
    
    _center.clipsToBounds = YES;
    _center.layer.cornerRadius = 5;
    
    _top.backgroundColor = [UIColor redColor];
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
