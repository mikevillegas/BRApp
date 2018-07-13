//
//  MenuIzquierdoViewController.h
//  BRApp
//
//  Created by Miguel Villegas on 7/11/18.
//  Copyright © 2018 Miguel Villegas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuIzquierdoViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *menuTableView;

@end
