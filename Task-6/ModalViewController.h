//
//  ModalViewController.h
//  Task-6
//
//  Created by Владислав Станкевич on 6/23/20.
//  Copyright © 2020 Владислав Станкевич. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ModalViewController : UIViewController

@property(nonatomic, strong)UIImage *image;

-(id)initWithImage:(UIImage *)image;

@end

NS_ASSUME_NONNULL_END
