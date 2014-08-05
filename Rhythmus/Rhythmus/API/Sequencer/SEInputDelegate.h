//
//  SEInputDelegate.h
//  Rhythmus_new
//
//  Created by Wadim on 7/30/14.
//  Copyright (c) 2014 Smirnov Electronics. All rights reserved.
//

#import <Foundation/Foundation.h>

// CR:  This protocol has to be private; define it within the SESequencer.m
@protocol SEInputDelegate <NSObject>

/**
 *  CR: The method's name is obscure and misleads. You code should always be
 *      selfexplanatory (as much as possible). First of all, how is an object
 *      that handles the delegated duties supposed to know who posts a message?
 *
 *      Follow these patterns when delegating any duties:
 *
 *          - (BOOL)shouldSomebodyDoSomething:(id)sender;
 *          - (void)somebodyDid/WillDoSomething:(id)sender;
 *          - (void)somebody:(id)sender did/WillFinishDoingSomethingWithResult:(id)result;
 *
 *      That's it! Isn't it simple? ;-)
 */
- (BOOL) receiveMessage:(SESequencerMessage *)message forTrack:(SESequencerTrack *)track;

@end
