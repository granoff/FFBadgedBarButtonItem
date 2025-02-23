//
//  ViewController.m
//  FFBadgedBarButtonItem
//
//  Created by Mark Granoff on 3/27/14.
//  Copyright (c) 2014 Hawk iMedia. All rights reserved.
//

#import "ViewController.h"
#import "FFBadgedBarButtonItem_Demo-Swift.h"

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

    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Tapped!"
                                                                   message:msg
                                                            preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction: [UIAlertAction actionWithTitle:@"Cool!" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        ;
    }]];

    [self presentViewController:alert animated:YES completion:nil];
}

- (IBAction)stepperValueChanged:(id)sender
{
    FFBadgedBarButtonItem *button = (FFBadgedBarButtonItem *)self.navigationItem.leftBarButtonItem;
    button.badge = (_stepper.value > 0 ? [NSString stringWithFormat:@"%d", (int)_stepper.value] : nil);
}
@end
