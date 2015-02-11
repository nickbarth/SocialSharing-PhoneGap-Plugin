#import <UIKit/UIKit.h>

@protocol InstagramActivityDelegate <NSObject>
-(void)ActivityPerform;
@end

@interface InstagramActivity : UIActivity
 @property(nonatomic,strong)id <InstagramActivityDelegate>delegate;
@end
