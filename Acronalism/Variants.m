//
//  Variants.m
//  
//
//  Created by Gabriel Araujo on 29/03/16.
//
//

#import "Variants.h"

@implementation Variants

//Initializers
-(Variants *) initWithText:(NSString *)_text andFrequence:(NSNumber *)_freq andSince:(NSNumber *)_since{
    self = [super init];
    if (self) {
        [self setText:_text];
        [self setFrequence:_freq];
        [self setSince:_since];
    }
    return self;
}

//Getters and setters
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
-(NSNumber *)  getSince {
    return since;
}

@end
