//
//  KBMSoundController.m
//  NPS Calculator
//
//  Created by Blake Merryman on 5/25/14.
//  Copyright (c) 2014 Blake Merryman. All rights reserved.
//

#import "KBMSoundController.h"

@implementation KBMSoundController

-(void)setUpSoundController
{
    // Get resource URLs for sound effects.
    NSURL *promoterSound  = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"tap-warm"       ofType:@"aif"]];
    NSURL *detractorSound = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"beep-rejected"  ofType:@"aif"]];
    NSURL *passiveSound   = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"tap-hollow"     ofType:@"aif"]];
    NSURL *resetSound     = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"slide-network"  ofType:@"aif"]];
    
    // Link URLs to Sound IDs
    AudioServicesCreateSystemSoundID( (__bridge CFURLRef) promoterSound,  &promoterSoundID  );
    AudioServicesCreateSystemSoundID( (__bridge CFURLRef) detractorSound, &detractorSoundID );
    AudioServicesCreateSystemSoundID( (__bridge CFURLRef) passiveSound,   &passiveSoundID   );
    AudioServicesCreateSystemSoundID( (__bridge CFURLRef) resetSound,     &resetSoundID     );
}

- (void) playSoundWithID:(NSString *)soundID
{
    if ( [soundID isEqualToString:@"promoter"] ) {
        AudioServicesPlaySystemSound(promoterSoundID);
    } else if ( [soundID isEqualToString:@"detractor"] ) {
        AudioServicesPlaySystemSound(detractorSoundID);
    } else if ( [soundID isEqualToString:@"passive"] ) {
        AudioServicesPlaySystemSound(passiveSoundID);
    } else if ( [soundID isEqualToString:@"reset"] ) {
        AudioServicesPlaySystemSound(resetSoundID);
    }
}

@end
