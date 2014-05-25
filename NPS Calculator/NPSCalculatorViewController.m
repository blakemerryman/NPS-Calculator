//
//  NPSCalculatorViewController.m
//  NPS Calculator
//
//  Created by Blake Merryman on 5/21/14.
//  Copyright (c) 2014 Blake Merryman. All rights reserved.
//

#import "NPSCalculatorViewController.h"

#pragma mark - Private Interface Properties & Method(s)
@interface NPSCalculatorViewController ()

#pragma mark - Interface: NPS Calculator Labels

@property (weak, nonatomic) IBOutlet UILabel *netPromoterScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberOfDetractorsLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberOfPromotersLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberOfTotalScoresLabel;

- (void) updateAllLabels;

@end

#pragma mark -
@implementation NPSCalculatorViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Setup for NPS score object & label initialization.
    self.myNPS = [[NPScore alloc] init];
    [self updateAllLabels];
    
    // Setup for sound effects.
    self.mySoundController = [[KBMSoundController alloc] init];
    [self.mySoundController setUpSoundController];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UI Button Actions

- (IBAction)addsPromoter:(id)sender
{
    [[self myNPS] addPromoter];
    [self updateAllLabels];
    [self.mySoundController playSoundWithID:@"promoter"];
}

- (IBAction)addsPassive:(id)sender
{
    [[self myNPS] addPassive];
    [self updateAllLabels];
    [self.mySoundController playSoundWithID:@"passive"];
}

- (IBAction)addsDetractor:(id)sender
{
    [[self myNPS] addDetractor];
    [self updateAllLabels];
    [self.mySoundController playSoundWithID:@"detractor"];
}

- (IBAction)reset:(id)sender
{
    [[self myNPS] resetNPS];
    [self updateAllLabels];
    [self.mySoundController playSoundWithID:@"reset"];
}

#pragma mark - Private Method Implementation(s)

-(void)updateAllLabels
{
    // Set number of promoters label
    self.numberOfPromotersLabel.text = [NSString stringWithFormat:@"%i", self.myNPS.numberOfPromoters];
    
    // Set total number label
    self.numberOfTotalScoresLabel.text = [NSString stringWithFormat:@"%i", self.myNPS.numberOfTotalScores];
    
    // Set number of detractors label
    self.numberOfDetractorsLabel.text = [NSString stringWithFormat:@"%i", self.myNPS.numberOfDetractors];
    
    // Set NPS label
    double nps = self.myNPS.netPromoterScore * 100;
    self.netPromoterScoreLabel.text = [NSString stringWithFormat:@"%.00f%%", nps];
    
    // Checks to see if NPS is on target and sets background color accordingly
    if ( nps >= 75 )
    {
        self.netPromoterScoreLabel.backgroundColor = [UIColor colorWithRed:0.152 green:0.686 blue:0.383 alpha:0.500];
    } else {
        self.netPromoterScoreLabel.backgroundColor = [UIColor whiteColor];
    }
}

@end
