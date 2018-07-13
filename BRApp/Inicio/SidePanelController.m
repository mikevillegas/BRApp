//
//  SidePanelController.m
//  BRApp
//
//  Created by Miguel Villegas on 7/10/18.
//  Copyright © 2018 Miguel Villegas. All rights reserved.
//

#import "SidePanelController.h"
#import "TutorialViewController.h"
#import "StartupViewController.h"

@interface SidePanelController ()
@property (nonatomic, strong) StartupViewController *startup;
@end

@implementation SidePanelController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




-(void)awakeFromNib{
    [super awakeFromNib];
    self.leftPanel = [self.storyboard instantiateViewControllerWithIdentifier:@"MenuIzquierdoViewController"];
    self.centerPanel = [self.storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
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




@end
