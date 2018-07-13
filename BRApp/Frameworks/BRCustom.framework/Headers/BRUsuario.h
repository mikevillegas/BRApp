//
//  BRUsuario.h
//  sqliteTest
//
//  Created by M.V. on 09/07/18.
//

#import <Foundation/Foundation.h>

@interface BRUsuario : NSObject
    @property(nonatomic, copy) NSString *  nombre;
    @property(nonatomic, copy) NSString *  apellidos;
    @property(nonatomic, copy) NSString * fechaNacimiento;
    @property(nonatomic, copy) NSString * direccion;
    @property(nonatomic, copy) NSData * foto;
@end
