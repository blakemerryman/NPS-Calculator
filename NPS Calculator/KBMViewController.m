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

- (void) updateAllLabels;

@end

@implementation KBMViewController

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

#pragma mark - Private Method Implementations

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
        self.netPromoterScoreLabel.backgroundColor = [UIColor greenColor];
    } else {
        self.netPromoterScoreLabel.backgroundColor = [UIColor whiteColor];
    }
}

@end
