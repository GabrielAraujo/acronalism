//
//  Variants.h
//  
//
//  Created by Gabriel Araujo on 29/03/16.
//
//

#import <Foundation/Foundation.h>

@interface Variants : NSObject {
    NSString *text;
    NSNumber *freq;
    NSNumber *since;
}

-(Variants *) initWithText:(NSString *)_text andFrequence:(NSNumber *)_freq andSince:(NSNumber *)_since;

-(void) setText: (NSString *)_text;
-(NSString *) getText;

-(void) setFrequence: (NSNumber *)_freq;
-(NSNumber *) getFrequence;

-(void) setSince: (NSNumber *)_since;
-(NSNumber *)  getSince;


@end
