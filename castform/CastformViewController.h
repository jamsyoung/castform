//
//  CastformViewController.h
//  castform
//
//  Created by jayoung on 10/27/13.
//  Copyright (c) 2013 jamsyoung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CastformViewController : UIViewController
{
    IBOutlet UITextView *feedResponse;
    IBOutlet UITextView *genericOutput;
}

- (IBAction)getFeed:(id)sender;

@end
