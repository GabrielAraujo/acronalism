//
//  VariablesViewController.h
//  
//
//  Created by Gabriel Araujo on 29/03/16.
//
//

#import <UIKit/UIKit.h>
#import "Acronym.h"
#import "Terms.h"

@interface VariablesViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *btnClose;

@property (strong, nonatomic) Acronym *acronym;
@property (strong, nonatomic) Terms *selectedTerm;

- (IBAction)btnCloseTapped:(UIButton *)sender;

@end
