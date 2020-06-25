//
//  NavigationController.m
//  Task-6
//
//  Created by Владислав Станкевич on 6/21/20.
//  Copyright © 2020 Владислав Станкевич. All rights reserved.
//

#import "NavigationController.h"
#import "UIColor+HexToUIColor.h"

@interface NavigationController ()

@end

@implementation NavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.barTintColor = [UIColor colorWithHex:0xF9CC78];
    
    self.navigationBar.tintColor = [UIColor colorWithHex:0x101010];
    
    [[UINavigationBar appearance] setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIColor blackColor], NSForegroundColorAttributeName,
      [UIFont systemFontOfSize:18 weight:UIFontWeightSemibold], NSFontAttributeName,nil]];
    
}


@end
