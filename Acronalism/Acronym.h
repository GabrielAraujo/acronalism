//
//  Acronym.h
//  
//
//  Created by Gabriel Araujo on 29/03/16.
//
//

#import <Foundation/Foundation.h>

@interface Acronym : NSObject {
    NSString * acronym;
    NSMutableArray *terms;
}

-(Acronym *) initWithAcronym: (NSString *)_acronym andTerms:(NSMutableArray *)_terms;

-(void) setAcronym:(NSString *)_acronym;
-(NSString *) getAcronym;

-(void) setTerms:(NSMutableArray *)_terms;
-(NSMutableArray *) getTerms;

-(void) fetchAllWithAcromyn:(NSString *)_acromyn completion:(void (^)(BOOL success, NSError *error))block;

@end
