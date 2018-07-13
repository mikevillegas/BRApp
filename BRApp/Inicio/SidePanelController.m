//
//  SidePanelController.m
//  BRApp
//
//  Created by Miguel Villegas on 7/10/18.
//  Copyright © 2018 Miguel Villegas. All rights reserved.
//

#import "SidePanelController.h"
#import "TutorialLauncherViewController.h"
#import "StartupViewController.h"
#import "LoginViewController.h"
#import "UsuariosViewController.h"

@interface SidePanelController ()
@property (nonatomic, strong) StartupViewController *startup;
@property (nonatomic, strong) TutorialLauncherViewController *tutorial;
@property (nonatomic, strong) UsuariosViewController *usuario;
@end

@implementation SidePanelController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(closeTutorial) name:@"kcloseTutorial" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ingresar) name:@"kIngresarOK" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cerrarUsuario) name:@"kUsuarioCerrar" object:nil];

  
}

-(void)cerrarUsuario{
    self.centerPanel = [self.storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
}
-(void)showMenu{
    UIViewController *rootController = self.centerPanel;
    if ([rootController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *nav = (UINavigationController *)rootController;
        if ([nav.viewControllers count] > 0) {
            rootController = [nav.viewControllers objectAtIndex:0];
        }
    }
}

-(void)showTutorial{
    

 self.centerPanel = [self.storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
    
 self.tutorial =[[TutorialLauncherViewController alloc]init];
[self.centerPanel.view addSubview:self.tutorial.view];
    
    
   
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)showUsuario{
    self.centerPanel = [self.storyboard instantiateViewControllerWithIdentifier:@"UsuariosViewController"];
    
//    self.tutorial =[[TutorialLauncherViewController alloc]init];
//    [self.centerPanel.view addSubview:self.tutorial.view];
}

-(void)closeTutorial{
    [self.tutorial removeFromParentViewController];
    [self showUsuario];
    
}


-(void)ingresar{
    [self showTutorial];
    
//    UINavigationController *nc = (UINavigationController *)self.centerPanel;
//    [nc pushViewController:controller animated:YES];
//    [self.view removeFromSuperview];
//    UINavigationController *nc = (UINavigationController *)self.centerPanel;
//    [nc pushViewController:controller animated:YES];
    //    SidePanelController *sidepanel =[[SidePanelController alloc]init];
    //    UIWindow* mainWindow = [[UIApplication sharedApplication] keyWindow];
    //    [mainWindow addSubview: sidepanel.view];
}


-(void)awakeFromNib{
    [super awakeFromNib];
    self.leftPanel = [self.storyboard instantiateViewControllerWithIdentifier:@"MenuIzquierdoViewController"];
    self.centerPanel = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
//    self.rightPanel = [self.storyboard instantiateViewControllerWithIdentifier:@"MenuRightViewController"];
}

-(void)runStartupScreen{
    
    self.startup = [self.storyboard instantiateViewControllerWithIdentifier:@"StartupViewController"];
    [self.centerPanel.view addSubview:self.startup.view];
    
    [self performSelector:@selector(removeStartupScreen) withObject:nil afterDelay:3200];
    
}

-(void)removeStartupScreen{
    if(self.startup){
        [self.startup removeFromParentViewController];
    }
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




@end
