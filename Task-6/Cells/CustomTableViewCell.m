//
//  CustomTableViewCell.m
//  Task-6
//
//  Created by Владислав Станкевич on 6/21/20.
//  Copyright © 2020 Владислав Станкевич. All rights reserved.
//

#import "CustomTableViewCell.h"
#import "UIColor+HexToUIColor.h"
#import <Photos/Photos.h>

@interface CustomTableViewCell ()

//@property (strong, nonatomic) UIImageView *customImageView;
//@property(nonatomic,strong) UILabel *mainLabel;


@end


@implementation CustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupCell];
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupCell];
        
    }
    return self;
}

-(void)setupCell {
    
    self.assetImage = [UIImage new];
    
    self.creationDate = [NSDate new];
    self.modificationDate = [NSDate new];
    
    self.mainLabel = [[UILabel alloc] init];
    self.mainLabel.font = [UIFont systemFontOfSize:17 weight:UIFontWeightSemibold];
    self.mainLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.mainLabel];
    
    [NSLayoutConstraint activateConstraints:@[
        [self.mainLabel.centerYAnchor constraintEqualToAnchor:self.centerYAnchor constant:-12],
        [self.mainLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:100]
        
    ]];
    
    self.typeImageView = [UIImageView new];
    
    self.typeImageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.typeImageView.contentMode =UIViewContentModeScaleAspectFill;
    
    [self addSubview:self.typeImageView];
    
    
    [NSLayoutConstraint activateConstraints:@[
        [self.typeImageView.heightAnchor constraintEqualToConstant:15],
        [self.typeImageView.widthAnchor constraintEqualToConstant:15],
        [self.typeImageView.centerYAnchor constraintEqualToAnchor:self.centerYAnchor constant:12],
        [self.typeImageView.trailingAnchor constraintEqualToAnchor:self.leadingAnchor constant:115]
    ]];
    
    
    self.customImageView = [UIImageView new];
    [self addSubview:self.customImageView];
    self.customImageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints:@[
        [self.customImageView.widthAnchor constraintEqualToConstant:75],
        [self.customImageView.heightAnchor constraintEqualToConstant:75],
        [self.customImageView.centerYAnchor constraintEqualToAnchor:self.centerYAnchor],
        [self.customImageView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:5]
        
    ]];
    self.customImageView.contentMode =UIViewContentModeScaleAspectFill;
    self.customImageView.clipsToBounds = YES;
    
    self.infoLabel = [UILabel new];
    self.infoLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
    self.infoLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.infoLabel];
    
    [NSLayoutConstraint activateConstraints:@[
        [self.infoLabel.centerYAnchor constraintEqualToAnchor:self.centerYAnchor constant:12],
        [self.infoLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:120]
        
    ]];
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
