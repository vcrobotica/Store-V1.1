//
//  vista3ViewController.m
//  Vending 0.2
//
//  Created by V&C on 03/08/15.
//  Copyright (c) 2015 V&C. All rights reserved.
//

#import "vista3ViewController.h"
#import "CoffeeType.h"

@interface vista3ViewController ()

@end

@implementation vista3ViewController

@synthesize datoLb;
@synthesize loteText;
@synthesize slotEnEdicion;
@synthesize lblDateDisplay;
@synthesize fechaPicker;


NSArray *productos;
NSMutableArray *productosNuevos;
NSMutableArray *lotesNuevos;
NSMutableArray *fechasNuevas;
NSInteger tipoSelec = -1;
NSInteger valor;


NSDate *selectedDate;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Find out the path of recipes.plist
    NSString *path = [[NSBundle mainBundle] pathForResource:@"productos" ofType:@"plist"];
    
    // Load the file content and read the data into arrays
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    productos = [dict objectForKey:@"Productos"];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSNumber *slot = [defaults objectForKey:@"slotSelec"];
    valor = [slot integerValue] + 1;
    
    self.slotEnEdicion.text = [NSString stringWithFormat:@"Producto para el slot %ld", (long)valor];
    
    productosNuevos = [NSMutableArray arrayWithArray:[defaults objectForKey:@"productosAct"]];
    lotesNuevos = [NSMutableArray arrayWithArray:[defaults objectForKey:@"lotesAct"]];
    fechasNuevas = [NSMutableArray arrayWithArray:[defaults objectForKey:@"fechasAct"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(NSMutableArray*)getDoubleCoffees{
    NSMutableArray *dcofs =[[NSMutableArray alloc] init];
    
    for(int i=0; i<productos.count; i++){
        NSString *name = productos[i];
        CoffeeType *co = [[CoffeeType alloc] initWithName:name];
        
        if(co.steps == 26){
            [dcofs addObject:productos[i]];
        }
    }
    return dcofs;
}

-(NSMutableArray*)getSimpleCoffees{
    NSMutableArray *scofs =[[NSMutableArray alloc] init];
    
    for(int i=0; i<productos.count; i++){
        NSString *name = productos[i];
        CoffeeType *co = [[CoffeeType alloc] initWithName:name];

        if(co.steps == 16){
            [scofs addObject:productos[i]];
        }
    }
    return scofs;
}

-(int) getIndexRowFromName:(NSString*) pname{
    
    for(int i=0; i<productos.count; i++){
        NSString *name = productos[i];
        if([pname isEqualToString:name])
            return i;
    }
    return -1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(valor%2==0)
        return [[self getDoubleCoffees] count];
    else
        return [[self getSimpleCoffees] count];
        
    //Roger [productos count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    if(valor%2==0){
        cell.textLabel.text = [[self getDoubleCoffees] objectAtIndex:indexPath.row];
        return cell;
    }
    else{
        cell.textLabel.text = [[self getSimpleCoffees] objectAtIndex:indexPath.row];
        return cell;
    }
    
    /*Roger
    cell.textLabel.text = [productos objectAtIndex:indexPath.row];
    return cell;
     */
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(valor%2==0){
        datoLb.text = [[self getDoubleCoffees] objectAtIndex:indexPath.row];
        //tipoSelec = indexPath.row;
    }
    else{
        datoLb.text = [[self getSimpleCoffees] objectAtIndex:indexPath.row];
        //tipoSelec = indexPath.row;
    }
    
    
    tipoSelec = [self getIndexRowFromName:datoLb.text];
    
    /*Roger
    datoLb.text = [productos objectAtIndex:indexPath.row];
    tipoSelec = indexPath.row;
    */
}


- (IBAction)loteIngresado:(id)sender {
    
}


- (IBAction)aceptarPressed:(id)sender {
    NSDateFormatter *fechaFormatter = [[NSDateFormatter alloc] init];
    selectedDate = self.fechaPicker.date;
    [fechaFormatter setDateFormat:@"dd-MM-yyyy"]; //no.3
    self.lblDateDisplay.text = [NSString stringWithFormat:@"%@", [fechaFormatter stringFromDate: selectedDate]]; //no.1
    //[fechaFormatter stringFromDate: selectedDate]
    
    if ([self.loteText.text  isEqual: @""] && tipoSelec != 0){
        
        [[[UIAlertView alloc] initWithTitle:@"Error"
                                     message:[NSString stringWithFormat:@"Favor de ingresar nuevo lote"]
                                    delegate:nil
                           cancelButtonTitle:@"OK"
                           otherButtonTitles:nil] show];
        
        
    }
    else if(tipoSelec == -1){
        [[[UIAlertView alloc] initWithTitle:@"Error"
                                    message:[NSString stringWithFormat:@"No se ha seleccionado producto para el slot"]
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
        
    }
        
    else{
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        NSNumber *slot = [defaults objectForKey:@"slotSelec"];
        
        lotesNuevos[[slot integerValue]] = self.loteText.text;
        
        /*
        if (tipoSelec == 3 || tipoSelec == 6 || tipoSelec == 7 || tipoSelec == 9 || tipoSelec == 11 || tipoSelec == 12 || tipoSelec == 15 || tipoSelec == 18 || tipoSelec == 20) {
            lotesNuevos[[slot integerValue] + 1] = self.loteText.text;
        }
         */
        
        productosNuevos[[slot integerValue]] = [productos objectAtIndex:tipoSelec];
        
        /*
        if (tipoSelec == 3 || tipoSelec == 6 || tipoSelec == 7 || tipoSelec == 9 || tipoSelec == 11 || tipoSelec == 12 || tipoSelec == 15 || tipoSelec == 18 || tipoSelec == 20) {
            productosNuevos[[slot integerValue] + 1] = [productos objectAtIndex:tipoSelec];
        }
        */
        
        
        fechasNuevas[[slot integerValue]] = [NSString stringWithFormat:@"%@", [fechaFormatter stringFromDate: selectedDate]];
        
        /*
        if (tipoSelec == 3 || tipoSelec == 6 || tipoSelec == 7 || tipoSelec == 9 || tipoSelec == 11 || tipoSelec == 12 || tipoSelec == 15 || tipoSelec == 18 || tipoSelec == 20) {
            fechasNuevas[[slot integerValue]+1] = [NSString stringWithFormat:@"%@", [fechaFormatter stringFromDate: selectedDate]];
        }
         */
        
        [defaults setObject:fechasNuevas forKey:@"fechasAct"];
        [defaults setObject:productosNuevos forKey:@"productosAct"];
        [defaults setObject:lotesNuevos forKey:@"lotesAct"];
        [defaults synchronize];
        
        
        
        
        UIStoryboard *mainStoryboard =[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *configuracion = [mainStoryboard instantiateViewControllerWithIdentifier:@"configuracion"];
        [self presentViewController:configuracion animated:YES completion:nil];
        
    }
    
    
    
}


- (IBAction)cancelarPressed:(id)sender {
    UIStoryboard *mainStoryboard =[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *configuracion = [mainStoryboard instantiateViewControllerWithIdentifier:@"configuracion"];
    [self presentViewController:configuracion animated:YES completion:nil];
    
    
    
}


@end

