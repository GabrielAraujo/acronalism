//
//  ViewController.m
//  Acronalism
//
//  Created by Gabriel Araujo on 29/03/16.
//  Copyright (c) 2016 Gabriel Araujo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

@synthesize acronym;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnSearchTapped:(UIButton *)sender {
    if ([self.txtSearch.text isEqualToString:@""] || !self.txtSearch.text) {
        //Error, no values on textfield
    }else{
        acronym = [[Acronym alloc] init];
        [acronym fetchAllWithAcromyn:self.txtSearch.text completion:^(BOOL success, NSError *error) {
            if (success) {
                
            }else{
                //Error
            }
        }];
    }
}
@end
