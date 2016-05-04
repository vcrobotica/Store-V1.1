//
//  vista2ViewController.m
//  Vending 0.2
//
//  Created by V&C on 03/08/15.
//  Copyright (c) 2015 V&C. All rights reserved.
//

#import "vista2ViewController.h"

@interface vista2ViewController ()

@end

@implementation vista2ViewController

@synthesize loteLb;
@synthesize fechaLb;
@synthesize nivelLb;
@synthesize mailText;
@synthesize animAgua;

NSArray *recipes;
NSArray *productos2;

NSNumber *nivelAgua;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        recipes = [NSArray arrayWithObjects:@"Slot 1", @"Slot 2", @"Slot 3", @"Slot 4", @"Slot 5", @"Slot 6", @"Slot 7", @"Slot 8", @"Slot 9", @"Slot 10", @"Slot 11", @"Slot 12", @"Slot 13", @"Slot 14", @"Slot 15", @"Slot 16", @"Slot 17", @"Slot 18", @"Slot 19", @"Slot 20", @"Slot 21", @"Slot 22", @"Slot 23", @"Slot 24", @"Slot 25", @"Slot 26", @"Slot 27", @"Slot 28", @"Slot 29", @"Slot 30", @"Slot 31", @"Slot 32", @"Slot 33", @"Slot 34", @"Slot 35", @"Slot 36", @"Slot 37", @"Slot 38", @"Slot 39", @"Slot 40",nil];
    
    // Find out the path of recipes.plist
    NSString *path = [[NSBundle mainBundle] pathForResource:@"productos" ofType:@"plist"];
    
    // Load the file content and read the data into arrays
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    productos2 = [dict objectForKey:@"Productos"];
    
    CGAffineTransform trans = CGAffineTransformMakeRotation(-M_PI_2);
    animAgua.transform = trans;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSNumber *nivel = [defaults valueForKey:@"nivelAguaAct"];
    
    self.animAgua.value = [nivel doubleValue];
    self.nivelLb.text = [NSString stringWithFormat:@"Nivel de agua: %@", nivel];
    
    NSString *mail1 = [defaults valueForKey:@"mailAct1"];
    
    self.mailText.text = mail1;
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)adelante:(id)sender {
        UIStoryboard *mainStoryboard =[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *var = [mainStoryboard instantiateViewControllerWithIdentifier:@"variedades"];
        [self presentViewController:var animated:YES completion:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [recipes count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:simpleTableIdentifier];
    }
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    cell.textLabel.text = [recipes objectAtIndex:indexPath.row];
    
    NSMutableArray *arreglo = [NSMutableArray arrayWithArray:[defaults objectForKey:@"productosAct"]];
    
    cell.detailTextLabel.text = arreglo[indexPath.row];
    
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSNumber *ind = [NSNumber numberWithInteger: indexPath.row];
    
    [defaults setValue:ind forKey:@"slotSelec"];
    
    NSMutableArray *lotes = [NSMutableArray arrayWithArray:[defaults objectForKey:@"lotesAct"]];
    
    NSMutableArray *fechas = [NSMutableArray arrayWithArray:[defaults objectForKey:@"fechasAct"]];
    
    self.loteLb.text = [lotes objectAtIndex:indexPath.row];
    
    self.fechaLb.text = [fechas objectAtIndex:indexPath.row];
    
}


- (IBAction)nivelLlenoPressed:(id)sender {
    
    nivelAgua = [NSNumber numberWithDouble: 20000];
    
    self.animAgua.value = [nivelAgua doubleValue];
    
    self.nivelLb.text = [NSString stringWithFormat:@"Nivel de agua: %@", nivelAgua];
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    
    [defaults setValue:nivelAgua forKey:@"nivelAguaAct"];
    [defaults synchronize];
    
}

- (IBAction)sliderPressed:(id)sender {
    
    nivelAgua = [NSNumber numberWithInt: self.animAgua.value];
    
    self.nivelLb.text = [NSString stringWithFormat:@"Nivel de agua: %@", nivelAgua];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setValue:nivelAgua forKey:@"nivelAguaAct"];
    [defaults synchronize];
    

}


- (IBAction)mailEntered:(id)sender {
    
    NSString *correo = self.mailText.text;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:correo forKey:@"mailAct1"];
    [defaults synchronize];
    
}



- (IBAction)regresarPressed:(id)sender {
    
    //UIStoryboard *mainStoryboard =[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    //UIViewController *configuracion = [mainStoryboard instantiateViewControllerWithIdentifier:@"principal"];
    //[self presentViewController:configuracion animated:YES completion:nil];
    
    exit(0);
    
    
}

@end
