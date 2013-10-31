//
//  CastformViewController.m
//  castform
//
//  Created by jayoung on 10/27/13.
//  Copyright (c) 2013 jamsyoung. All rights reserved.
//

#import "CastformViewController.h"
#import "WeatherFetcher.h"

@interface CastformViewController ()

@end

@implementation CastformViewController


- (IBAction)displayCurrentConditions:(id)sender
{
    NSLog(@"displayCurrentConditions button pressed");
    NSDictionary *conditions = [WeatherFetcher getConditionsForState:@"GA" zip:@"30060"];

    NSLog(@"%@", conditions);

    NSDictionary *currentObservation = [conditions valueForKey:@"current_observation"];
    for (id key in currentObservation) {
        [genericOutput setText:[NSString stringWithFormat:@"%@%@: %@\n", genericOutput.text, key, [currentObservation valueForKey:key]]];
    }
}


@end
