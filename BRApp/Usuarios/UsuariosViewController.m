//
//  UsuariosViewController.m
//  BRApp
//
//  Created by M.V. on 12/07/18.
//  Copyright © 2018 Miguel Villegas. All rights reserved.
//

#import "UsuariosViewController.h"
#import <BRCustom/BRCustom.h>
@interface UsuariosViewController ()



@end

@implementation UsuariosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnGuardar:(id)sender {
    [self guardar];
}

-(void)guardar{
    
    
    BRUsuario * user= [[BRUsuario alloc]init];
    user.nombre = self.txtNombre.text;
    user.apellidos = self.txtApellidos.text;
    user.direccion =self.txtDireccion.text;
    user.fechaNacimiento = self.txtFechaNacimiento.text;
    user.foto=nil;
    
    BRUsuariosKit * usuariosKit = [[BRUsuariosKit alloc]init];
    [usuariosKit saveUser:user withCompletionHandler:^(NSError *error, BOOL wasCancelled) {
        NSString *mensaje = @"";
        if(error){
            mensaje =@"El usuario no pudo guardarse";
        }else{
            mensaje =@"El usuario se guardó satisfactoriamente";
        }
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"Banregio" message:mensaje preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *aceptar = [UIAlertAction actionWithTitle:@"Aceptar" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
            // Ok action example
        }];
        [alert addAction:aceptar];
        [self presentViewController:alert animated:YES completion:^{
            [self.view removeFromSuperview];
            [[NSNotificationCenter defaultCenter]postNotificationName:@"kUsuarioCerrar" object:nil];
        }];
        
       
    }];
  


}
#pragma mark TextField Delegates

- (void)EsconderTeclados {
    if (self.txtNombre)
        [self.txtNombre  resignFirstResponder];
    if (self.txtApellidos)
        [self.txtApellidos  resignFirstResponder];
    if (self.txtFechaNacimiento)
        [self.txtFechaNacimiento  resignFirstResponder];
    if (self.txtDireccion)
        [self.txtDireccion  resignFirstResponder];

}

- (void)textFieldDone:(id)sender {
    [sender resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    [self guardar];
    return NO;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    //Esconde el teclado cuando hace touch en el background
    [self EsconderTeclados];
    
//    if (![self.view viewWithTag:kViewPickerSuburbanas].hidden)
//        [self.view viewWithTag:kViewPickerSuburbanas].hidden = YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    //Al indicar RETURN NO deshabilito el teclado por default y lanzo el view con el date picker
    BOOL toReturn;
    
//    if (![self.view viewWithTag:kViewPickerSuburbanas].hidden)
//        [self.view viewWithTag:kViewPickerSuburbanas].hidden = YES;
//
//    if (textField.tag == kTextFieldDesdeFecha || textField.tag == kTextFieldHastaFecha) {
//        textField.background = [UIImage imageNamed:@"fondo_rojo_con_calendario.png"];
//        textField.textColor = [UIColor blackColor];
//    }
//    if (textField.tag == kTextFieldDesdeFecha || textField.tag == kTextFieldHastaFecha) {
//        [self EsconderTeclados];
//        [self.view viewWithTag:kViewDatePicker].hidden = NO;
//
//        if (textField.tag == kTextFieldDesdeFecha) {
//            [self.view viewWithTag:kDatePickerDesdeFecha].hidden = NO; //![self.view viewWithTag:kDatePickerDesdeFecha].hidden;
//            [self.view viewWithTag:kDatePickerHastaFecha].hidden = YES;
//        }
//
//        if (textField.tag == kTextFieldHastaFecha) {
//            [self.view viewWithTag:kDatePickerHastaFecha].hidden = NO;
//            [self.view viewWithTag:kDatePickerDesdeFecha].hidden = YES;  //![self.view viewWithTag:kDatePickerHastaFecha].hidden;
//        }
//
//        [self.view viewWithTag:kViewPickerSuburbanas].hidden = YES;
//
//        toReturn = NO;
//    }
//
//    else {
//        [self.view viewWithTag:kViewDatePicker].hidden = YES;
//        if (textField.tag == kTextFieldDesdeFecha)
//            [self.view viewWithTag:kDatePickerDesdeFecha].hidden = NO;
//        if (textField.tag == kTextFieldHastaFecha)
//            [self.view viewWithTag:kDatePickerHastaFecha].hidden = NO;
//        toReturn = YES;
//    }
    
    
    return NO;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
}

@end
