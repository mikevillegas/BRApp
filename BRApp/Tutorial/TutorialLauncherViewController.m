//
//  TutorialLauncherViewController.m
//  BRApp
//
//  Created by M.V. on 12/07/18.
//  Copyright © 2018 Miguel Villegas. All rights reserved.
//

#import "TutorialLauncherViewController.h"
#import "TutorialViewController.h"

@interface TutorialLauncherViewController ()

@end

@implementation TutorialLauncherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(closeTutorial) name:@"kcloseTutorial" object:nil];
    
    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    self.pageController.dataSource = self;
    self.pageController.view.frame = self.view.bounds;
    [self setConstraints];
    
    
    TutorialViewController *initialViewController = [self viewControllerAtIndex:0];
    
    NSArray *viewControllers = [NSArray arrayWithObject:initialViewController];
    
    [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    [self.view addSubview:self.pageController.view];
    [self presentViewController:self.pageController animated:YES completion:nil];
    [self.pageController didMoveToParentViewController:self];
}

//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
//-(void)showTutorial{
//    UIWindow* mainWindow = [[UIApplication sharedApplication] keyWindow];
//    [mainWindow addSubview: self.view];
//}
-(void)closeTutorial{
    [self.pageController removeFromParentViewController];
    [self.view removeFromSuperview];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void) setConstraints{
    NSLayoutConstraint *top =   [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    
    NSLayoutConstraint *bottom =   [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    
    NSLayoutConstraint *left =   [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    
    NSLayoutConstraint *right =   [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:0];
    
    
    [self.view addConstraint:top];
    [self.view addConstraint:bottom];
    [self.view addConstraint:left];
    [self.view addConstraint:right];
    
    
}

#pragma mark - UIPageViewControllerData delegates


- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSUInteger index = [(TutorialViewController *)viewController index];
    
    if (index == 0) {
        return nil;
    }
    
    index--;
    
    return [self viewControllerAtIndex:index];
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    NSUInteger index = [(TutorialViewController *)viewController index];
    
    index++;
    
    if (index == 3) {
        return nil;
    }
    
    return [self viewControllerAtIndex:index];
    
}

- (TutorialViewController *)viewControllerAtIndex:(NSUInteger)index {
    
    TutorialViewController* childViewController;
    UIStoryboard *mainStoryboard;
    if(self.storyboard==nil){
        mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    }else{
        mainStoryboard = self.storyboard;
    }
    switch (index) {
        case 0:
            childViewController =  [mainStoryboard instantiateViewControllerWithIdentifier:@"TutorialViewController1"];
            break;
        case 1:
            childViewController =  [mainStoryboard instantiateViewControllerWithIdentifier:@"TutorialViewController2"];
            break;
            
        case 2:
            childViewController =  [mainStoryboard instantiateViewControllerWithIdentifier:@"TutorialViewController3"];
            break;
            
        default:
            break;
    }
    
    
    childViewController.index = index;
    return childViewController;
    
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    // The number of items reflected in the page indicator.
    return 5;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    // The selected item reflected in the page indicator.
    return 0;
}

@end
