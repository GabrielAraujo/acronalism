//
//  Terms.h
//  
//
//  Created by Gabriel Araujo on 29/03/16.
//
//

#import <Foundation/Foundation.h>

@interface Terms : NSObject {
    NSString *text;
    NSNumber * freq;
    NSNumber * since;
    NSMutableArray *variants;
}

-(Terms *) initWithText:(NSString *)_text andFrequence:(NSNumber *)_freq andSince:(NSNumber *)_since andVariants:(NSMutableArray *)_variants;

-(void) setText: (NSString *)_text;
-(NSString *) getText;

-(void) setFrequence: (NSNumber *)_freq;
-(NSNumber *) getFrequence;

-(void) setSince: (NSNumber *)_since;
-(NSNumber *)  getSince;

-(void) setVariants:(NSMutableArray *)_variants;
-(NSMutableArray *) getVariants;

@end
