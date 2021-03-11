//
//  ViewController.h
//  listapp
//
//  Created by Jack Curtin on 3/8/21.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) IBOutlet UITableView *tableView;


@end

