//
//  BRSucursalesKit.h
//  BRGeneral
//
//  Created by M.V. on 09/07/18.
//

#import <Foundation/Foundation.h>

@interface BRSucursalesKit : NSObject
    -(void)getSucursalesDataWithCompletionHandler:(void (^)(NSArray *result, NSError *error, BOOL wasCancelled))completion;
@end
