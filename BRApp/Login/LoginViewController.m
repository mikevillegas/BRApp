//
//  LoginViewController.m
//  BRApp
//
//  Created by Miguel Villegas on 7/11/18.
//  Copyright © 2018 Miguel Villegas. All rights reserved.
//

#import "LoginViewController.h"
#import "SidePanelController.h"
#import <BRCustom/BRCustom.h>

@interface LoginViewController ()
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) NSArray *sucursalesArray;
@property (nonatomic, strong) CLLocation *userLocation;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.locationManager = [[CLLocationManager alloc]init];
    self.locationManager.delegate =self;
    
    self.SucursalesMapView.delegate =self;
    
     [self.locationManager startUpdatingLocation];

   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewDidAppear:(BOOL)animated{
  
}


#pragma mark - Methods

-(void)setFullMapConstraints{
        NSLayoutConstraint *top =   [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:0];
        
        NSLayoutConstraint *bottom =   [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
        
        NSLayoutConstraint *left =   [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
        
        NSLayoutConstraint *right =   [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:0];
        
        
        [self.view addConstraint:top];
        [self.view addConstraint:bottom];
        [self.view addConstraint:left];
        [self.view addConstraint:right];
}

-(void)getSucursales{
    BRSucursalesKit * sucursalesOp = [[BRSucursalesKit alloc]init];
    [sucursalesOp getSucursalesDataWithCompletionHandler:^(NSArray *result, NSError *error, BOOL wasCancelled) {
        if(error){
            return;
        }
        
        self.sucursalesArray = result;
        [self drawSucursalesInMap];
        
    }];
}

-(void)drawSucursalesInMap{
    CLLocationCoordinate2D center = CLLocationCoordinate2DMake(self.userLocation.coordinate.latitude, self.userLocation.coordinate.longitude);
    MKCoordinateRegion region = MKCoordinateRegionMake(center, MKCoordinateSpanMake(0.2, 0.2));
    self.SucursalesMapView.region= region;
    
 //NSMutableArray *annotations = [[NSMutableArray alloc]init];
    for(id sucursal in self.sucursalesArray){
        
        MKPointAnnotation* annotation= [MKPointAnnotation new];
        annotation.title = ((BRSucursal *)sucursal).nombre;
        double latitudSucursal = [((BRSucursal *)sucursal).latitud doubleValue];
        double longitudSucursal = [((BRSucursal *)sucursal).longitud doubleValue];
    
        CLLocationCoordinate2D coordinate =   CLLocationCoordinate2DMake(latitudSucursal, longitudSucursal);
        annotation.coordinate = coordinate;
        //[annotations addObject:annotation];
        [self.SucursalesMapView addAnnotation:annotation];
    }
    
   
  //[self.SucursalesMapView showAnnotations:annotations animated:YES];
    
}

-(void)centerMap{
    MKMapRect zoomRect = MKMapRectNull;
    for (id <MKAnnotation> annotation in self.SucursalesMapView.annotations) {
        MKMapPoint annotationPoint = MKMapPointForCoordinate(annotation.coordinate);
        MKMapRect pointRect = MKMapRectMake(annotationPoint.x, annotationPoint.y, 0, 0);
        if (MKMapRectIsNull(zoomRect)) {
            zoomRect = pointRect;
        } else {
            zoomRect = MKMapRectUnion(zoomRect, pointRect);
        }
    }
    [self.SucursalesMapView setVisibleMapRect:zoomRect edgePadding:UIEdgeInsetsMake(10, 10, 10, 10) animated:YES];
}
#pragma mark - UIButtons

- (IBAction)btnIngresar:(id)sender {
   
    [self.view removeFromSuperview];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"kIngresarOK" object:nil];

}

- (IBAction)btnFullMap:(id)sender {
    if( self.viewIngresar.hidden){
       self.viewIngresar.hidden= NO;
    }else{
        self.viewIngresar.hidden= YES;
       
          [self getSucursales];
        
    }

}

#pragma mark - LocationManager

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
    if([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedAlways ||[CLLocationManager authorizationStatus]== kCLAuthorizationStatusAuthorizedWhenInUse){
        self.SucursalesMapView.showsUserLocation = YES;
    }else{
        [self.locationManager requestWhenInUseAuthorization];
    }
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    
}
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    self.userLocation =  [locations lastObject];
   
}

#pragma mark - MapKit
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
//    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 30000, 30000);
//    [self.SucursalesMapView setRegion:region];
//    //[self.SucursalesMapView setRegion:[self.SucursalesMapView regionThatFits:region] animated:YES];
//    MKPointAnnotation *point = [[MKPointAnnotation alloc]init];
//    point.coordinate = userLocation.coordinate;
//    point.title =@"HERE";
//    point.subtitle = @"Checa esto";
//    [self.SucursalesMapView addAnnotation:point];
}
@end
