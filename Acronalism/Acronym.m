//
//  Acronym.m
//  
//
//  Created by Gabriel Araujo on 29/03/16.
//
//

#import "Acronym.h"
#import "Acromine.h"
#import "Terms.h"

@implementation Acronym

-(Acronym *) initWithAcronym: (NSString *)_acronym andTerms:(NSMutableArray *)_terms {
    self = [super init];
    if (self) {
        [self setAcronym:_acronym];
        [self setTerms:_terms];
    }
    return self;
}

-(void) setAcronym:(NSString *)_acronym {
    acronym = _acronym;
}
-(NSString *) getAcronym {
    return acronym;
}

-(void) setTerms:(NSMutableArray *)_terms {
    terms = _terms;
}
-(NSMutableArray *) getTerms {
    return terms;
}

-(void) fetchAllWithAcromyn:(NSString *)_acromyn completion:(void (^)(BOOL success, NSError *error))block {
    [Acromine getAcronymWith:_acromyn success:^(NSURLSessionDataTask *task, id response) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if(((NSArray*)response).count > 0) {
                NSArray *arrayLFS = response[0][@"lfs"];
                Terms *term = NULL;
                for (NSDictionary *item in arrayLFS) {
                    NSNumber *iii = item[@"freq"];
                    NSString *text = item[@"lf"];
                    int freq;
                    NSNumber *since = item[@"since"];
                    NSMutableArray *variants;
                }
                block(YES, NULL);
            } else {
                NSError *error = [[NSError alloc] initWithDomain:@"Response" code:-404 userInfo:NULL];
                block(NO, error);
            }
        });
    } error:^(NSURLSessionDataTask *task, NSError *error) {
        block(NO, error);
    }];
}

@end
