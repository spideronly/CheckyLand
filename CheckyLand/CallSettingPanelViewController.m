//
//  CallSettingPanelViewController.m
//  ParseExample
//
//  Created by Sami Shamsan on 10/27/14.
//  Copyright (c) 2014 Nicholas Barrowclough. All rights reserved.
//

#import "CallSettingPanelViewController.h"

@interface CallSettingPanelViewController ()

@end

@implementation CallSettingPanelViewController
@synthesize lblCallTime;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    
        if (buttonIndex == 1)
        {
            UITextField *textfield = [alertView textFieldAtIndex:0];
            lblCallTime.text= [NSString stringWithFormat:@" you will be called from the embassy %@ times a day, Click Change For updating the number",textfield.text];
            lblCallTime.numberOfLines=4;
           // NSLog(@"Number of call: %@",lbltext);
            
            
        }
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self StartTheEditingview];
  
    
}
- (BOOL)alertViewShouldEnableFirstOtherButton:(UIAlertView *)alertView
{
    
    NSString *inputText = [[alertView textFieldAtIndex:0] text];
    
    
    if( [inputText length] == 1 )
    {
       if( [inputText intValue] >=1 && [inputText intValue]<=5)
        
       {
           return YES;
       }
        else
        {
        return NO;
        }
        
        
    }
    else
    {
        return NO;
    }
}

-(void)StartTheEditingview
{


    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"(5 max) عدد مرات الاتصال يوميا" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"go", nil];
    
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [[alert textFieldAtIndex:0] setKeyboardType:UIKeyboardTypeNumberPad];
    
    //alert.tag = 5;
    
   // [alert addButtonWithTitle:@"Go"];
    [alert show];}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)BtnChange:(id)sender {
    [self StartTheEditingview];
 
}
@end
