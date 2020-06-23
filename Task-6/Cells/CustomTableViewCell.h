//
//  CustomTableViewCell.h
//  Task-6
//
//  Created by Владислав Станкевич on 6/21/20.
//  Copyright © 2020 Владислав Станкевич. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface CustomTableViewCell : UITableViewCell

@property (strong, nonatomic) UIImageView *customImageView;
@property(nonatomic,strong) UILabel *mainLabel;
@property(nonatomic,strong) UILabel *infoLabel;
@property(nonatomic,strong) UIImage *assetImage;
@property(nonatomic,strong) NSDate *creationDate;
@property(nonatomic,strong) NSDate *modificationDate;
@property(nonatomic) int type;
@property(nonatomic,strong) UIImageView *typeImageView;

@end

NS_ASSUME_NONNULL_END
