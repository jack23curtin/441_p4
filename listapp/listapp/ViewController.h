//
//  ViewController.h
//  listapp
//
//  Created by Jack Curtin on 3/8/21.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *arrayOfData;

@property (nonatomic, strong) IBOutlet UIButton *addItemButton;








@end

