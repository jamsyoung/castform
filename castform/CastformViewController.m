//
//  CastformViewController.m
//  castform
//
//  Created by james young on 10/27/13.
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

    for (id key in conditions) {
        [genericOutput setText:[NSString stringWithFormat:@"%@%@: %@\n", genericOutput.text, key, [conditions valueForKey:key]]];
    }
}


@end
