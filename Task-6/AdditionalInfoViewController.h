//
//  AdditionalInfoViewController.h
//  Task-6
//
//  Created by Владислав Станкевич on 6/21/20.
//  Copyright © 2020 Владислав Станкевич. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AdditionalInfoViewController : UIViewController

@property (nonatomic, strong) NSString *name;
@property(nonatomic,strong) NSDate *creationCellDate;
@property(nonatomic,strong) NSDate *modificationCellDate;
@property (nonatomic, strong) UIImage *image;
@property(nonatomic) int type;


-(id)initWithCreationDate:(NSDate*)creationDate modificationDate:(NSDate *)modificationDate image:(UIImage*)assetImage mediaType:(int)mediaType;

@end

NS_ASSUME_NONNULL_END
