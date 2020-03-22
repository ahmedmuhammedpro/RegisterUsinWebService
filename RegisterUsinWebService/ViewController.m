#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
    NSMutableData *myData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    myData = [NSMutableData new];
}


- (IBAction)register:(UIButton *)sender {
    NSString *str = @"http://jets.iti.gov.eg/FriendsApp/services/user/register?";
    str = [str stringByAppendingString: @"name="];
    str = [str stringByAppendingString: _nameTF.text];
    str = [str stringByAppendingString: @"&phone="];
    str = [str stringByAppendingString: _phoneTF.text];
    
    NSURL *url = [NSURL URLWithString: str];
    NSURLRequest *requst = [NSURLRequest requestWithURL: url];
    NSURLConnection *con = [[NSURLConnection alloc] initWithRequest: requst delegate: self];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [myData appendData: data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData: myData options: nil error: nil];
    NSString *status = [dic objectForKey: @"status"];
    
    if ([status isEqualToString: @"SUCCESS"]) {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle: @"Registration" message: @"Registered successfuly" delegate:self cancelButtonTitle: nil otherButtonTitles: @"OK", nil];
        [alertView show];
        
    } else {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle: @"Registration" message: @"This Phone is already Registered." delegate:self cancelButtonTitle: nil otherButtonTitles: @"OK", @"RETRY", nil];
        [alertView show];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        _nameTF.text = @"";
        _phoneTF.text = @"";
    }
}

@end
