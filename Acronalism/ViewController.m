//
//  ViewController.m
//  Acronalism
//
//  Created by Gabriel Araujo on 29/03/16.
//  Copyright (c) 2016 Gabriel Araujo. All rights reserved.
//

#import "ViewController.h"
#import "ResponseCell.h"
#import "Terms.h"
#import "MBProgressHUD.h"
#import "VariablesViewController.h"

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
    //Remove keyboard
    [self.view endEditing:YES];
    //Add HUD
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    if ([self.txtSearch.text isEqualToString:@""] || !self.txtSearch.text) {
        //Error, no values on textfield
        //Create custom error
        NSDictionary *userInfo = [NSDictionary dictionaryWithObject:@"Textfield is clean.. Type something to search" forKey:NSLocalizedDescriptionKey];
        NSError *error = [[NSError alloc] initWithDomain:@"Response" code:-404 userInfo:userInfo];
        //Remove HUD
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        //Display error message
        [self displayErrorMessageWithError:error];
    }else{
        acronym = [[Acronym alloc] init];
        //Fetch data
        [acronym fetchAllWithAcromyn:self.txtSearch.text completion:^(BOOL success, NSError *error) {
            if (success) {
                //Removes HUD and reload table view data
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                [self.tableView reloadData];
            }else{
                //Error
                //Removes HUD and display error message
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                [self displayErrorMessageWithError:error];
            }
        }];
    }
}

//Helper
-(void)displayErrorMessageWithError:(NSError *)error {
    //Alert message
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                    message:error.localizedDescription
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

//Segue
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //Add information to the VC to display the selected item
    if ([segue.identifier isEqualToString:@"VCToVariables"]) {
        if (self.acronym) {
            VariablesViewController *VC = (VariablesViewController *)segue.destinationViewController;
            VC.acronym = self.acronym;
            VC.selectedTerm = [acronym getTerms][((NSIndexPath *)sender).row];
        }
    }
}

//Table View
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.acronym) {
        if ([self.acronym getTerms].count > 0) {
            return [self.acronym getTerms].count;
        }else{
            return 0;
        }
    }else{
        return 0;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ResponseCell *cell = (ResponseCell *)[tableView dequeueReusableCellWithIdentifier:@"ResponseCell"];
    
    cell.lblMainText.text = ((Terms *)self.acronym.getTerms[indexPath.row]).getText;
    [cell.lblMainText adjustsFontSizeToFitWidth];
    NSNumber *freq = ((Terms *)self.acronym.getTerms[indexPath.row]).getFrequence;
    cell.lblFrequenceValue.text = [freq stringValue];
    NSNumber *since = ((Terms *)self.acronym.getTerms[indexPath.row]).getSince;
    cell.lblSinceValue.text = [since stringValue];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"VCToVariables" sender:indexPath];
}

@end
