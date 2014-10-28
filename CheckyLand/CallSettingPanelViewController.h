//
//  CallSettingPanelViewController.h
//  ParseExample
//
//  Created by Sami Shamsan on 10/27/14.
//  Copyright (c) 2014 Nicholas Barrowclough. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CallSettingPanelViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *lblCallTime;

- (IBAction)BtnChange:(id)sender;
@end
