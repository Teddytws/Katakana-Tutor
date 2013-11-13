//
//  SelectViewController.m
//  Tutor ver 1
//
//  Created by Teddy Stephenson on 10/16/13.
//  Copyright (c) 2013 Teddy Stephenson. All rights reserved.
//

#import "SelectViewController.h"
#import "CharacterLibrary.h"
#import "CharacterTVC.h"
#import "DrawViewController.h"

@interface SelectViewController ()

@property (nonatomic, strong) CharacterLibrary* characterList;

@end

@implementation SelectViewController


- (CharacterLibrary *) characterList {
    
    if (!_characterList) {
        _characterList = [[CharacterLibrary alloc]init];
    }
    return _characterList;
}


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [self.characterList numberOfCharacters];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"character";
    CharacterTVC *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    
    
    // Configure the cell...
    
    
    
    cell.characterName.text = [self.characterList nameForCharacters:indexPath.row];
    cell.characterKanji.text = [self.characterList kanjiForCharacters:indexPath.row];
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
   
    
    if ([segue.identifier isEqualToString:@"drawcharacter"]) {
        NSIndexPath * indexPath = [self.tableView indexPathForSelectedRow];
        
        
        DrawViewController* destViewController = segue.destinationViewController;
        
        
        destViewController.characterName = [self.characterList nameForCharacters:indexPath.row];
        
        
        destViewController.characterKanji = [self.characterList kanjiForCharacters:indexPath.row];
        destViewController.strokecount = [self.characterList strokesForCharacter:indexPath.row];
        
        destViewController.strokes = [self.characterList strokeArray:indexPath.row];
        

    }
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.

}



@end
