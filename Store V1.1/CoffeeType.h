//
//  CoffeeType.h
//  Vending V1.0
//
//  Created by V&C on 30/09/15.
//  Copyright (c) 2015 V&C. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoffeeType : NSObject

@property NSString* name;
@property int type;
@property int steps;
@property float price;

-(id) initWithName : (NSString*) name;
-(id) initWithType : (int) type;

@end
