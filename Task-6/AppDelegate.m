//
//  AppDelegate.m
//  Task-6
//
//  Created by Владислав Станкевич on 6/21/20.
//  Copyright © 2020 Владислав Станкевич. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"

@interface AppDelegate ()



@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    if (@available (iOS 13, *)) {
        
    }
    else{
        NSLog(@"IOS");
        UIWindow *window = [[UIWindow alloc] init];
        UIViewController *homeViewController = [HomeViewController new];
       // viewController.view.backgroundColor = [UIColor redColor];
        window.rootViewController = homeViewController;
        [window makeKeyAndVisible];
        self.window = window;
    }
//    UIViewController *viewController = [UIViewController new];
//    UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    window.rootViewController = viewController;
//    self.window = window;
//    [self.window makeKeyAndVisible];
    
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options   API_AVAILABLE(ios(13.0)){
    
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions  API_AVAILABLE(ios(13.0)){
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}



@end
