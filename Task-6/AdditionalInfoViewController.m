//
//  AdditionalInfoViewController.m
//  Task-6
//
//  Created by Владислав Станкевич on 6/21/20.
//  Copyright © 2020 Владислав Станкевич. All rights reserved.
//

#import "AdditionalInfoViewController.h"
#import <Photos/Photos.h>
#import "UIColor+HexToUIColor.h"

@interface AdditionalInfoViewController ()

@property (nonatomic,strong)UIScrollView* scrollView;
@property (nonatomic, strong)UIView* contentView;
@property (nonatomic, strong)UIStackView* stackView;
@property (nonatomic, strong)UIStackView* textStackView;
@property (nonatomic, strong)UIImage* resizedImage;
@property (nonatomic, strong)UIImageView *imageView;
@property (nonatomic, strong)UILabel *creationDateLabel;
@property (nonatomic, strong)UILabel *modificationDateLabel;
@property (nonatomic, strong)UILabel *typeLabel;
@property (nonatomic, strong)UIButton *button;


@end

@implementation AdditionalInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.tabBarController.tabBar.hidden = YES;
    
    self.view.backgroundColor = [UIColor colorWithHex:0xFFFFFF];
    
    self.scrollView = [UIScrollView new];
    [self.view addSubview:self.scrollView];
    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints:@[
        [self.scrollView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor],
        [self.scrollView.topAnchor constraintEqualToAnchor:self.view.topAnchor],
        [self.scrollView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [self.scrollView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor]
    ]];
    
    
    self.contentView = [UIView new];
    self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.scrollView addSubview: self.contentView];
    
    
    [NSLayoutConstraint activateConstraints:@[
        [ self.contentView.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor],
        [ self.contentView.leadingAnchor constraintEqualToAnchor:self.scrollView.leadingAnchor],
        [ self.contentView.trailingAnchor constraintEqualToAnchor:self.scrollView.trailingAnchor],
        [ self.contentView.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor],
    ]];
    
    
    self.imageView = [UIImageView new];
    self.resizedImage = [self resizeImage:self.image newWidth:self.view.frame.size.width];
    
    self.imageView.image = self.resizedImage;
    
    self.stackView = [[UIStackView alloc]init];
    self.stackView.axis = UILayoutConstraintAxisVertical;
    self.stackView.distribution = UIStackViewDistributionEqualSpacing;
    self.stackView.alignment = UIStackViewAlignmentCenter;
    self.stackView.spacing = 30;
    self.stackView.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSDateFormatter* df = [[NSDateFormatter alloc]init];
    [df setDateFormat:@"HH:mm:ss dd.MM.yyyy"];
    NSString *creationDate = [df stringFromDate:self.creationCellDate];
    NSString *modificationDate = [df stringFromDate:self.modificationCellDate];
    
    
    
    self.creationDateLabel = [UILabel new];
    self.modificationDateLabel = [UILabel new];
    self.typeLabel = [UILabel new];
    
    self.creationDateLabel.text = [NSString stringWithFormat: @"Creation date: %@",creationDate];
    self.creationDateLabel.font = [UIFont systemFontOfSize:17 weight:UIFontWeightRegular];
    self.creationDateLabel.textColor = [UIColor colorWithHex:0x101010];
    
    NSMutableAttributedString *dataFieldText = [[NSMutableAttributedString alloc] initWithAttributedString: self.creationDateLabel.attributedText];
    [dataFieldText addAttribute:NSForegroundColorAttributeName
                          value:[UIColor colorWithHex:0x707070]
                          range:NSMakeRange(0, 13)];
    [self.creationDateLabel setAttributedText: dataFieldText];
    
    
    
    
    self.modificationDateLabel.text = [NSString stringWithFormat: @"Modification date: %@", modificationDate];
    self.modificationDateLabel.font = [UIFont systemFontOfSize:17 weight:UIFontWeightRegular];
    self.modificationDateLabel.textColor = [UIColor colorWithHex:0x101010];
    
    NSMutableAttributedString *modificationFieldText = [[NSMutableAttributedString alloc] initWithAttributedString: self.modificationDateLabel.attributedText];
    [modificationFieldText addAttribute:NSForegroundColorAttributeName
                                  value:[UIColor colorWithHex:0x707070]
                                  range:NSMakeRange(0, 18)];
    [self.modificationDateLabel setAttributedText: modificationFieldText];
    
    
    NSMutableString *typeString = [NSMutableString new];
    if (self.type == 1) {
        [typeString appendString:@"Image"];
    }
    else if (self.type == 2){
        [typeString appendString:@"Video"];
    }
    else if (self.type == 3){
        [typeString appendString:@"Audio"];
    }
    else [typeString appendString:@"Other"];
    
    
    self.typeLabel.text = [NSString stringWithFormat:@"Type: %@", typeString];
    self.typeLabel.font = [UIFont systemFontOfSize:17 weight:UIFontWeightRegular];
    self.typeLabel.textColor = [UIColor colorWithHex:0x101010];
    
    NSMutableAttributedString *typeFieldText = [[NSMutableAttributedString alloc] initWithAttributedString: self.typeLabel.attributedText];
    [typeFieldText addAttribute:NSForegroundColorAttributeName
                          value:[UIColor colorWithHex:0x707070]
                          range:NSMakeRange(0, 4)];
    [self.typeLabel setAttributedText: typeFieldText];
    
    
    
    self.textStackView = [[UIStackView alloc]init];
    self.textStackView.axis = UILayoutConstraintAxisVertical;
    self.textStackView.distribution = UIStackViewDistributionEqualSpacing;
    self.textStackView.alignment = UIStackViewAlignmentLeading;
    self.textStackView.spacing = 10;
    self.textStackView.translatesAutoresizingMaskIntoConstraints = false;
    
    
    [self.textStackView.widthAnchor constraintEqualToConstant:self.image.size.width - 30].active = true;
    
    
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button.backgroundColor = [UIColor colorWithHex:0xF9CC78];
    [self.button setTitle:@"Share" forState:UIControlStateNormal];
    [self.button setTitleColor:[UIColor colorWithHex:0x101010] forState:UIControlStateNormal];
    [self.button.titleLabel setFont:[UIFont systemFontOfSize:20 weight: UIFontWeightMedium]];
    self.button.layer.cornerRadius = 25;
    self.button.clipsToBounds = YES;
    
    self.button.translatesAutoresizingMaskIntoConstraints = false;
    
    [self.button.heightAnchor constraintEqualToConstant:55].active = true;
    [self.button.widthAnchor constraintEqualToConstant:self.view.frame.size.width - self.view.frame.size.width  /4  ].active = true;
    [self.button addTarget:self action:@selector(share) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    [self.stackView addArrangedSubview:self.imageView];
    [self.stackView addArrangedSubview:self.textStackView];
    [self.stackView addArrangedSubview:self.button];
    
    [ self.contentView addSubview:self.stackView];
    
    
    [NSLayoutConstraint activateConstraints:@[
        [self.stackView.topAnchor constraintEqualToAnchor: self.contentView.topAnchor constant: 15],
        [self.stackView.rightAnchor constraintEqualToAnchor: self.contentView.rightAnchor constant:-15],
        [self.stackView.leftAnchor constraintEqualToAnchor: self.contentView.leftAnchor constant:15],
        [self.stackView.bottomAnchor constraintEqualToAnchor: self.contentView.bottomAnchor constant:-15],
        [self.stackView.widthAnchor constraintEqualToAnchor:self.view.widthAnchor constant: - 30],
    ]];
    
    [self.textStackView addArrangedSubview:self.creationDateLabel];
    [self.textStackView addArrangedSubview:self.modificationDateLabel];
    [self.textStackView addArrangedSubview:self.typeLabel];
    
    [self.button addTarget:self action:@selector(share) forControlEvents:UIControlEventTouchUpInside];
    
}

-(id)initWithCreationDate:(NSDate*)creationDate modificationDate:(NSDate*)modificationDate image:(UIImage*)assetImage mediaType:(int)mediaType{
    self = [super init];
    if (self) {
        self.creationCellDate = creationDate;
        self.modificationCellDate = modificationDate;
        self.image = assetImage;
        self.type = mediaType;
    }
    return self;
    
}



-(void) share{
    
    UIActivityViewController *controller = [[UIActivityViewController alloc] initWithActivityItems:@[self.image] applicationActivities:nil];
    
    //if iPhone
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        [self presentViewController:controller animated:YES completion:nil];
    }
    //if iPad
    else {
        // Change Rect to position Popover
        UIPopoverController *popup = [[UIPopoverController alloc] initWithContentViewController:controller];
        [popup presentPopoverFromRect:CGRectMake(self.view.frame.size.width/2, self.view.frame.size.height/4, 0, 0)inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    }
    
    
}




-(void)viewWillDisappear:(BOOL)animated {
    self.tabBarController.tabBar.hidden = NO;
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

@end
