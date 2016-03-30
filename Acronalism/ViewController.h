//
//  ViewController.h
//  Acronalism
//
//  Created by Gabriel Araujo on 29/03/16.
//  Copyright (c) 2016 Gabriel Araujo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Acronym.h"

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

//Outlet
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UITextField *txtSearch;
@property (weak, nonatomic) IBOutlet UIButton *btnSearch;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) Acronym *acronym;

//Helper
- (void) displayErrorMessageWithError:(NSError *)error;

//Action
- (IBAction)btnSearchTapped:(UIButton *)sender;

@end

