//
//  SucResultadosViewController.h
//  BRApp
//
//  Created by Miguel Villegas on 7/11/18.
//  Copyright © 2018 Miguel Villegas. All rights reserved.
//

#import "ViewController.h"

@interface SucResultadosViewController : ViewController <UITableViewDelegate, UITableViewDataSource,UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UISearchDisplayController *searchDisplay;
@property (weak, nonatomic) IBOutlet UITableView *tableSucurales;
@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;

@end
