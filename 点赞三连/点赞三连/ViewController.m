//
//  ViewController.m
//  点赞三连
//
//  Created by 949699582 on 2019/8/28.
//  Copyright © 2019 com.cunyin.paywaiter. All rights reserved.
//

#import "ViewController.h"
#import "masonry.h"
@interface ViewController ()

@end

@implementation ViewController
{
    UIButton *btn1;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGFloat padding = 10;
    
    UIView *custom_view = [[UIView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.height, 100)];
    [custom_view setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:custom_view];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(0, 0, 0, 0);
    [btn1 setBackgroundColor:[UIColor redColor]];
    
    [btn1 setImage:[UIImage imageNamed:@"dianzan_start"] forState:UIControlStateNormal];
    [btn1 setImageEdgeInsets:UIEdgeInsetsMake(20, 20, 20, 20)];
    // 设置图片缩放比例
    btn1.imageView.contentMode = UIViewContentModeScaleAspectFit;
    btn1.imageView.backgroundColor = [UIColor whiteColor];
    btn1.imageView.layer.cornerRadius = 20;
    btn1.imageView.layer.masksToBounds = YES;
    NSLog(@"width =%lf",btn1.imageView.frame.size.width);
    
    [custom_view addSubview:btn1];
    
    [btn1 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(0, 0, 0, 0);
    [btn2 setBackgroundColor:[UIColor blueColor]];
    [custom_view addSubview:btn2];
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn3.frame = CGRectMake(0, 0, 0, 0);
    [btn3 setBackgroundColor:[UIColor greenColor]];
    [custom_view addSubview:btn3];
    
    [custom_view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(100);
        make.left.right.equalTo(self.view).with.offset(0);
        make.height.mas_equalTo(100);
    }];
    
    /**********  等宽布局   ***********/
    [btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.equalTo(custom_view).insets(UIEdgeInsetsMake(padding, padding, padding, 0));
        make.right.equalTo(btn2.mas_left).offset(-padding);
    }];
    [btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(custom_view).insets(UIEdgeInsetsMake(padding, 0, padding, 0));
        make.right.equalTo(btn3.mas_left).offset(-padding);
    }];
    [btn3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.equalTo(custom_view).insets(UIEdgeInsetsMake(padding, 0, padding, padding));
        make.width.equalTo(@[btn1, btn2]);
    }];
    
//    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longTap:)];
//    longPress.allowableMovement = NO;
//    longPress.minimumPressDuration = 1;
//    [btn1 addGestureRecognizer:longPress];
    
    /**********  等高   ***********/
//    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.top.equalTo(self.view).insets(UIEdgeInsetsMake(padding, padding, 0, padding));
//        make.bottom.equalTo(blueView.mas_top).offset(-padding);
//    }];
//    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.equalTo(self.view).insets(UIEdgeInsetsMake(0, padding, 0, padding));
//        make.bottom.equalTo(yellowView.mas_top).offset(-padding);
//    }];
//
//    /**
//     下面设置make.height的数组是关键，通过这个数组可以设置这三个视图高度相等。其他例如宽度之类的，也是类似的方式。
//     */
//    [yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.bottom.equalTo(self.view).insets(UIEdgeInsetsMake(0, padding, padding, padding));
//        make.height.equalTo(@[blueView, redView]);
//    }];

}

- (void)longTap:(id)sender{
    CGPoint p = [(UILongPressGestureRecognizer *)sender locationInView:btn1];
    
    NSLog(@"press at %f, %f", p.x, p.y);
}

- (void)btnAction:(UIButton *)btn{
    
    static int i = 0;
    [btn1 setImage:[UIImage imageNamed:(i%2==0?@"dianzan_start":@"dianzan_end")] forState:UIControlStateNormal];
    CAKeyframeAnimation *k = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    k.values = @[@(0.1),@(1.0),@(1.5)];
    k.keyTimes = @[@(0.0),@(0.5),@(0.8),@(1.0)];
    k.calculationMode = kCAAnimationLinear;
    i++;
    [btn1.layer addAnimation:k forKey:@"SHOW"];
}



@end
