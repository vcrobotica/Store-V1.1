//
//  CoffeeButton.h
//  Vending V1.0
//
//  Created by V&C on 28/09/15.
//  Copyright (c) 2015 V&C. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewController.h"

@interface CoffeeButton : NSObject
- (void)executeSelection:(ViewController*)view :(NSString*)coffename : (NSString*)imgmenu : (NSString*)imgdescription : (NSString*)imgbtn : (int) volbuy;
@end
