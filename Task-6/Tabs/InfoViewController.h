//
//  InfoViewController.h
//  Task-6
//
//  Created by Владислав Станкевич on 6/21/20.
//  Copyright © 2020 Владислав Станкевич. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>

NS_ASSUME_NONNULL_BEGIN

@interface InfoViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, PHPhotoLibraryChangeObserver>

@end

NS_ASSUME_NONNULL_END
