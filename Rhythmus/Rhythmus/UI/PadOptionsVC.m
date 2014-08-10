
#import "PadOptionsVC.h"
#import "UIColor+iOS7Colors.h"


#pragma mark PadOptionsVC Extension

@interface PadOptionsVC ()

@property (nonatomic, strong) IBOutlet UITableView *colorTableView;
@property (nonatomic, strong) IBOutlet NSLayoutConstraint *heightConstraint;

- (IBAction)processCancel:(UIButton *)sender;

@end


#pragma mark PadOptionsVC Implementation

@implementation PadOptionsVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)processCancel:(UIButton *)sender
{
    [self.delegate optionsControllerDidCanceled:self];
}

- (void)layoutSubviews {
  [UIView animateWithDuration:0.5 animations:^{
      self.heightConstraint.constant = 150;
      [self.colorTableView setNeedsLayout];
      [self.colorTableView layoutIfNeeded];
  }];
//  self.heightConstraint.constant = self.colorTableView.contentSize.height;
}

- (void)unlayoutSubviews {
  self.heightConstraint.constant = 420;
  [self.colorTableView setNeedsLayout];
  [self.colorTableView layoutIfNeeded];
//  self.heightConstraint.constant = self.colorTableView.contentSize.height;
}


#pragma mark UITableViewDataSource Protocol methods

- (UITableViewCell *)tableView:(UITableView *)tableView
    cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
#define REUSABLE_CELL_ID @"ReusableCellID"

    UITableViewCell *tableViewCell =
        [tableView dequeueReusableCellWithIdentifier:REUSABLE_CELL_ID];
    if (!tableViewCell) {
        tableViewCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
                                               reuseIdentifier:REUSABLE_CELL_ID];
    }
    tableViewCell.textLabel.text = @"";
           // Prapare message for UIColor class
    NSString *message = [UIColor sharedColorNames][indexPath.row];
    SEL s = NSSelectorFromString(message);
    // Send message to UIColor
    tableViewCell.backgroundColor = objc_msgSend([UIColor class], s);
    if (tableViewCell.backgroundColor == self.pad.backgroundColor) {
        tableViewCell.textLabel.text = @"Selected";
    }
    return tableViewCell;

#undef REUSABLE_CELL_ID
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[UIColor sharedColorNames]count];
}

#pragma mark UITableViewDelegate Protocol methods

- (void)tableView:(UITableView *)tableView
    didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Text is: %@",[tableView cellForRowAtIndexPath:indexPath].textLabel.text);
    if ([[tableView cellForRowAtIndexPath:indexPath].textLabel.text isEqualToString:@"Selected"]) {
        [self unlayoutSubviews];
    }
    [tableView cellForRowAtIndexPath:indexPath].textLabel.text = @"Selected";
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.pad.backgroundColor = [tableView cellForRowAtIndexPath:indexPath].backgroundColor;
    [self layoutSubviews];
}



@end