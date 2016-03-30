//
//  Acromine.m
//  Acronalism
//
//  Created by Gabriel Araujo on 29/03/16.
//  Copyright © 2016 Gabriel Araujo. All rights reserved.
//

#import "Acromine.h"
#import "AFNetworkActivityIndicatorManager.h"

@implementation Acromine

+ (Acromine *)instance {
    static Acromine *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (id)init {
    self = [super init];
    if (self) {
        //Configure the HTTP Session manager
        NSString *url = @"http://www.nactem.ac.uk/software/acromine/";
        self.manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString: url]];
        self.manager.responseSerializer = [AFJSONResponseSerializer serializer];
        self.manager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"text/plain"]];
        
        // Setup the AFHTTPRequestOperationManager completion queue
        // responses on the general manager, are processed in this queue instead of the main (UI thread)
        self.manager.completionQueue = dispatch_queue_create("com.ztanmobile.api", DISPATCH_QUEUE_SERIAL);
        
        // Enable the spinner in the status bar - to indicate network activity
        [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    }
    return self;
}

//Runs the request to fetch the results
+ (void)getAcronymWith:(NSString *)_acronym success:(void (^)(NSURLSessionDataTask *task, id response))_success error:(void (^)(NSURLSessionDataTask *task, NSError *error))_error {
    NSCharacterSet *charSet = [NSCharacterSet whitespaceCharacterSet];
    NSString *withoutSpaceString = [_acronym stringByTrimmingCharactersInSet:charSet];
    NSDictionary *parameters = @{@"sf": withoutSpaceString, @"lf": @""};
    [[self instance].manager GET:@"dictionary.py" parameters:parameters success:_success failure:_error];
}

@end
