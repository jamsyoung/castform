//
//  WeatherFetcher.m
//  castform
//
//  Created by james young on 10/30/13.
//  Copyright (c) 2013 jamsyoung. All rights reserved.
//
// inspired by https://github.com/sefk/cs193p-shutterbug/blob/master/Shutterbug/FlickrFetcher.m


#import "WeatherFetcher.h"

@implementation WeatherFetcher


+ (NSDictionary *)executeWeatherFetchForRequest:(NSString *)request
{
    NSString *apiKey = @"78908c8b9d29a5d2";

    NSString *query = [NSString stringWithFormat:@"http://api.wunderground.com/api/%@/%@", apiKey, request];
    query = [query stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"query: %@", query);

    NSData *jsonData = [[NSString stringWithContentsOfURL:[NSURL URLWithString:query] encoding:NSUTF8StringEncoding error:nil] dataUsingEncoding:NSUTF8StringEncoding];

    NSError *error = nil;
    NSDictionary *results = jsonData ? [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error] : nil;

    if (error) {
        NSLog(@"[%@ %@] JSON error: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), error.localizedDescription);
    }

    return results;
}


+ (NSDictionary *)getConditionsForState:(NSString *)state zip:(NSString *)zip
{
    NSString *request = [NSString stringWithFormat:@"conditions/q/%@/%@.json", state, zip];
    NSDictionary *response = [self executeWeatherFetchForRequest:request];

    return [response valueForKey:@"current_observation"];
}


@end



// Stuff I am not ready to delete yet (or dig though previous git commits to find)

//    [self getWeatherDataWithUrl:@"http://api.wunderground.com/api/78908c8b9d29a5d2/conditions/q/GA/30064.json"];
//    [self getWeatherDataWithUrl:@"https://api.mongolab.com/api/1/databases/wunderground-30064/collections/wunderground-data?apiKey=bE4_VaRW1UBRDs87vM8z-3UzNLCIawNY"];

//- (void)getWeatherDataWithUrl:(NSString*)url
//{
//    NSURL *uri = [NSURL URLWithString:url];
//    NSData *responseData = [NSData dataWithContentsOfURL:uri];
//
//    NSString *stringData = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
//    NSLog(@"%@", stringData);
//
//    NSArray *serializedJsonData = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:nil];
//
//
//
//    if ([NSJSONSerialization isValidJSONObject:serializedJsonData]) {
//
//        NSDictionary *currentObservation;
//        // check if serializedJsonData is a Dictionary or an Array - ASSUMPTION it will be one or the other
//        if ([serializedJsonData isKindOfClass:[NSDictionary class]]) {
//            currentObservation = [serializedJsonData valueForKey:@"current_observation"];
//        } else {
//            currentObservation = [serializedJsonData[0] valueForKey:@"current_observation"];
//        }
//
//        for (id currentKey in currentObservation) {
//            [genericOutput setText:[NSString stringWithFormat:@"%@%@: %@\n", genericOutput.text, currentKey, [currentObservation valueForKey:currentKey]]];
//        }
//    } else {
//        genericOutput.text = @"Invalid JSON!  BOO!";
//    }
//}


/*
Example response for http://api.wunderground.com/api/78908c8b9d29a5d2/conditions/q/GA/30064.json
Snapshot at https://api.mongolab.com/api/1/databases/wunderground-30064/collections/wunderground-data?apiKey=bE4_VaRW1UBRDs87vM8z-3UzNLCIawNY

curl -X POST -d @wunderground-30064-response.json https://api.mongolab.com/api/1/databases/wunderground-30064/collections/wunderground-data?apiKey=bE4_VaRW1UBRDs87vM8z-3UzNLCIawNY --header "Content-Type: application/json"

{
    "response": {
        "version": "0.1",
        "termsofService": "http://www.wunderground.com/weather/api/d/terms.html",
        "features": {
            "conditions": 1
        }
    },
    "current_observation": {
        "image": {
            "url": "http://icons-ak.wxug.com/graphics/wu2/logo_130x80.png",
            "title": "Weather Underground",
            "link": "http://www.wunderground.com"
        },
        "display_location": {
            "full": "Marietta, GA",
            "city": "Marietta",
            "state": "GA",
            "state_name": "Georgia",
            "country": "US",
            "country_iso3166": "US",
            "zip": "30064",
            "magic": "1",
            "wmo": "99999",
            "latitude": "33.93856430",
            "longitude": "-84.61505890",
            "elevation": "331.00000000"
        },
        "observation_location": {
            "full": "leem's house (GWO HQ), Marietta, Georgia",
            "city": "leem's house (GWO HQ), Marietta",
            "state": "Georgia",
            "country": "US",
            "country_iso3166": "US",
            "latitude": "33.920177",
            "longitude": "-84.633575",
            "elevation": "994 ft"
        },
        "estimated": {},
        "station_id": "KGAMARIE52",
        "observation_time": "Last Updated on October 30, 8:02 AM EDT",
        "observation_time_rfc822": "Wed, 30 Oct 2013 08:02:15 -0400",
        "observation_epoch": "1383134535",
        "local_time_rfc822": "Wed, 30 Oct 2013 08:03:53 -0400",
        "local_epoch": "1383134633",
        "local_tz_short": "EDT",
        "local_tz_long": "America/New_York",
        "local_tz_offset": "-0400",
        "weather": "Clear",
        "temperature_string": "52.0 F (11.1 C)",
        "temp_f": 52,
        "temp_c": 11.1,
        "relative_humidity": "99%",
        "wind_string": "Calm",
        "wind_dir": "SE",
        "wind_degrees": 135,
        "wind_mph": 0,
        "wind_gust_mph": 0,
        "wind_kph": 0,
        "wind_gust_kph": 0,
        "pressure_mb": "1026",
        "pressure_in": "30.30",
        "pressure_trend": "+",
        "dewpoint_string": "52 F (11 C)",
        "dewpoint_f": 52,
        "dewpoint_c": 11,
        "heat_index_string": "NA",
        "heat_index_f": "NA",
        "heat_index_c": "NA",
        "windchill_string": "NA",
        "windchill_f": "NA",
        "windchill_c": "NA",
        "feelslike_string": "52.0 F (11.1 C)",
        "feelslike_f": "52.0",
        "feelslike_c": "11.1",
        "visibility_mi": "7.0",
        "visibility_km": "11.3",
        "solarradiation": "--",
        "UV": "0",
        "precip_1hr_string": "0.00 in ( 0 mm)",
        "precip_1hr_in": "0.00",
        "precip_1hr_metric": " 0",
        "precip_today_string": "0.00 in (0 mm)",
        "precip_today_in": "0.00",
        "precip_today_metric": "0",
        "icon": "clear",
        "icon_url": "http://icons-ak.wxug.com/i/c/k/clear.gif",
        "forecast_url": "http://www.wunderground.com/US/GA/Marietta.html",
        "history_url": "http://www.wunderground.com/weatherstation/WXDailyHistory.asp?ID=KGAMARIE52",
        "ob_url": "http://www.wunderground.com/cgi-bin/findweather/getForecast?query=33.920177,-84.633575"
    }
}
*/