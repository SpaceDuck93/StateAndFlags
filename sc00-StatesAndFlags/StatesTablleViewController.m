//
//  StatesTablleViewController.m
//  sc00-StatesAndFlags
//
//  Created by Alfredo Perez on 11/2/16.
//  Copyright © 2016 COP2654. All rights reserved.
//

#import "StatesTablleViewController.h"
#import "States.h"
#import "StateTableViewCell.h"
#import "StateDetailViewController.h"

@interface StatesTablleViewController ()
@property (nonatomic, strong)NSMutableArray* usStates;

@end

@implementation StatesTablleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    States *alabama = [[States alloc]init];
    alabama.name = @"Alabama";
    alabama.capital = @"Montgomery";
    alabama.motto = @"Audemus jura nostra defendere";
    alabama.flag = [UIImage imageNamed:@"Flags/alabama.png"];
    
    States *georgia = [[States alloc]init];
    georgia.name = @"Georgia";
    georgia.capital = @"Atlanta";
    georgia.motto = @"Wisdom, Justice, Moderation";
    georgia.flag = [UIImage imageNamed:@"Flags/georgia.png"];
    
    States *florida = [[States alloc]init];
    florida.name = @"Florida";
    florida.capital = @"Tallahassee";
    florida.motto = @"In God We Trust";
    florida.flag = [UIImage imageNamed:@"Flags/florida.png"];
    
    States *newyork = [[States alloc]init];
    newyork.name = @"New York";
    newyork.capital = @"Albany";
    newyork.motto = @"Exelcelsior";
    newyork.flag = [UIImage imageNamed:@"Flags/newyork.png"];
    
    States *Alaska = [[States alloc]init];
    Alaska.name = @"Alaska";
    Alaska.capital = @"Juneau";
    Alaska.motto = @"North to the Future";
    Alaska.flag = [UIImage imageNamed:@"Flags/alaska.gif"];
    
    States *massachusetts = [[States alloc]init];
    massachusetts.name = @"Massachusetts";
    massachusetts.capital = @"Boston";
    massachusetts.motto = @"Ense petit placidam sub libertate quietem";
    massachusetts.flag = [UIImage imageNamed:@"Flags/massachussett.png"];
    
    States *arizona = [[States alloc]init];
    arizona.name = @"Arizona";
    arizona.capital = @"Phoenix";
    arizona.motto = @"Ditat Deus";
    arizona.flag = [UIImage imageNamed:@"Flags/arizona.png"];
    
    
    
    
    
    
    
    // add the states to our array
    self.usStates = [NSMutableArray arrayWithObjects:alabama, georgia, florida, newyork, Alaska, massachusetts,arizona, nil];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.usStates count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"stateInfoCell";
    StateTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    // populate cells with data
    States *item = [self.usStates objectAtIndex:indexPath.row];
    cell.stateName.text = item.name;
    cell.stateMotto.text = item.motto;
    cell.flagImageView.image = item.flag;
    
    cell.stateName.font = [UIFont boldSystemFontOfSize:28];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier]isEqualToString:@"showDetail"]){
        StateDetailViewController *destinationViewController = [segue destinationViewController];
        
        // get the selection
        NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
        
        States* aState = [self.usStates objectAtIndex:myIndexPath.row];
        
        // Pass the selected object to the new view controller.
        destinationViewController.myState = aState;
    }
    
}


@end
