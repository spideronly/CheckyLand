//
//  TimerViewController.h
//  ParseExample
//
//  Created by Sami Shamsan on 10/26/14.
//  Copyright (c) 2014 Nicholas Barrowclough. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimerViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *lblNotanswering;
@property (weak, nonatomic) IBOutlet UIButton *BtnIamOkay;
@property (weak, nonatomic) IBOutlet UIButton *BtnCallEmbassy;
- (IBAction)BtnIamOkay:(id)sender;
- (IBAction)BtnCallEmbassy:(id)sender;

@end
