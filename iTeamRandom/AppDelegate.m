//
//  AppDelegate.m
//  iTeamRandom
//
//  Created by RAFAEL BARALDI on 03/12/13.
//  Copyright (c) 2013 RAFAEL BARALDI. All rights reserved.
//

#import "AppDelegate.h"
#import "RandomTeamViewController.h"
#import "FinalTeamViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
//    UIViewController * randomTemViewController = [[RandomTeamViewController alloc] init];
//    
//    UINavigationController *navigationController = [[UINavigationController alloc] init];
//    [navigationController pushViewController:randomTemViewController animated:NO];
    
    UITabBarController* tabController = [[UITabBarController alloc]init];
    
//    [[UITabBar appearance]setTintColor:[UIColor redColor]];
//    [[UITabBar appearance]setSelectedImageTintColor:[UIColor greenColor]];
//    [[UITabBar appearance]setBarTintColor:[UIColor yellowColor]];
    
    NSArray* a = [NSArray arrayWithObjects:[[RandomTeamViewController alloc]initWithNibName:@"RandomTeamViewController" bundle:nil], [[FinalTeamViewController alloc]initWithNibName:@"FinalTeamViewController" bundle:nil], nil];
    [tabController setViewControllers:a];
    [self.window setRootViewController:tabController];
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
