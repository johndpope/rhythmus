
#import <UIKit/UIKit.h>
#import "SERhythmusPattern.h"
#import "SESequencer.h"

@interface SERedactorVC : UIViewController

// Set Sequencer at first
@property (nonatomic, weak) SESequencer *sequencer;
// Set currentPattern after setting the Sequencer
@property (nonatomic, weak) SERhythmusPattern *currentPattern;


- (void)redrawEditor;

@end
