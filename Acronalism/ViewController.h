//
//  ViewController.h
//  Acronalism
//
//  Created by Gabriel Araujo on 29/03/16.
//  Copyright (c) 2016 Gabriel Araujo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

//Outlet
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UITextField *txtSearch;
@property (weak, nonatomic) IBOutlet UIButton *btnSearch;

//Action
- (IBAction)btnSearchTapped:(UIButton *)sender;

@end

