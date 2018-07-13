//
//  LoginViewController.h
//  BRApp
//
//  Created by Miguel Villegas on 7/11/18.
//  Copyright © 2018 Miguel Villegas. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>

@interface LoginViewController : ViewController<MKMapViewDelegate, CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *lblUsuario;
@property (weak, nonatomic) IBOutlet UITextField *lblContrasena;
@property (weak, nonatomic) IBOutlet UIButton *btnFullMap;
@property (weak, nonatomic) IBOutlet UILabel *lblHeader;
@property (weak, nonatomic) IBOutlet MKMapView *SucursalesMapView;
@property (weak, nonatomic) IBOutlet UIButton *btnIngresar;
@property (weak, nonatomic) IBOutlet UIView *viewIngresar;
@property (weak, nonatomic) IBOutlet UIButton *btnBuscarSucursales;

@end
