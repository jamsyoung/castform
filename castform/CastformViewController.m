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

    feedResponse.text = @"You pressed the Get Feed button!";
}


@end
