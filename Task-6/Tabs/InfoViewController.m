//
//  InfoViewController.m
//  Task-6
//
//  Created by Владислав Станкевич on 6/21/20.
//  Copyright © 2020 Владислав Станкевич. All rights reserved.
//

#import "InfoViewController.h"
#import "UIColor+HexToUIColor.h"
#import "CustomTableViewCell.h"
#import <Photos/Photos.h>
#import "AdditionalInfoViewController.h"

@interface InfoViewController ()

@property (nonatomic, strong) UITableView *tableView;

@property(nonatomic , strong) PHFetchResult *assetsFetchResults;
@property(nonatomic , strong) PHCachingImageManager *imageManager;

@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor colorWithHex:0xFFFFFF];
    
    self.tableView = [[UITableView alloc] init];
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"cellId"];
    [self.view addSubview:self.tableView];
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints:@[
        [self.tableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [self.tableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
        [self.tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor],
        [self.tableView.topAnchor constraintEqualToAnchor:self.view.topAnchor]
    ]];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerClass:CustomTableViewCell.class forCellReuseIdentifier:@"cellId"];
    
    
    [PHPhotoLibrary.sharedPhotoLibrary registerChangeObserver:self];
    
    PHFetchOptions *options = [[PHFetchOptions alloc] init];
    options.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:NO]];
    _assetsFetchResults = [PHAsset fetchAssetsWithOptions:options];
    _imageManager = [[PHCachingImageManager alloc] init];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [_assetsFetchResults count];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId" forIndexPath:indexPath];
    PHAsset *asset = _assetsFetchResults[indexPath.item];
    cell.imageView.contentMode = UIViewContentModeTop;
    
        cell.type = (int)asset.mediaType;
    
    
    [_imageManager requestImageForAsset:asset targetSize:CGSizeMake(1000, 1000) contentMode:PHImageContentModeAspectFit options:nil resultHandler:^(UIImage *result, NSDictionary *info)
     {
        if (cell.type == 1 || cell.type == 2){
            
            cell.customImageView.image = result;
            cell.assetImage = result;

        }
        else if (cell.type == 3) {
             cell.customImageView.image = [UIImage imageNamed:@"musicIcon"];
            cell.assetImage = [UIImage imageNamed:@"musicIcon"];
            
        }
        else {
            cell.customImageView.image = [UIImage imageNamed:@"otherIcon"];
            cell.assetImage = [UIImage imageNamed:@"otherIcon"];
        }
    
    }];
    
    cell.mainLabel.text = [asset valueForKey:@"filename"];

    if (cell.type == 1) {
        cell.typeImageView.image = [UIImage imageNamed:@"image"];
        cell.infoLabel.text = [NSString stringWithFormat:@"%lux%lu",(unsigned long)asset.pixelWidth, (unsigned long)asset.pixelHeight];
    }
    else if (cell.type == 2){
        cell.typeImageView.image = [UIImage imageNamed:@"video"];
        
        NSString *time = [self timeConverter:(int)asset.duration];
        cell.infoLabel.text = [NSString stringWithFormat:@"%lux%lu %@",(unsigned long)asset.pixelWidth, (unsigned long)asset.pixelHeight, time];
    }
    else if (cell.type == 3){
        NSString *time = [self timeConverter:(int)asset.duration];
        cell.typeImageView.image = [UIImage imageNamed:@"audio"];
        cell.infoLabel.text = [NSString stringWithString:time];
    }
    else  {
        cell.typeImageView.image = [UIImage imageNamed:@"other"];
        cell.infoLabel.text = @"";
    }
    
    
    cell.creationDate = asset.creationDate;
    cell.modificationDate = asset.modificationDate;
    
    
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    UIView *selectionColor = [[UIView alloc] init];
    selectionColor.backgroundColor = [UIColor colorWithHex:0xFDF4E3];
    cell.selectedBackgroundView = selectionColor;
    
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    
    
    UIViewController *viewController = [[AdditionalInfoViewController alloc] initWithCreationDate:cell.creationDate modificationDate:cell.modificationDate image:cell.assetImage mediaType:cell.type];
    viewController.title = cell.mainLabel.text;
    
    [self.navigationController pushViewController:viewController animated:YES];
}


-(void)photoLibraryDidChange:(PHChange *)changeInstance {
    
    PHFetchOptions *options = [[PHFetchOptions alloc] init];
    options.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:NO]];
    self.assetsFetchResults = [PHAsset fetchAssetsWithOptions:options];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

-(NSString *)timeConverter:(int)time{
    int minutes = time / 60;
    int sec = time - minutes * 60;
    NSMutableString *result = [NSMutableString new];
    if (minutes<10)
        [result appendFormat:@"0%d:", minutes];
    else  [result appendFormat:@"%d:", minutes];
    
        if (sec < 10) {
            [result appendFormat:@"0%d", sec];
        }
        else [result appendFormat:@"%d", sec];
    return result;
}


@end
