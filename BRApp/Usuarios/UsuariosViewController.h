//
//  UsuariosViewController.h
//  BRApp
//
//  Created by M.V. on 12/07/18.
//  Copyright © 2018 Miguel Villegas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UsuariosViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imageUsuario;
@property (weak, nonatomic) IBOutlet UITextField *txtNombre;
@property (weak, nonatomic) IBOutlet UITextField *txtApellidos;
@property (weak, nonatomic) IBOutlet UITextField *txtFechaNacimiento;
@property (weak, nonatomic) IBOutlet UITextField *txtDireccion;
@property (weak, nonatomic) IBOutlet UIButton *btnGuardar;

@end
