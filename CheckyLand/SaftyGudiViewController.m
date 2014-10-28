//
//  SaftyGudiViewController.m
//  ParseExample
//
//  Created by Sami Shamsan on 10/27/14.
//  Copyright (c) 2014 Nicholas Barrowclough. All rights reserved.
//

#import "SaftyGudiViewController.h"

@interface SaftyGudiViewController ()

@end

@implementation SaftyGudiViewController
@synthesize myview;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [myview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.google.com"]]];
    myview.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    myview.scalesPageToFit = YES;
    myview.autoresizesSubviews = YES;
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

@end
