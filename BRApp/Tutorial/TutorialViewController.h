//
//  TutorialViewController.h
//  BRApp
//
//  Created by Miguel Villegas on 7/10/18.
//  Copyright © 2018 Miguel Villegas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TutorialViewController : UIViewController
@property (assign, nonatomic) NSInteger index;
@property (weak, nonatomic) IBOutlet UILabel *screenNumber;
@property (weak, nonatomic) IBOutlet UIButton *btnSkip;

@end
