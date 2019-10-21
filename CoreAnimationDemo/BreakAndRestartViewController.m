//
//  BreakAndRestartViewController.m
//  CoreAnimationDemo
//
//  Created by 凡客 on 2019/9/11.
//  Copyright © 2019 凡客. All rights reserved.
//

#import "BreakAndRestartViewController.h"
#import "UIView+Animation.h"
#import "NSArray+functional.h"

typedef void(^AnimationCompleted)(void);

@interface BreakAndRestartViewController ()<CAAnimationDelegate>
@property (nonatomic, strong) UIView *demoView;
//@property (nonatomic, strong) CALayer *shipLayer;
//@property (nonatomic, strong) CALayer *presentationLayer;

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) NSArray<UIImageView *> *array;
@end

@implementation BreakAndRestartViewController

- (void)handleClickEvent {
    NSLog(@"xxx");
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.demoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.demoView.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:self.demoView];
    
//    self.shipLayer = [CALayer layer];
//    self.shipLayer.frame = CGRectMake(0, 0, 64, 64);
//    self.shipLayer.backgroundColor = [UIColor blueColor].CGColor;
    
//    [self.demoView.layer addSublayer:self.shipLayer];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    imageView.userInteractionEnabled = YES;
    
    [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleClickEvent)]];
    [self.view addSubview:imageView];
    imageView.image = [UIImage imageNamed:@"pic"];
    
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    imageView1.image = [UIImage imageNamed:@"8"];
//
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    imageView2.image = [UIImage imageNamed:@"7"];
    
    self.array = @[imageView, imageView1, imageView2];
//    [self reset];
    
//    [UIView animateKeyframesWithDuration:3 delay:0.0f options:UIViewKeyframeAnimationOptionAllowUserInteraction animations:^{
        imageView.layer.transform = CATransform3DMakeRotation(M_PI_4, 0, 1, 0);
//    } completion:^(BOOL finished) {
//
//    }];
    
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    rotationAnimation.fromValue = [NSNumber numberWithFloat:0];
    rotationAnimation.toValue = [NSNumber numberWithFloat:90 * M_PI / 180];
    rotationAnimation.duration = 3;
    rotationAnimation.fillMode = kCAFillModeForwards;
    rotationAnimation.removedOnCompletion = NO;
    rotationAnimation.delegate = self;
    
    [imageView.layer addAnimation:rotationAnimation forKey:nil];
    
    [UIView beginAnimations:@"" context:nil];
    [UIView commitAnimations];
    
    [CATransaction begin];
    [CATransaction commit];
    
//    NSTimeInterval interval = self.array.count * 1 + 3;
    
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(startAnimation) userInfo:nil repeats:YES];
    
    
//    [imageView rotate:90 secs:1 delegate:nil callback:nil];
//    [imageView curlDown:2];
//    [imageView curlDown:90];
    
//    [CATransaction begin];
//    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
//    rotationAnimation.fromValue = [NSNumber numberWithFloat:0];
//    rotationAnimation.toValue = [NSNumber numberWithFloat:90 * M_PI / 180];
//    rotationAnimation.duration = 1;
//    rotationAnimation.removedOnCompletion = NO;
//
//    [CATransaction setCompletionBlock:^{
//        //view.transform = CGAffineTransformRotate(view.transform, angle);
//    }];
//
//    [imageView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
//    [CATransaction commit];
    
//    [self rotateViewAnimated:imageView withDuration:1 byAngle:90 * M_PI / 180];
    
//    [UIView animateWithDuration:10 animations:^{
//        imageView.layer.transform = CATransform3DMakeRotation(M_PI_2, 0, 1, 0);
//    } completion:^(BOOL finished) {
//        imageView1.hidden = NO;
//        [UIView animateWithDuration:10 animations:^{
//            imageView1.layer.transform = CATransform3DMakeRotation(M_PI_2, 0, 1, 0);
//        } completion:^(BOOL finished) {
//            imageView2.hidden = NO;
//            [UIView animateWithDuration:10 animations:^{
//                imageView2.layer.transform = CATransform3DMakeRotation(M_PI_2, 0, 1, 0);
//            } completion:^(BOOL finished) {
//                imageView.layer.transform = CATransform3DMakeRotation(0, 0, 1, 0);
//                imageView1.layer.transform = CATransform3DMakeRotation(0, 0, 1, 0);
//                imageView1.hidden = YES;
//                imageView2.layer.transform = CATransform3DMakeRotation(0, 0, 1, 0);
//                imageView2.hidden = YES;
////                [imageView.layer removeAllAnimations];
////                [imageView1.layer removeAllAnimations];
////                [imageView2.layer removeAllAnimations];
//            }];
//        }];
//    }];
    
    [UIView animateKeyframesWithDuration:10 delay:0.0f options:UIViewKeyframeAnimationOptionAllowUserInteraction animations:^{
        
    } completion:^(BOOL finished) {
        
    }];
}

- (void)reset {
    for (UIImageView *imageView in self.array) {
        imageView.hidden = YES;
    }
}

- (void)startAnimation {
    
    void (^doAnimation)(UIImageView *imageView, AnimationCompleted completed) = ^(UIImageView *imageView, AnimationCompleted completed) {
        imageView.hidden = NO;
        [UIView animateKeyframesWithDuration:3 delay:0.0f options:UIViewKeyframeAnimationOptionAllowUserInteraction animations:^{
            imageView.layer.transform = CATransform3DMakeRotation(M_PI_2, 0, 1, 0);
        } completion:^(BOOL finished) {
            imageView.hidden = YES;
            if (completed) {
                completed();
            }
        }];
    };
    
//    [self.array pdd_reduce:<#(id)#> withBlock:^id(UIImageView *one, UIImageView *two) {
//
//    }];
    
//    NSUInteger count = self.array.count;
//    NSUInteger index = 0;
//    while (index < count) {
//        UIImageView *imageView = [self.array objectAtIndex:index];
//        doAnimation(imageView, ^(void){
//
//        });
//    }
    
    {
//        dispatch_queue_t queue = dispatch_queue_create("net.bujige.testQueue", DISPATCH_QUEUE_SERIAL);
        
        
        dispatch_queue_t queue = dispatch_get_main_queue();
        
        for (UIImageView *imageView in self.array) {
            
            dispatch_async(queue, ^{
                doAnimation(imageView, ^(void){
                    NSLog(@"xxx index = %@", @([self.array indexOfObject:imageView]));
                });
                // 追加任务 1
//                [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
//                NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
            });
//            dispatch_async(queue, ^{
//                // 追加任务 2
//                [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
//                NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
//            });
//            dispatch_async(queue, ^{
//                // 追加任务 3
//                [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
//                NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
//            });
        }
        
        
        NSLog(@"asyncSerial---end");
        
    }
}



- (void) rotateViewAnimated:(UIView*)view
               withDuration:(CFTimeInterval)duration
                    byAngle:(CGFloat)angle
{
    [CATransaction begin];
    CABasicAnimation *rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    rotationAnimation.byValue = [NSNumber numberWithFloat:angle];
    rotationAnimation.duration = duration;
    rotationAnimation.removedOnCompletion = YES;
    
    [CATransaction setCompletionBlock:^{
        //view.transform = CGAffineTransformRotate(view.transform, angle);
    }];
    
    [view.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    [CATransaction commit];
}

//- (void)animationDidStart:(CAAnimation *)anim {
//    NSLog(@"animationDidStart");
//}
//
//- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
//    NSLog(@"animationDidStop flag = %@", @(flag));
//    if (!flag) {
//        self.presentationLayer = self.shipLayer.presentationLayer;
//    }
//}

- (IBAction)start:(id)sender {
    
    [UIView animateWithDuration:4.0 animations:^{
        self.demoView.frame = CGRectMake(self.view.frame.size.width - 100, 0, 100, 100);
    } completion:^(BOOL finished) {
        
    }];
//    CABasicAnimation *animation = [CABasicAnimation animation];
//    animation.keyPath = @"position";
//    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(32, 32)];
//    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(300, 300)];
//    animation.duration = 4.0;
    
//    animation.removedOnCompletion = NO;
//    animation.fillMode = kCAFillModeForwards;
//    animation.delegate = self;
//
//    [self.shipLayer addAnimation:animation forKey:@"key"];
}

- (IBAction)stop:(id)sender {
//    [self.shipLayer removeAnimationForKey:@"key"];
    
    CFTimeInterval pauseTime = [self.demoView.layer convertTime:CACurrentMediaTime() fromLayer:nil];
    // 设置layer的timeOffset, 在继续操作也会使用到
    self.demoView.layer.timeOffset = pauseTime;
    // local time与parent time的比例为0, 意味着local time暂停了
    self.demoView.layer.speed = 0;
}

- (IBAction)restart:(id)sender {
    // 时间转换
    CFTimeInterval pauseTime = self.demoView.layer.timeOffset;
    // 计算暂停时间
    CFTimeInterval timeSincePause = CACurrentMediaTime() - pauseTime;
    // 取消
    self.demoView.layer.timeOffset = 0;
    // local time相对于parent time世界的beginTime
    self.demoView.layer.beginTime = timeSincePause;
    // 继续
    self.demoView.layer.speed = 1;
}

@end
