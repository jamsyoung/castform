//
//  CastformViewController.m
//  castform
//
//  Created by jayoung on 10/27/13.
//  Copyright (c) 2013 jamsyoung. All rights reserved.
//

#import "CastformViewController.h"

@interface CastformViewController ()

@end

@implementation CastformViewController


- (IBAction)getFeed:(id)sender
{
    NSLog(@"getFeed button pressed");

    // this is never shown, no matter how long it takes the response to come back
    feedResponse.text = @"Retrieving data ...";

    NSURL *url = [NSURL URLWithString:@"http://api.wunderground.com/api/78908c8b9d29a5d2/conditions/q/GA/30064.json"];
    NSData *responseData = [NSData dataWithContentsOfURL:url];

    NSDictionary *serializedJsonData = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:nil];
    NSString *stringData = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];

    feedResponse.text = stringData;

    if ([NSJSONSerialization isValidJSONObject:serializedJsonData]) {
        // valid json
        genericOutput.text = [serializedJsonData valueForKeyPath:@"current_observation.temperature_string"];
    } else {
        genericOutput.text = @"Invalid JSON!  BOO!";
    }
}

@end
