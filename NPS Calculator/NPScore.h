//
//  NPScore.h
//  NPS Calculator
//
//  Created by Blake Merryman on 5/21/14.
//  Copyright (c) 2014 Blake Merryman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NPScore : NSObject

@property (readonly) double netPromoterScore;
@property (readonly) int numberOfPromoters;
@property (readonly) int numberOfDetractors;
@property (readonly) int numberOfTotalScores;

- (void) addPromoter;
- (void) addPassive;
- (void) addDetractor;
- (void) resetNPS;

@end
