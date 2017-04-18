//
//  LongPressGestureRecognizer.m
//  
//
//  Created by Saikiran Komirishetty on 22/10/16.
//  Copyright © 2016 Saikiran. All rights reserved.
//

#import "LongPressGestureRecognizer.h"
@interface LongPressGestureRecognizer()
@property (nonatomic,strong) NSTimer *timer;
@property (nonatomic,assign) SEL actionTobePerformed;
@property (nonatomic,assign) id targetObject;
@property (nonatomic,weak) UIButton *targetButton;
@property (nonatomic,assign) BOOL stopTimer;;
@property (nonatomic,assign) BOOL didTouchBegan;;
@property (nonatomic,strong) NSTimer *longPressTimer;
@property (nonatomic,assign) SPEED longTapIncreaseSpeed;


@end

@implementation LongPressGestureRecognizer

- (instancetype)initWithTarget:(id)target action:(SEL)action targetButton:(UIButton *)button callBackMethodFrequency:(SPEED)speed
{
	self = [super initWithTarget:target action:action];
	if (self) {
		// Use default value for allowableMovement before touches begin
		self.actionTobePerformed = action;
		self.targetObject = target;
		self.targetButton = button;
        self.longTapIncreaseSpeed = speed;
	}
	return self;
}

-(void)performLongpress{
	if (self.stopTimer == false) {
		[self.timer invalidate];
		float speed = 0;
		
		if (self.longTapIncreaseSpeed == FAST ) {
			speed = 0.0005;
		}
		else if (self.longTapIncreaseSpeed == MEDIUM ) {
			speed = 0.02;
		}
		else {
			speed = 0.05;
		}

		self.timer = [NSTimer scheduledTimerWithTimeInterval:speed target:self.targetObject selector:self.actionTobePerformed userInfo:nil repeats:TRUE];
		
	}

}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	[self.longPressTimer invalidate];
	self.longPressTimer = nil;
	NSLog(@"touches began");

	if (self.didTouchBegan) {
		return;
	}
	
	self.didTouchBegan = true;
	
	NSLog(@"long state %d", self.state);
	self.stopTimer = false;
	if (self.state == UIGestureRecognizerStateBegan ||
		self.state == UIGestureRecognizerStatePossible) {
		if (self.targetButton) {
			[self.targetButton setHighlighted:true];
		}
		[self.targetObject performSelector:self.actionTobePerformed withObject:nil];
		if (self.longPressTimer == nil) {
			
			self.longPressTimer = [NSTimer scheduledTimerWithTimeInterval:0.8 target:self selector:@selector(performLongpress) userInfo:nil repeats:false];
		}
		
	}
	
}
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
	self.stopTimer = true;
	[self.timer invalidate];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

	self.stopTimer = true;
	[self.timer invalidate];
	self.timer = nil;
	self.didTouchBegan = false;

	if (self.targetButton) {
		[self.targetButton setHighlighted:false];
	}
	
	NSLog(@"touches ended");


}

@end
