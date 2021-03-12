//
//  ViewController.m
//  listapp
//
//  Created by Jack Curtin on 3/8/21.
//

#import "ViewController.h"


@interface ViewController () <UITableViewDataSource, UITableViewDelegate>{
    NSMutableArray *grocArray;
}

@end

@implementation ViewController
@synthesize tableView;

@synthesize arrayOfData;

@synthesize addItemButton;





- (void)viewDidLoad {
    [super viewDidLoad];
    [tableView setDataSource:self];
    [tableView setDelegate:self];
    [self arrayOfData];
    
    
    // Do any additional setup after loading the view.
}

- (NSMutableArray *) arrayOfData
{
    if (!arrayOfData) {
        arrayOfData = [NSMutableArray arrayWithObjects: @"Milk", @"Eggs", @"Waffles", @"Cheesecake", nil];
    }
    return arrayOfData;
}

- (IBAction)addItemFunc:(id)sender
{
    NSArray *strings = @[@"Butter", @"Flour", @"Juice",@"Crown Roast", @"Little cakes, like super small", @"Ice",@"Cheese", @"Candy", @"Salmon",@"A new car", @"Egg Noodles", @"Other items"];
    NSString *randomString = strings[arc4random_uniform(strings.count)];
    [arrayOfData addObject:randomString];
    [tableView reloadData];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    NSLog(@"Num Groc %ld", arrayOfData.count);
    return arrayOfData.count;
}
// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(!cell){
        cell = [[UITableViewCell alloc] init];
    }
    [[cell textLabel] setText: arrayOfData[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"Select row %d", (int) [indexPath row]);
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle == UITableViewCellEditingStyleDelete){
        [arrayOfData removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert){
        NSLog(@"UITableViewCellEditingStyleInsert");
    }
}
 



@end
