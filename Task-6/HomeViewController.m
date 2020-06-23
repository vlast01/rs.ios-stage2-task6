//
//  HomeViewController.m
//  Task-6
//
//  Created by Владислав Станкевич on 6/21/20.
//  Copyright © 2020 Владислав Станкевич. All rights reserved.
//

#import "HomeViewController.h"
#import "UIColor+HexToUIColor.h"
#import "NavigationController.h"
#import "TabBarViewController.h"



@interface HomeViewController ()



@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIView *buttonView = [UIView new];
    UIView *labelView = [UIView new];
    
    UILabel *label = [UILabel new];
    label.text = @"Are you ready?";
    label.font = [UIFont systemFontOfSize:24 weight:UIFontWeightMedium];
    label.translatesAutoresizingMaskIntoConstraints = NO;
     [labelView addSubview:label];
    
    UIStackView *stackView = [UIStackView new];
    stackView.translatesAutoresizingMaskIntoConstraints = NO;
    stackView.axis = UILayoutConstraintAxisVertical;
    stackView.distribution = UIStackViewDistributionFillEqually;
    
   // stackView.backgroundColor = [UIColor lightGrayColor];
  

    
    
    CAShapeLayer *circle = [CAShapeLayer layer];
   // [circle setPath:[[UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 70, 70)] CGPath]];
    
    [circle setPath:[[UIBezierPath bezierPathWithArcCenter:CGPointMake(0,0) radius:35 startAngle:0 endAngle:M_PI *  2 clockwise:YES] CGPath]];
    
    circle.fillColor =[UIColor colorWithHex:0xEE686A].CGColor;
    
    UIView *circleContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 70, 70)];;
    [[circleContainer layer] addSublayer:circle];
    [circle setPosition:circleContainer.center];
    circleContainer.translatesAutoresizingMaskIntoConstraints = NO;
    
    UIView *circleView = [UIView new];
    [circleView addSubview:circleContainer];
   
    [self.view addSubview:circleView];
    circleView.translatesAutoresizingMaskIntoConstraints = NO;
    
    
    UIView *rect = [[UIView alloc] initWithFrame:CGRectMake(0,0,70,70)];
    rect.translatesAutoresizingMaskIntoConstraints = NO;
    rect.backgroundColor = [UIColor colorWithHex:0x29C2D1];
    
    UIView *rectContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 70, 70)];
    rectContainer.backgroundColor = [UIColor redColor];
    rectContainer.translatesAutoresizingMaskIntoConstraints = NO;
    [rectContainer addSubview:rect];
    
    UIView *rectView = [UIView new];
    rectView.translatesAutoresizingMaskIntoConstraints = NO;
    [rectView addSubview:rectContainer];
    
    
    UIBezierPath *path = [UIBezierPath new];
    [path moveToPoint:(CGPoint){0, 0}];
    [path addLineToPoint:(CGPoint){0, 46.7}];
    [path addLineToPoint:(CGPoint){-40.5, -23.3}];
    [path addLineToPoint:(CGPoint){40.5, -23.3}];
    [path addLineToPoint:(CGPoint){0, 46.7}];
    
    CAShapeLayer *triangle = [CAShapeLayer new];
    triangle.fillColor = [UIColor colorWithHex:0x34C1A1].CGColor;
    triangle.path = path.CGPath;
    UIView *triangleView = [UIView new];
    triangleView.translatesAutoresizingMaskIntoConstraints = NO;
    
    UIView *triangleContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 81, 81)];
    triangleContainer.translatesAutoresizingMaskIntoConstraints = NO;
    [[triangleContainer layer] addSublayer:triangle];
    [triangle setPosition:triangleContainer.center];
    [triangleView addSubview:triangleContainer];
    
    
    UIStackView *figures = [UIStackView new];
    figures.translatesAutoresizingMaskIntoConstraints = NO;
    figures.axis = UILayoutConstraintAxisHorizontal;
    figures.distribution = UIStackViewDistributionFillEqually;
    [figures addArrangedSubview:circleView];
    [figures addArrangedSubview:rectView];
    [figures addArrangedSubview:triangleView];
    
    
    UIButton *button = [UIButton new];
    button.layer.cornerRadius = 20;
    [button setTitle:@"START" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:20 weight:UIFontWeightMedium];
    [button setTitleColor:[UIColor colorWithHex:0x101010] forState:normal];
    button.backgroundColor = [UIColor colorWithHex:0xF9CC78];
    button.translatesAutoresizingMaskIntoConstraints = NO;

    [buttonView addSubview:button];
   
    [stackView addArrangedSubview:labelView];
    [stackView addArrangedSubview:figures];
    [stackView addArrangedSubview:buttonView];

    
    [self.view addSubview:stackView];
    
    
    

    [NSLayoutConstraint activateConstraints:@[
        [label.centerYAnchor constraintEqualToAnchor:labelView.centerYAnchor],
        [button.centerYAnchor constraintEqualToAnchor:buttonView.centerYAnchor],
        [button.leadingAnchor constraintEqualToAnchor:button.trailingAnchor constant:-300],
        [button.centerXAnchor constraintEqualToAnchor:buttonView.centerXAnchor],
        [stackView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:50],
        [stackView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-50],
        [stackView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:50],
        [stackView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-50],
        [button.topAnchor constraintEqualToAnchor:button.bottomAnchor constant:-55],
        [label.centerXAnchor constraintEqualToAnchor:stackView.centerXAnchor],
        
        [triangleContainer.centerXAnchor constraintEqualToAnchor:triangleView.centerXAnchor constant:-40],
        [circleContainer.centerXAnchor constraintEqualToAnchor:circleView.centerXAnchor constant:-35],
        
        [rectContainer.centerXAnchor constraintEqualToAnchor:rectView.centerXAnchor constant:-35]
 
    ]];

    self.view.backgroundColor = [UIColor whiteColor];
    
    [button addTarget:self action:@selector(changeVC) forControlEvents:UIControlEventTouchUpInside];
    

    
    CABasicAnimation *rectAnimation = [CABasicAnimation animation];
    rectAnimation.keyPath = @"position.y";
    rectAnimation.fromValue = @(rect.frame.size.height/10+rect.frame.size.height/2);
    rectAnimation.toValue = @(-rect.frame.size.height/10+rect.frame.size.height/2);
    rectAnimation.duration = 1;
    rectAnimation.autoreverses=YES;
    rectAnimation.repeatCount = HUGE_VALF;

    [[rect layer] addAnimation:rectAnimation forKey:@"animatePosition"];
    

    
    
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    rotationAnimation.duration = 1;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount =  HUGE_VALF;

    [triangle addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    
   // circle.anchorPoint = CGPointMake(35, 35);
    
    CABasicAnimation *pulseAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    pulseAnimation.duration = 1;
    pulseAnimation.fromValue = [NSNumber numberWithFloat:1.1];
    pulseAnimation.toValue = [NSNumber numberWithFloat:0.9];
    pulseAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pulseAnimation.autoreverses = YES;
    pulseAnimation.repeatCount = HUGE_VALF;
    
    [circle addAnimation:pulseAnimation forKey:nil];
    
 //   rectView.backgroundColor = [UIColor blackColor];
  //  rect.backgroundColor = [UIColor greenColor];
    
    
    
}

- (void)changeVC{
    
//    UIViewController *tabBarController = [TabBarViewController new];
//
//    UINavigationController *navigationController = [[NavigationController alloc] initWithRootViewController:tabBarController];;
//    navigationController.navigationBar.hidden = YES;
    
    UITabBarController *tabBarController = [TabBarViewController new];
    
    self.view.window.rootViewController = tabBarController;
    
}



@end
