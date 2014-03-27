//
//  ViewController.m
//  FFBadgedBarButtonItem
//
//  Created by Mark Granoff on 3/27/14.
//  Copyright (c) 2014 Hawk iMedia. All rights reserved.
//

#import "ViewController.h"
#import "FFBadgedBarButtonItem.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIStepper *stepper;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.leftBarButtonItem = [[FFBadgedBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"1099-list-1"] target:self action:@selector(doSomething:)];
    
    _stepper.value = 0;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)doSomething:(id)sender
{
    NSString *msg = @"You tapped that bar button item.";
    FFBadgedBarButtonItem *button = (FFBadgedBarButtonItem *)self.navigationItem.leftBarButtonItem;
    if (button.badge && button.badge.length > 0)
        msg = [msg stringByAppendingFormat:@" The badge is '%@'", button.badge];
    else
        msg = [msg stringByAppendingString:@" The badge is blank."];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Tapped!" message:msg delegate:nil cancelButtonTitle:@"Cool!" otherButtonTitles:nil];
    [alert show];
}

- (IBAction)stepperValueChanged:(id)sender
{
    FFBadgedBarButtonItem *button = (FFBadgedBarButtonItem *)self.navigationItem.leftBarButtonItem;
    button.badge = (_stepper.value > 0 ? [NSString stringWithFormat:@"%d", (int)_stepper.value] : nil);
}
@end
