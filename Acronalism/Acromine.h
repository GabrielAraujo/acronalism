//
//  Acromine.h
//  Acronalism
//
//  Created by Gabriel Araujo on 29/03/16.
//  Copyright © 2016 Gabriel Araujo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface Acromine : NSObject

@property (nonatomic, strong) AFHTTPSessionManager *manager;

+ (Acromine *)instance;
+ (void)getAcronymWith:(NSString *)_acronym success:(void (^)(NSURLSessionDataTask *task, id response))_success error:(void (^)(NSURLSessionDataTask *task, NSError *error))_error;

@end
