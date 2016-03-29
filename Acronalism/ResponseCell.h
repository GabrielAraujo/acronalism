//
//  ResponseCell.h
//  
//
//  Created by Gabriel Araujo on 29/03/16.
//
//

#import <UIKit/UIKit.h>

@interface ResponseCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblMainText;
@property (weak, nonatomic) IBOutlet UILabel *lblFrequence;
@property (weak, nonatomic) IBOutlet UILabel *lblSince;
@property (weak, nonatomic) IBOutlet UILabel *lblFrequenceValue;
@property (weak, nonatomic) IBOutlet UILabel *lblSinceValue;

@end
