//
//  KBMSoundController.h
//  NPS Calculator
//
//  Created by Blake Merryman on 5/25/14.
//  Copyright (c) 2014 Blake Merryman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface KBMSoundController : NSObject

{
    // System Sound ID objects for sound effects
    SystemSoundID promoterSoundID;
    SystemSoundID detractorSoundID;
    SystemSoundID passiveSoundID;
    SystemSoundID resetSoundID;
}

- (void) setUpSoundController;
- (void) playSoundWithID:(NSString *)soundID;

@end
