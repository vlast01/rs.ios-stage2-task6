//
//  TabBarViewController.m
//  Task-6
//
//  Created by Владислав Станкевич on 6/21/20.
//  Copyright © 2020 Владислав Станкевич. All rights reserved.
//

#import "TabBarViewController.h"
#import "InfoViewController.h"
#import "GalleryViewController.h"
#import "RSSchoolViewController.h"
#import "UIColor+HexToUIColor.h"
#import "NavigationController.h"

@implementation TabBarViewController

-(void)viewDidLoad {
    
    
    UIViewController *infoViewController = [InfoViewController new];
    infoViewController.title = @"Info";
    UIViewController *galleryViewController = [GalleryViewController new];
    galleryViewController.title = @"Gallery";
    UIViewController *rsschoolViewController = [RSSchoolViewController new];
    rsschoolViewController.title = @"RSSchool Task 6";
    
    infoViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"" image:[UIImage imageNamed:@"info_unselected"] tag:0];
    galleryViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"" image:[UIImage imageNamed:@"gallery_unselected"] tag:0];
    rsschoolViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"" image:[UIImage imageNamed:@"home_unselected"] tag:0];
    
    self.viewControllers = @[infoViewController,galleryViewController,rsschoolViewController];
    
    [self setSelectedIndex:1];
    
    
    UITabBar *tabBar = self.tabBar;
    
    UITabBarItem *tabBarItem1 = [tabBar.items objectAtIndex:0];
    UITabBarItem *tabBarItem2 = [tabBar.items objectAtIndex:1];
    UITabBarItem *tabBarItem3 = [tabBar.items objectAtIndex:2];
    
    tabBarItem1.selectedImage = [UIImage imageNamed:@"info_selected"];
    tabBarItem2.selectedImage = [UIImage imageNamed:@"gallery_selected"];
    tabBarItem3.selectedImage = [UIImage imageNamed:@"home_selected"];
    
    
    UINavigationController *firstVC = [[NavigationController alloc] initWithRootViewController:infoViewController];
    UINavigationController *secondVC = [[NavigationController alloc] initWithRootViewController:galleryViewController];
    UINavigationController *thirdVC = [[NavigationController alloc] initWithRootViewController:rsschoolViewController];
    
    self.viewControllers = @[firstVC, secondVC, thirdVC];
    
     [self setSelectedIndex:1];

    tabBar.tintColor = [UIColor blackColor];

}


@end
