//
//  LongPressGestureRecognizer.h
//  
//
//  Created by Saikiran Komirishetty on 22/10/16.
//  Copyright © 2016 Saikiran. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum : NSUInteger {
	SLOW,
	MEDIUM,
	FAST,
} SPEED;

@interface LongPressGestureRecognizer : UILongPressGestureRecognizer

- (instancetype)initWithTarget:(id)target action:(SEL)action targetButton:(UIButton *)button callBackMethodFrequency:(SPEED)speed;
@end
