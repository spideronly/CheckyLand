//
//  TimerViewController.m
//  ParseExample
//
//  Created by Sami Shamsan on 10/26/14.
//  Copyright (c) 2014 Nicholas Barrowclough. All rights reserved.
//

#import "TimerViewController.h"
#import <AVFoundation/AVAudioPlayer.h>


@interface TimerViewController ()
{
    IBOutlet UILabel *lblCountdown;
    int   countDown;
    int second;
    int exitcountdown ;
    NSTimer *countDownTimer;
    AVAudioPlayer *secondBeep;
    
}

@end

@implementation TimerViewController
@synthesize BtnCallEmbassy;
@synthesize BtnIamOkay;
@synthesize lblNotanswering;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (AVAudioPlayer *)setupAudioPlayerWithFile:(NSString *)file type:(NSString *)type
{
    // 1
    NSString *path = [[NSBundle mainBundle] pathForResource:file ofType:type];
    NSURL *url = [NSURL fileURLWithPath:path];
    
    // 2
    NSError *error;
    
    // 3
    AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    
    // 4
    if (!audioPlayer) {
        NSLog(@"%@",[error description]);
    }
    
    // 5
    return audioPlayer;
}

- (void)viewDidLoad
{
    BtnIamOkay.backgroundColor=[UIColor greenColor];
    BtnCallEmbassy.backgroundColor=[UIColor redColor];

    lblNotanswering.hidden = YES;
    lblCountdown.backgroundColor=[UIColor orangeColor];
    countDown = 7;
    exitcountdown = 0;
    lblCountdown.hidden = YES;
    BtnCallEmbassy.hidden = YES;
    BtnIamOkay.hidden = YES;
    
 
    countDownTimer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                      target:self
                                                    selector:@selector(updateTime:)
                                                    userInfo:nil
                                                     repeats:YES];
    secondBeep = [self setupAudioPlayerWithFile:@"beep-08b" type:@"mp3"];


    [countDownTimer fire];
    
}


-(void)updateTime:(NSTimer*)timerParam
{
    
    countDown--;
    [secondBeep play];

    
    
    if (countDown==5)
    {
        lblCountdown.hidden = NO;

      
        lblCountdown.text = [NSString stringWithFormat:@"%d",countDown];

        
      //  btnCancel.hidden = NO;
        
       
       // [countDownTimer fire];
    }
    else if (countDown==0)
    {
        
       // [self dismissViewControllerAnimated:YES completion:nil];
        lblNotanswering.enabled=YES;
        
        [self performSelectorOnMainThread:@selector(stopTimer) withObject:nil waitUntilDone:YES];
        BtnCallEmbassy.hidden = NO;
        BtnIamOkay.hidden = NO;
        

        
    }
    lblCountdown.text = [NSString stringWithFormat:@"%d",countDown];
}
- (void) stopTimer
{
    [secondBeep stop];

    [countDownTimer invalidate];
    
    countDownTimer = nil;
 
     [lblNotanswering setHidden:NO];

    [lblCountdown setHidden:YES];

}


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

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return NO;
}


- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 5)
    {
        if (buttonIndex == 1)
        {
            UITextField *textfield = [alertView textFieldAtIndex:0];

            NSLog(@"Phone Number is: %@", textfield.text);
            lblNotanswering.text=@"this is from prayer";
            BtnCallEmbassy.hidden=YES;
            BtnIamOkay.hidden=YES;
        }
    }
   
}
- (IBAction)BtnIamOkay:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"رقم جوالك للتآكيد" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
    
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [[alert textFieldAtIndex:0] setKeyboardType:UIKeyboardTypeNumberPad];

    alert.tag = 5;
    
    [alert addButtonWithTitle:@"Go"];
    [alert show];
    
    /*UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"What is your phone number?"
                                                      message:nil
                                                     delegate:self
                                            cancelButtonTitle:@"Cancel"
                                            otherButtonTitles:@"Confirm", nil];
    
    [message setAlertViewStyle:UIAlertViewStylePlainTextInput];
    [message show];
    
*/
}

- (IBAction)BtnCallEmbassy:(id)sender {
   [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:9498542301"]];
    
}
@end
