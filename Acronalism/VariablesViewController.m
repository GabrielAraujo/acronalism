//
//  VariablesViewController.m
//  
//
//  Created by Gabriel Araujo on 29/03/16.
//
//

#import "VariablesViewController.h"
#import "ResponseCell.h"
#import "Variants.h"

@interface VariablesViewController ()

@end

@implementation VariablesViewController

@synthesize acronym, selectedTerm;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnCloseTapped:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

//Table View
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.selectedTerm) {
        if ([self.selectedTerm getVariants].count > 0) {
            return [self.selectedTerm getVariants].count;
        }else{
            return 0;
        }
    }else{
        return 0;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ResponseCell *cell = (ResponseCell *)[tableView dequeueReusableCellWithIdentifier:@"ResponseCell"];
    
    cell.lblMainText.text = ((Variants *)self.selectedTerm.getVariants[indexPath.row]).getText;
    [cell.lblMainText adjustsFontSizeToFitWidth];
    NSNumber *freq = ((Variants *)self.selectedTerm.getVariants[indexPath.row]).getFrequence;
    cell.lblFrequenceValue.text = [freq stringValue];
    NSNumber *since = ((Variants *)self.selectedTerm.getVariants[indexPath.row]).getSince;
    cell.lblSinceValue.text = [since stringValue];
    
    return cell;
}

@end
