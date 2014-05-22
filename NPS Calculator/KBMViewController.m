//
//  KBMViewController.m
//  NPS Calculator
//
//  Created by Blake Merryman on 5/21/14.
//  Copyright (c) 2014 Blake Merryman. All rights reserved.
//

#import "KBMViewController.h"

@interface KBMViewController ()

@property (weak, nonatomic) IBOutlet UILabel *netPromoterScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberOfDetractorsLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberOfPromotersLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberOfTotalScoresLabel;

@end

@implementation KBMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - User Interface Buttons
- (IBAction)addsPromoter:(id)sender
{
    
}

- (IBAction)addsPassive:(id)sender
{
    
}

- (IBAction)addsDetractor:(id)sender
{
    
}

- (IBAction)reset:(id)sender
{
    
}

@end
