//
//  RSSchoolViewController.m
//  Task-6
//
//  Created by Владислав Станкевич on 6/21/20.
//  Copyright © 2020 Владислав Станкевич. All rights reserved.
//

#import "RSSchoolViewController.h"
#import "UIColor+HexToUIColor.h"
#import <sys/utsname.h>
#import "HomeViewController.h"

@interface RSSchoolViewController ()

@property (nonatomic,strong)UIStackView *buttonStackView;

@end

@implementation RSSchoolViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *infoView = [UIView new];
    
    UILabel *nameLabel = [UILabel new];
    UILabel *phoneLabel = [UILabel new];
    UILabel *iosLabel = [UILabel new];
    
    UIView *gitButtonContainer = [UIView new];
    gitButtonContainer.translatesAutoresizingMaskIntoConstraints = NO;
    UIView *startButtonContainer = [UIView new];
    startButtonContainer.translatesAutoresizingMaskIntoConstraints = NO;
    
    nameLabel.text = [NSString stringWithFormat:@"%@", [[UIDevice currentDevice] name]];
    nameLabel.font = [UIFont systemFontOfSize:17 weight:UIFontWeightSemibold];
    nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [infoView addSubview:nameLabel];
    
    phoneLabel.text = [NSString stringWithFormat:@"%@", [[UIDevice currentDevice] model]];
    phoneLabel.font = [UIFont systemFontOfSize:17 weight:UIFontWeightSemibold];
    phoneLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [infoView addSubview:phoneLabel];
    
    iosLabel.text = [NSString stringWithFormat:@"iOS %@", [[UIDevice currentDevice] systemVersion]];
    iosLabel.font = [UIFont systemFontOfSize:17 weight:UIFontWeightSemibold];
    iosLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [infoView addSubview:iosLabel];
    
    
    UIImageView *appleImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];;
    appleImage.translatesAutoresizingMaskIntoConstraints = NO;
    //appleImage.backgroundColor = [UIColor redColor];
    appleImage.image = [UIImage imageNamed:@"apple"];
    appleImage.contentMode =UIViewContentModeScaleAspectFill;
    [infoView addSubview:appleImage];
    
    
    UIStackView *stackView = [UIStackView new];
    stackView.translatesAutoresizingMaskIntoConstraints = NO;
    stackView.axis = UILayoutConstraintAxisVertical;
    stackView.distribution = UIStackViewDistributionFillEqually;
    
    self.buttonStackView = [UIStackView new];
    self.buttonStackView.translatesAutoresizingMaskIntoConstraints = NO;
    
    if (self.view.frame.size.height>self.view.frame.size.width) {
        self.buttonStackView.axis = UILayoutConstraintAxisVertical;
    }
    else{
        self.buttonStackView.axis = UILayoutConstraintAxisHorizontal;
    }
    self.buttonStackView.distribution = UIStackViewDistributionFillEqually;
    
    
    CAShapeLayer *circle = [CAShapeLayer layer];
    
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
    
    
    UIView *topDevidingLine = [UIView new];
    topDevidingLine.backgroundColor = [UIColor colorWithHex:0x707070];
    topDevidingLine.translatesAutoresizingMaskIntoConstraints = NO;
    
    UIView *bottomDevidingLine = [UIView new];
    bottomDevidingLine.backgroundColor = [UIColor colorWithHex:0x707070];
    bottomDevidingLine.translatesAutoresizingMaskIntoConstraints = NO;
    
    UIView *buttonsView = [UIView new];
    buttonsView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [infoView addSubview:topDevidingLine];
    [buttonsView addSubview:bottomDevidingLine];
    
    [NSLayoutConstraint activateConstraints:@[
        [topDevidingLine.centerXAnchor constraintEqualToAnchor:infoView.centerXAnchor],
        [topDevidingLine.bottomAnchor constraintEqualToAnchor:infoView.bottomAnchor],
        [topDevidingLine.leadingAnchor constraintEqualToAnchor:infoView.leadingAnchor],
        [topDevidingLine.trailingAnchor constraintEqualToAnchor:infoView.trailingAnchor],
        [topDevidingLine.heightAnchor constraintEqualToConstant:1],
        
        [bottomDevidingLine.centerXAnchor constraintEqualToAnchor:buttonsView.centerXAnchor],
        [bottomDevidingLine.topAnchor constraintEqualToAnchor:buttonsView.topAnchor],
        [bottomDevidingLine.leadingAnchor constraintEqualToAnchor:buttonsView.leadingAnchor],
        [bottomDevidingLine.trailingAnchor constraintEqualToAnchor:buttonsView.trailingAnchor],
        [bottomDevidingLine.heightAnchor constraintEqualToConstant:1],
    ]];
    
    
    
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
    
    [NSLayoutConstraint activateConstraints:@[
        [circleContainer.centerYAnchor constraintEqualToAnchor:circleView.centerYAnchor constant:-35],
        [rectContainer.centerYAnchor constraintEqualToAnchor:rectView.centerYAnchor constant:-35],
        [triangleContainer.centerYAnchor constraintEqualToAnchor:triangleView.centerYAnchor constant:-35],
        
    ]];
    
    
    UIStackView *figures = [UIStackView new];
    figures.translatesAutoresizingMaskIntoConstraints = NO;
    figures.axis = UILayoutConstraintAxisHorizontal;
    figures.distribution = UIStackViewDistributionFillEqually;
    [figures addArrangedSubview:circleView];
    [figures addArrangedSubview:rectView];
    [figures addArrangedSubview:triangleView];
    
    
    UIButton *gitButton = [UIButton new];
    gitButton.layer.cornerRadius = 20;
    [gitButton setTitle:@"Open Git CV" forState:UIControlStateNormal];
    gitButton.titleLabel.font = [UIFont systemFontOfSize:20 weight:UIFontWeightMedium];
    [gitButton setTitleColor:[UIColor colorWithHex:0x101010] forState:normal];
    gitButton.backgroundColor = [UIColor colorWithHex:0xF9CC78];
    gitButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    UIButton *startButton = [UIButton new];
    startButton.layer.cornerRadius = 20;
    [startButton setTitle:@"Go to start!" forState:UIControlStateNormal];
    startButton.titleLabel.font = [UIFont systemFontOfSize:20 weight:UIFontWeightMedium];
    [startButton setTitleColor:[UIColor colorWithHex:0xFFFFFF] forState:normal];
    startButton.backgroundColor = [UIColor colorWithHex:0xEE686A];
    startButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    [gitButtonContainer addSubview:gitButton];
    [startButtonContainer addSubview:startButton];
    
    [self.buttonStackView addArrangedSubview:gitButtonContainer];
    [self.buttonStackView addArrangedSubview:startButtonContainer];
    
    [buttonsView addSubview:self.buttonStackView];
    
    [NSLayoutConstraint activateConstraints:@[
        
        [buttonsView.leadingAnchor constraintEqualToAnchor:self.buttonStackView.leadingAnchor],
        [buttonsView.trailingAnchor constraintEqualToAnchor:self.buttonStackView.trailingAnchor],
        [buttonsView.topAnchor constraintEqualToAnchor:self.buttonStackView.topAnchor],
        [buttonsView.bottomAnchor constraintEqualToAnchor:self.buttonStackView.bottomAnchor]
        
    ]];
    
    
    [stackView addArrangedSubview:infoView];
    [stackView addArrangedSubview:figures];
    [stackView addArrangedSubview:buttonsView];
    
    [self.view addSubview:stackView];
    
    [NSLayoutConstraint activateConstraints:@[
        [phoneLabel.centerYAnchor constraintEqualToAnchor:infoView.centerYAnchor constant:0],
        [nameLabel.centerYAnchor constraintEqualToAnchor:infoView.centerYAnchor constant:-25],
        [iosLabel.centerYAnchor constraintEqualToAnchor:infoView.centerYAnchor constant:25],
        
        [appleImage.centerYAnchor constraintEqualToAnchor:infoView.centerYAnchor constant:0],
        [appleImage.centerXAnchor constraintEqualToAnchor:infoView.centerXAnchor constant:-80],
        [appleImage.widthAnchor constraintEqualToConstant:80],
        [appleImage.heightAnchor constraintEqualToConstant:80],
        
        [gitButton.centerYAnchor constraintEqualToAnchor:gitButtonContainer.centerYAnchor],
        [gitButton.leadingAnchor constraintEqualToAnchor:gitButton.trailingAnchor constant:-250],
        [gitButton.centerXAnchor constraintEqualToAnchor:gitButtonContainer.centerXAnchor],
        [gitButton.heightAnchor constraintEqualToConstant:55],
        
        [startButton.heightAnchor constraintEqualToConstant:55],
        [startButton.widthAnchor constraintEqualToConstant:250],
        [startButton.centerXAnchor constraintEqualToAnchor:startButtonContainer.centerXAnchor],
        [startButton.centerYAnchor constraintEqualToAnchor:startButtonContainer.centerYAnchor],
        
        [stackView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor],
        [stackView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor],
        [stackView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:50],
        [stackView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-50],
        
        [phoneLabel.leadingAnchor constraintEqualToAnchor:appleImage.trailingAnchor constant:20],
        [nameLabel.leadingAnchor constraintEqualToAnchor:appleImage.trailingAnchor constant:20],
        [iosLabel.leadingAnchor constraintEqualToAnchor:appleImage.trailingAnchor constant:20],
        
        [triangleContainer.centerXAnchor constraintEqualToAnchor:triangleView.centerXAnchor constant:-40],
        [circleContainer.centerXAnchor constraintEqualToAnchor:circleView.centerXAnchor constant:-35],
        
        [rectContainer.centerXAnchor constraintEqualToAnchor:rectView.centerXAnchor constant:-35]
        
    ]];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
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
    
    
    CABasicAnimation *pulseAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    pulseAnimation.duration = 1;
    pulseAnimation.fromValue = [NSNumber numberWithFloat:1.1];
    pulseAnimation.toValue = [NSNumber numberWithFloat:0.9];
    pulseAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pulseAnimation.autoreverses = YES;
    pulseAnimation.repeatCount = HUGE_VALF;
    
    [circle addAnimation:pulseAnimation forKey:nil];
    
    NSLog(@"%@", [[UIDevice currentDevice] name]);
    
    [gitButton addTarget:self action:@selector(gitButton) forControlEvents:UIControlEventTouchUpInside];
    [startButton addTarget:self action:@selector(startButton) forControlEvents:UIControlEventTouchUpInside];
    
    
    
}


-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    
    if (UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation)) {
        
        self.buttonStackView.axis = UILayoutConstraintAxisHorizontal;
        
    }
    else {
        self.buttonStackView.axis = UILayoutConstraintAxisVertical;
        
        
    }
    
}

-(void)gitButton{
    NSLog(@"TAP");
    NSURL* url = [[NSURL alloc] initWithString: @"https://github.com/vlast01"];
    [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
}

-(void)startButton{
    UIViewController *homeViewController = [HomeViewController new];
    self.view.window.rootViewController = homeViewController;
    
    
    
}





@end
