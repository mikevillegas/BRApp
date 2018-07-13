//
//  TutorialViewController.m
//  BRApp
//
//  Created by Miguel Villegas on 7/10/18.
//  Copyright © 2018 Miguel Villegas. All rights reserved.
//

#import "TutorialViewController.h"

@interface TutorialViewController ()


@end

@implementation TutorialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    self.screenNumber.text = [NSString stringWithFormat:@"Screen #%ld", (long)self.index];
}

- (IBAction)btnSkip:(id)sender {
    [[NSNotificationCenter defaultCenter]postNotificationName:@"kcloseTutorial" object:nil];
}
- (IBAction)btnIngresar:(id)sender {
}
@end
