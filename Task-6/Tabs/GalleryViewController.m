//
//  GalleryViewController.m
//  Task-6
//
//  Created by Владислав Станкевич on 6/21/20.
//  Copyright © 2020 Владислав Станкевич. All rights reserved.
//

#import "GalleryViewController.h"
#import "ImageCollectionViewCell.h"
#import "UIColor+HexToUIColor.h"
#import <Photos/Photos.h>
#import "ModalViewController.h"
#import "AVKit/AVKit.h"
#import "AVFoundation/AVFoundation.h"

@interface GalleryViewController ()

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray<NSArray *>* imageNames;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (assign, nonatomic) int numberOfColumns;

@property(nonatomic , strong) PHFetchResult *assetsFetchResults;
@property(nonatomic , strong) PHCachingImageManager *imageManager;

@end

@implementation GalleryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithHex:0xFFFFFF];
    
    UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(50, 50);
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [flowLayout setSectionInset:UIEdgeInsetsMake(0, 0, 5, 0)];
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 300, 300) collectionViewLayout:flowLayout];
    [self.collectionView registerClass:[ImageCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    self.collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    
    if (self.view.frame.size.width>self.view.frame.size.height)
        
    {
        self.numberOfColumns = 5;
    }
    
    else
        
    {
        self.numberOfColumns = 3;
    }
    
    
    
    self.collectionView.backgroundColor = [UIColor colorWithHex:0xFFFFFF];
    [self.view addSubview:self.collectionView];
    
    if (@available(iOS 11.0, *)) {
        [NSLayoutConstraint activateConstraints:@[
            [self.collectionView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:5],
            [self.collectionView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-5],
            [self.collectionView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:5],
            [self.collectionView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor]
        ]];
    } else {
        [NSLayoutConstraint activateConstraints:@[
            [self.collectionView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:5],
            [self.collectionView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-5],
            [self.collectionView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:5],
            [self.collectionView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor]
        ]];
    }
    
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    
    [PHPhotoLibrary.sharedPhotoLibrary registerChangeObserver:self];
    
    PHFetchOptions *options = [[PHFetchOptions alloc] init];
    options.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:NO]];
    _assetsFetchResults = [PHAsset fetchAssetsWithOptions:options];
    _imageManager = [[PHCachingImageManager alloc] init];
    
    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return [_assetsFetchResults count];
    
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell"  forIndexPath:indexPath];
    PHAsset *asset = _assetsFetchResults[indexPath.item];
    
    [_imageManager requestImageForAsset:asset targetSize:CGSizeMake(asset.pixelWidth, asset.pixelHeight) contentMode:PHImageContentModeAspectFit options:nil resultHandler:^(UIImage *result, NSDictionary *info)
     {
        cell.imageView.image = result;
        
    }];
    
    return cell;
    
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat width = (self.collectionView.frame.size.width - ((self.numberOfColumns-1) * 5))  / (self.numberOfColumns);
    
    return CGSizeMake(width, width);
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    
    if (UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation))
    {
        self.numberOfColumns = 5;
    }
    
    if (UIDeviceOrientationIsPortrait([UIDevice currentDevice].orientation))
    {
        self.numberOfColumns = 3;
    }
    
    [self.collectionView.collectionViewLayout invalidateLayout];
}


-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 5;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

-(void)photoLibraryDidChange:(PHChange *)changeInstance {
    
    PHFetchOptions *options = [[PHFetchOptions alloc] init];
    options.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:NO]];
    self.assetsFetchResults = [PHAsset fetchAssetsWithOptions:options];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.collectionView reloadData];
    });
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

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ImageCollectionViewCell *cell = [ImageCollectionViewCell new];
    cell = [collectionView cellForItemAtIndexPath:indexPath];
    UIViewController *viewController = [[ModalViewController alloc] initWithImage:cell.imageView.image];
   // [self presentViewController:viewController animated:YES completion:nil];
    
    PHAsset *asset = self.assetsFetchResults[indexPath.item];
    
    if (asset.mediaType == PHAssetMediaTypeVideo) {
           PHVideoRequestOptions *videoOptions = [PHVideoRequestOptions new];
             [[PHImageManager defaultManager] requestPlayerItemForVideo:asset options:videoOptions resultHandler:^(AVPlayerItem *playerItem, NSDictionary *info) {
                 AVPlayer *player = [[AVPlayer alloc]initWithPlayerItem:playerItem];
                 AVPlayerViewController *playerViewController = [AVPlayerViewController new];
                 playerViewController.player = player;
                 [self presentViewController:playerViewController animated:YES completion:^{
                     [playerViewController.player play];
                 }];
             }];
       } else {
               [self presentViewController:viewController animated:YES completion:nil];
       }
}

    
    
    
    





@end
