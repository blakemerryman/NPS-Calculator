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
	// Do any additional setup after loading the view, typically from a nib.
    self.myNPS = [[NPScore alloc] init];
    [self updateAllLabels];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - User Interface Buttons
- (IBAction)addsPromoter:(id)sender
{
    [[self myNPS] addPromoter];
    [self updateAllLabels];
}

- (IBAction)addsPassive:(id)sender
{
    [[self myNPS] addPassive];
    [self updateAllLabels];
}

- (IBAction)addsDetractor:(id)sender
{
    [[self myNPS] addDetractor];
    [self updateAllLabels];
}

- (IBAction)reset:(id)sender
{
    [[self myNPS] resetNPS];
    [self updateAllLabels];
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
    
    if ( nps >= 75 )
    {
        self.netPromoterScoreLabel.backgroundColor = [UIColor colorWithRed:0.152 green:0.686 blue:0.383 alpha:0.500];
    } else {
        self.netPromoterScoreLabel.backgroundColor = [UIColor whiteColor];
    }
}

@end
