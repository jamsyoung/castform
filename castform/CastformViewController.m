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

    NSURL *url = [NSURL URLWithString:@"http://api.wunderground.com/api/78908c8b9d29a5d2/conditions/q/GA/30064.json"];
    NSData *responseData = [NSData dataWithContentsOfURL:url];

    NSDictionary *serializedJsonData = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:nil];

//    NSString *stringData = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
//    NSLog(@"%@", stringData);

    if ([NSJSONSerialization isValidJSONObject:serializedJsonData]) {
//        NSString *currentTemperature = [serializedJsonData valueForKeyPath:@"current_observation.temperature_string"];
//        [genericOutput setText:[NSString stringWithFormat:@"%@Current Temperature: %@\n", genericOutput.text, currentTemperature]];

        NSDictionary *currentObservation = [serializedJsonData valueForKey:@"current_observation"];



        // for / in - straight up
        CFTimeInterval startTime1 = CACurrentMediaTime();
        for (id currentKey in currentObservation) {
            [genericOutput setText:[NSString stringWithFormat:@"%@%@: %@\n", genericOutput.text, currentKey, [currentObservation valueForKey:currentKey]]];
        }
        NSLog(@"1: %f", CACurrentMediaTime() - startTime1);





        // for / in + keyEnumerator
//        CFTimeInterval startTime2 = CACurrentMediaTime();
//        for (id currentKey in [currentObservation keyEnumerator]) {
//            [genericOutput setText:[NSString stringWithFormat:@"%@%@: %@\n", genericOutput.text, currentKey, [currentObservation valueForKey:currentKey]]];
//        }
//        NSLog(@"2: %f", CACurrentMediaTime() - startTime2);





        // while + keyEnumerator
//        CFTimeInterval startTime3 = CACurrentMediaTime();
//        NSEnumerator *keyEnumerator = [currentObservation keyEnumerator];
//        NSString *currentKey;
//        while (currentKey = [keyEnumerator nextObject]) {
//            [genericOutput setText:[NSString stringWithFormat:@"%@%@: %@\n", genericOutput.text, currentKey, [currentObservation valueForKey:currentKey]]];
//        }
//        NSLog(@"3: %f", CACurrentMediaTime() - startTime3);





        // for / in + allKeys
//        CFTimeInterval startTime4 = CACurrentMediaTime();
//        for (NSString *key in [currentObservation allKeys]) {
//            [genericOutput setText:[NSString stringWithFormat:@"%@%@: %@\n", genericOutput.text, key, [currentObservation valueForKey:key]]];
//            //            NSLog(@"%@", key);
//        }
//        NSLog(@"4: %f", CACurrentMediaTime() - startTime4);






    } else {
        genericOutput.text = @"Invalid JSON!  BOO!";
    }
}

@end
