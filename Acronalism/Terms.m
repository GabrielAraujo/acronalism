//
//  Terms.m
//  
//
//  Created by Gabriel Araujo on 29/03/16.
//
//

#import "Terms.h"

@implementation Terms

-(Terms *) initWithText:(NSString *)_text andFrequence:(int)_freq andSince:(int)_since andVariants:(NSMutableArray *)_variants {
    self = [super init];
    if (self) {
        [self setText:_text];
        [self setFrequence:_freq];
        [self setSince:_since];
        [self setVariants:_variants];
    }
    return self;}

-(void) setText: (NSString *)_text {
    text = _text;
}
-(NSString *) getText {
    return text;
}

-(void) setFrequence: (int)_freq {
    freq = _freq;
}
-(int) getFrequence {
    return freq;
}

-(void) setSince: (int)_since {
    since = _since;
}
-(int) getSince {
    return since;
}

-(void) setVariants:(NSMutableArray *)_variants {
    variants = _variants;
}
-(NSMutableArray *) getVariants {
    return variants;
}

@end
