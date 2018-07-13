//
//  TutorialLauncherViewController.h
//  BRApp
//
//  Created by M.V. on 12/07/18.
//  Copyright © 2018 Miguel Villegas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TutorialLauncherViewController : UIViewController <UIPageViewControllerDataSource>
@property (strong, nonatomic) UIPageViewController *pageController;
@end
