#import <UIKit/UIKit.h>

@interface InstagramActivity : UIActivity
@property (nonatomic, copy) NSString *message;
@property (nonatomic, copy) NSURL *url;
@property (nonatomic, copy) UIImage *image;
@property (nonatomic, copy) NSArray *activityItems;
@end
