//
//  CastformViewController.h
//  castform
//
//  Created by james young on 10/27/13.
//  Copyright (c) 2013 jamsyoung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CastformViewController : UIViewController
{
    IBOutlet UITextView *genericOutput;
}

- (IBAction)displayCurrentConditions:(id)sender;

@end
