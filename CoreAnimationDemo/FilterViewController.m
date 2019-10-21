//
//  FilterViewController.m
//  CoreAnimationDemo
//
//  Created by 凡客 on 2019/8/13.
//  Copyright © 2019 凡客. All rights reserved.
//

#import "FilterViewController.h"

@interface FilterViewController ()
@property (weak, nonatomic) IBOutlet UIView *seven;
@property (weak, nonatomic) IBOutlet UIView *eight;

@end

@implementation FilterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImage *sevenImage = [UIImage imageNamed:@"7"];
    
    self.seven.layer.contents = (__bridge id)sevenImage.CGImage;
    self.seven.layer.contentsGravity = kCAGravityResizeAspect;
    self.seven.layer.magnificationFilter = kCAFilterNearest;
    
    UIImage *eightImage = [UIImage imageNamed:@"8"];
    self.eight.layer.contents = (__bridge id)eightImage.CGImage;
    self.eight.layer.contentsGravity = kCAGravityResizeAspect;
    
    
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
