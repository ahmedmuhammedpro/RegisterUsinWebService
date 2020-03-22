#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIAlertViewDelegate, NSURLConnectionDelegate, NSURLConnectionDataDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *phoneTF;

- (IBAction)register:(UIButton *)sender;

@end

