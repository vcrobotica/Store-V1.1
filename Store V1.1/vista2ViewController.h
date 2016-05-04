//
//  vista2ViewController.h
//  Vending 0.2
//
//  Created by V&C on 03/08/15.
//  Copyright (c) 2015 V&C. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RscMgr.h"

//@protocol vista2ViewControllerDelegate;





@interface vista2ViewController : UIViewController <RscMgrDelegate, UITableViewDataSource,UITableViewDelegate>
{

    NSIndexPath *currentSelection;
    UILabel * loteLb;
    UILabel * fechaLb;
    UILabel *nivelLb;
    UISlider *animAgua;
    UITextField *mailText;

    //id <vista2ViewControllerDelegate> theDelegate;
    
    
}

//- (void) setDelegate:(id)delegate;

@property (retain, nonatomic) IBOutlet UILabel *loteLb;
@property (retain, nonatomic) IBOutlet UILabel *fechaLb;
@property (retain, nonatomic) IBOutlet UILabel *nivelLb;
@property (retain, nonatomic) IBOutlet UITextField *mailText;
@property (retain, nonatomic) IBOutlet UISlider *animAgua;




//@property (nonatomic, assign) id  <vista2ViewControllerDelegate> theDelegate;

@end

//@protocol SelectionViewControllerDelegate

//- (void)selectionController:(SelectionViewController *)selectionController didSelectIndex:(int)index;


//@end


