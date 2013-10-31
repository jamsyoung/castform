//
//  WeatherFetcher.h
//  castform
//
//  Created by james young on 10/30/13.
//  Copyright (c) 2013 jamsyoung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherFetcher : NSObject

+ (NSDictionary *)getConditionsForState:(NSString *)state zip:(NSString *)zip;

@end
