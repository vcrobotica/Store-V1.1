//
//  CoffeeType.m
//  Vending V1.0
//
//  Created by V&C on 30/09/15.
//  Copyright (c) 2015 V&C. All rights reserved.
//

#import "CoffeeType.h"

@implementation CoffeeType

int steps_coffee_milk = 26;
int steps_coffee_only = 16;

-(id) initWithName : (NSString*) name{
    self.name = name;
    self.type = [self getType];
    self.steps = [self getSteps];
    self.price = [self getPrices];
    return self;
}
-(id) initWithType : (int) type{
    self.type = type;
    self.name = [self getName];
    self.steps = [self getSteps];
    self.price = [self getPrices];
    return self;
}

-(int) getType{
    
    if([self.name isEqualToString: @"Lungo Intenso"])
       return 1;
    else if([self.name isEqualToString: @"Espresso Intenso"])
        return 2;
    else if([self.name isEqualToString: @"Latte Macchiato Caramel"])
        return 3;
    else if([self.name isEqualToString: @"Lungo"])
        return 4;
    else if([self.name isEqualToString: @"Americano"])
        return 5;
    else if([self.name isEqualToString: @"Latte Macchiato"])
        return 6;
    else if([self.name isEqualToString: @"Cappuccino Skinny"])
        return 7;
    else if([self.name isEqualToString: @"Espresso Barista"])
        return 8;
    else if([self.name isEqualToString: @"Chai Tea Latte"])
        return 9;
    else if([self.name isEqualToString: @"Marrakesh Style Tea"])
        return 10;
    else if([self.name isEqualToString: @"Latte Macchiato Vanilla"])
        return 11;
    else if([self.name isEqualToString: @"Cappuccino"])
        return 12;
    else if([self.name isEqualToString: @"Lungo Decaffeinato"])
        return 13;
    else if([self.name isEqualToString: @"Espresso Decaffeinato"])
        return 14;
    else if([self.name isEqualToString: @"Chococino"])
        return 15;
    else if([self.name isEqualToString: @"Espresso"])
        return 16;
    else if([self.name isEqualToString: @"Espresso Ristretto"])
        return 17;
    else if([self.name isEqualToString: @"Choco Caramel"])
        return 18;
    else if([self.name isEqualToString: @"Cortado"])
        return 19;
    else if([self.name isEqualToString: @"Cappuccino Ice"])
        return 20;
    else if([self.name isEqualToString: @"Grande Aroma"])
        return 21;
    else if([self.name isEqualToString: @"Grande Intenso"])
        return 22;
    else if([self.name isEqualToString: @"Cafe Au Lait"])
        return 23;
    else
        return -1;
}

-(NSString*) getName{
    switch (self.type)
    {
        case 1:
            return @"Lungo Intenso";
            break;
        case 2:
            return @"Espresso Intenso";
            break;
        case 3:
            return @"Latte Macchiato Caramel";
            break;
        case 4:
            return @"Lungo";
            break;
        case 5:
            return @"Americano";
            break;
        case 6:
            return @"Latte Macchiato";
            break;
        case 7:
            return @"Cappuccino Skinny";
            break;
        case 8:
            return @"Espresso Barista";
            break;
        case 9:
            return @"Chai Tea Latte";
            break;
        case 10:
            return @"Marrakesh Style Tea";
            break;
        case 11:
            return @"Latte Macchiato Vanilla";
            break;
        case 12:
            return @"Cappuccino";
            break;
        case 13:
            return @"Lungo Decaffeinato";
            break;
        case 14:
            return  @"Espresso Decaffeinato";
            break;
        case 15:
            return @"Chococino";
            break;
        case 16:
            return @"Espresso";
            break;
        case 17:
            return @"Espresso Ristretto";
            break;
        case 18:
            return @"Choco Caramel";
            break;
        case 19:
            return @"Cortado";
            break;
        case 20:
            return @"Cappuccino Ice";
            break;
        case 21:
            return @"Grande Aroma";
            break;
        case 22:
            return @"Grande Intenso";
            break;
        case 23:
            return @"Cafe Au Lait";
            break;
        default:
            return @"";
            break;
    }
}
-(int) getSteps{
    switch (self.type)
    {
        case 1:
            return steps_coffee_only;
            break;
        case 2:
            return steps_coffee_only;
            break;
        case 3:
            return steps_coffee_milk;
            break;
        case 4:
            return steps_coffee_only;
            break;
        case 5:
            return steps_coffee_only;
            break;
        case 6:
            return steps_coffee_milk;
            break;
        case 7:
            return steps_coffee_milk;
            break;
        case 8:
            return steps_coffee_only;
            break;
        case 9:
            return steps_coffee_milk;
            break;
        case 10:
            return steps_coffee_only;
            break;
        case 11:
            return steps_coffee_milk;
            break;
        case 12:
            return steps_coffee_milk;
            break;
        case 13:
            return steps_coffee_only;
            break;
        case 14:
            return  steps_coffee_only;
            break;
        case 15:
            return steps_coffee_milk;
            break;
        case 16:
            return steps_coffee_only;
            break;
        case 17:
            return steps_coffee_only;
            break;
        case 18:
            return steps_coffee_milk;
            break;
        case 19:
            return steps_coffee_only;
            break;
        case 20:
            return steps_coffee_milk;
            break;
        case 21:
            return steps_coffee_only;
            break;
        case 22:
            return steps_coffee_only;
            break;
        case 23:
            return steps_coffee_only;
            break;
        default:
            return -1;
            break;
    }
}

-(float) getPrices{
    switch (self.type)
    {
        case 1:
            return 20.00;
            break;
        case 2:
            return 20.00;
            break;
        case 3:
            return 20.00;
            break;
        case 4:
            return 20.00;
            break;
        case 5:
            return 20.00;
            break;
        case 6:
            return 20.00;
            break;
        case 7:
            return 20.00;
            break;
        case 8:
            return 20.00;
            break;
        case 9:
            return 20.00;
            break;
        case 10:
            return 20.00;
            break;
        case 11:
            return 20.00;
            break;
        case 12:
            return 20.00;
            break;
        case 13:
            return 20.00;
            break;
        case 14:
            return  20.00;
            break;
        case 15:
            return 20.00;
            break;
        case 16:
            return 20.00;
            break;
        case 17:
            return 20.00;
            break;
        case 18:
            return 20.00;
            break;
        case 19:
            return 20.00;
            break;
        case 20:
            return 20.00;
            break;
        case 21:
            return 20.00;
            break;
        case 22:
            return 20.00;
            break;
        case 23:
            return 20.00;
            break;
        default:
            return -1;
            break;
    }
}
@end
