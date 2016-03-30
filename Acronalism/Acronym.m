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
#import "Variants.h"

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
                terms = [[NSMutableArray alloc] init];
                Terms *term = NULL;
                for (NSDictionary *item in arrayLFS) {
                    NSNumber *freq = item[@"freq"];
                    NSString *text = item[@"lf"];
                    NSNumber *since = item[@"since"];
                    NSMutableArray *variants = [[NSMutableArray alloc] init];
                    Variants *variant = NULL;
                    for (NSDictionary *subItem in item[@"vars"]) {
                        NSNumber *subFreq = subItem[@"freq"];
                        NSString *subText = subItem[@"lf"];
                        NSNumber *subSince = subItem[@"since"];
                        variant = [[Variants alloc] initWithText:subText andFrequence:subFreq andSince:subSince];
                        [variants addObject:variant];
                    }
                    term = [[Terms alloc] initWithText:text andFrequence:freq andSince:since andVariants:variants];
                    [terms addObject:term];
                }
                [self setAcronym:_acromyn];
                block(YES, NULL);
            } else {
                NSDictionary *userInfo = [NSDictionary dictionaryWithObject:@"No items to be displayed" forKey:NSLocalizedDescriptionKey];
                NSError *error = [[NSError alloc] initWithDomain:@"Response" code:-404 userInfo:userInfo];
                block(NO, error);
            }
        });
    } error:^(NSURLSessionDataTask *task, NSError *error) {
        block(NO, error);
    }];
}

@end
