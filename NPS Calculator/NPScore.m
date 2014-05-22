//
//  NPScore.m
//  NPS Calculator
//
//  Created by Blake Merryman on 5/21/14.
//  Copyright (c) 2014 Blake Merryman. All rights reserved.
//

#import "NPScore.h"

@interface NPScore ()

@property double netPromoterScore;
@property int numberOfPromoters;
@property int numberOfDetractors;
@property int numberOfTotalScores;

- (void) calculateNPS;

@end

@implementation NPScore

- (id)init
{
    self = [super init];
    if (self) {
        [self resetNPS];
    }
    return self;
}

-(void)addPromoter
{
    self.numberOfPromoters++;
    [self addPassive];
}

-(void)addPassive
{
    self.numberOfTotalScores++;
    [self calculateNPS];
}

-(void)addDetractor
{
    self.numberOfDetractors++;
    [self addPassive];
}

- (void) resetNPS
{
    self.netPromoterScore    = 0.0;
    self.numberOfPromoters   = 0;
    self.numberOfDetractors  = 0;
    self.numberOfTotalScores = 0;
}

#pragma mark - Private Implementations

- (void) calculateNPS
{
    self.netPromoterScore = ((double)self.numberOfPromoters - (double)self.numberOfDetractors) / (double)self.numberOfTotalScores;
}

@end
