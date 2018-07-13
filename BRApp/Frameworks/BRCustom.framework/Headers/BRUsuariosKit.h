//
//  BRUsuariosKit.h
//  sqliteTest
//
//  Created by M.V. on 12/07/18.
//

#import <Foundation/Foundation.h>
#import "BRUsuario.h"

@interface BRUsuariosKit : NSObject
-(void)saveUser:(BRUsuario *)user  withCompletionHandler:(void (^)(NSError *error, BOOL wasCancelled))completion;
-(void)getAllUserWithCompletionHandler:(void (^)(NSArray *result, NSError *error, BOOL wasCancelled))completion;
@end
