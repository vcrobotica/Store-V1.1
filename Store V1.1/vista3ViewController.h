//
//  vista3ViewController.h
//  Vending 0.2
//
//  Created by V&C on 03/08/15.
//  Copyright (c) 2015 V&C. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface vista3ViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
{
    UILabel *datoLb;
    UILabel *slotEnEdicion;
    UILabel *lblDateDisplay;
    UITextField *loteText;
    UIDatePicker *fechaPicker;


}


@property (retain, nonatomic) IBOutlet UILabel *datoLb;
@property (retain, nonatomic) IBOutlet UILabel *slotEnEdicion;
@property (retain, nonatomic) IBOutlet UILabel  *lblDateDisplay;
@property (retain, nonatomic) IBOutlet UITextField  *loteText;
@property (retain, nonatomic) IBOutlet UIDatePicker *fechaPicker;



@end
