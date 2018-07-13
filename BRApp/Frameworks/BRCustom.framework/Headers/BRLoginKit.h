//
//  BRLoginKit.h
//  sqliteTest
//
//  Created by M.V. on 09/07/18.
//

#import <Foundation/Foundation.h>

@interface BRLoginKit : NSObject
    -(void)getLoginDataWithCompletionHandler:(void (^)(NSDictionary *result, NSError *error, BOOL wasCancelled))completion;
@end
