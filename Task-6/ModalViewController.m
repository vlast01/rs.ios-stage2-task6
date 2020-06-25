//
//  ModalViewController.m
//  Task-6
//
//  Created by Владислав Станкевич on 6/23/20.
//  Copyright © 2020 Владислав Станкевич. All rights reserved.
//

#import "ModalViewController.h"
#import "UIColor+HexToUIColor.h"

@interface ModalViewController ()

@property(nonatomic, strong)UIImageView *imageView;

@end

@implementation ModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHex:0xFFFFFF];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(0, 0, 40, 40);
    button.layer.cornerRadius = 10;
    button.translatesAutoresizingMaskIntoConstraints = NO;
    [button setTitle:@"X" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:20 weight:UIFontWeightMedium];
    [button setTitleColor:[UIColor colorWithHex:0x101010] forState:normal];
    button.backgroundColor = [UIColor colorWithHex:0xFFFFFF];
    [self.view addSubview:button];
    
    [NSLayoutConstraint activateConstraints:@[
        [button.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-30],
        [button.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:10],
    ]];
    
    
    
    [button addTarget:self action:@selector(tapped) forControlEvents:UIControlEventTouchUpInside];
    
    UIImage *newImage = [UIImage new];
    newImage = self.image;
    
    
    if (self.view.frame.size.width>self.view.frame.size.height) {
        
        
        
        if (self.image.size.width >= self.image.size.height) {
            
            newImage = [self resizeImage:newImage newWidth:self.view.frame.size.width*0.6];
        }
        else {
            newImage = [self resizeImage:newImage newWidth:self.view.frame.size.height-200];
        }
        
    }
    
    else {
        
        
        if (self.image.size.width >= self.image.size.height) {
            
            newImage = [self resizeImage:self.image newWidth:self.view.frame.size.width-50];
        }
        else newImage = [self resizeImage:self.image newWidth:self.view.frame.size.width*0.7];
        
        
    }
    
    
    
    
    
    self.imageView = [UIImageView new];
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    
    self.imageView.image = newImage;
    [self.view addSubview:self.imageView];
    self.imageView.contentMode =UIViewContentModeScaleAspectFill;
    
    
    
    [NSLayoutConstraint activateConstraints:@[
        
        [self.imageView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.imageView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor],
        
    ]];
    
    
    
}

-(void)tapped{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(id)initWithImage:(UIImage *)image{
    self = [super init];
    if (self) {
        self.image = image;
    }
    return self;
    
}

- (UIImage *)resizeImage:(UIImage *)image newWidth:(CGFloat)newWidth {
    
    double scale = newWidth / image.size.width;
    double newHeight = image.size.height * scale;
    UIGraphicsBeginImageContext(CGSizeMake(newWidth, newHeight));
    [image drawInRect:CGRectMake(0, 0, newWidth, newHeight)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    
    
    UIImage *newImage = [UIImage new];
    newImage = self.image;
    
    if (UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation)) {
        
        if (self.image.size.width >= self.image.size.height) {
            newImage = [self resizeImage:newImage newWidth:self.view.frame.size.height*0.6];
        }
        else {
            newImage = [self resizeImage:newImage newWidth:self.view.frame.size.width-200];
        }
        
    }
    else {
        
        if (self.image.size.width >= self.image.size.height) {
            newImage = [self resizeImage:self.image newWidth:self.view.frame.size.height-50];
        }
        else {
            
            newImage = [self resizeImage:self.image newWidth:self.view.frame.size.height*0.7];
        }
        
        
    }
    
    
    
    self.imageView.image = newImage;
    
    
}






@end
