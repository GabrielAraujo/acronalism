//
//  Terms.m
//  
//
//  Created by Gabriel Araujo on 29/03/16.
//
//

#import "Terms.h"

@implementation Terms

-(Terms *) initWithText:(NSString *)_text andFrequence:(NSNumber *)_freq andSince:(NSNumber *)_since andVariants:(NSMutableArray *)_variant {
    self = [super init];
    if (self) {
        [self setText:_text];
        [self setFrequence:_freq];
        [self setSince:_since];
        [self setVariants:_variant];
    }
    return self;}

-(void) setText: (NSString *)_text {
    text = _text;
}
-(NSString *) getText {
    return text;
}

-(void) setFrequence: (NSNumber *)_freq {
    freq = _freq;
}
-(NSNumber *) getFrequence {
    return freq;
}

-(void) setSince: (NSNumber *)_since {
    since = _since;
}
-(NSNumber *) getSince {
    return since;
}

-(void) setVariants:(NSMutableArray *)_variants {
    variants = _variants;
}
-(NSMutableArray *) getVariants {
    return variants;
}

@end
