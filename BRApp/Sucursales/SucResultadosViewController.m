//
//  SucResultadosViewController.m
//  BRApp
//
//  Created by Miguel Villegas on 7/11/18.
//  Copyright © 2018 Miguel Villegas. All rights reserved.
//

#import "SucResultadosViewController.h"
#import <BRCustom/BRCustom.h>

@interface SucResultadosViewController ()
@property (nonatomic, strong) NSArray *sucursales;
@property (nonatomic, strong) NSArray *searchResults;
@end

@implementation SucResultadosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableSucurales.dataSource =self;
    self.tableSucurales.delegate = self;
    self.searchBar.delegate =self;
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithTitle:@"regresar" style:UIBarButtonItemStylePlain target:self action:@selector(regresar)];
    self.navigationItem.rightBarButtonItem = back;
    
    
    BRSucursalesKit * sucursalesOp = [[BRSucursalesKit alloc]init];
        [sucursalesOp getSucursalesDataWithCompletionHandler:^(NSArray *result, NSError *error, BOOL wasCancelled) {
            if(error){
                return;
            }
            
            self.sucursales = result;
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableSucurales reloadData];
            });
        }];
    }

-(void)regresar{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.searchDisplay.searchResultsTableView) {
        return [self.searchResults count];
        
    } else {
        return [self.sucursales count];
        
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *simpleTableIdentifier = @"SucursalesCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    if (tableView == self.searchDisplay.searchResultsTableView) {
        cell.textLabel.text = ((BRSucursal*)[self.searchResults objectAtIndex:indexPath.row]).nombre;
    } else {
        cell.textLabel.text =  ((BRSucursal*)[self.searchResults objectAtIndex:indexPath.row]).nombre;
    }
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showSucursalDetail"]) {
//
//        NSIndexPath *indexPath = nil;
//
//        if ([self.searchDisplayController isActive]) {
//            indexPath = [self.searchDisplay.searchResultsTableView indexPathForSelectedRow];
//
//        } else {
//            indexPath = [self.tableSucurales indexPathForSelectedRow];
//        }
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [self performSegueWithIdentifier: @"showSucursalesDetail" sender: self];
}

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSPredicate *resultPredicate = [NSPredicate
                                    predicateWithFormat:@"SELF contains[cd] %@",
                                    searchText];
    
    self.searchResults = [self.sucursales filteredArrayUsingPredicate:resultPredicate];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    [self filterContentForSearchText:searchText
                               scope:[[self.searchDisplay.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
}



@end
