//
//  FFBadgedBarButtonItem.m
//  FilterFresh
//
//  Created by Mark Granoff on 2/22/14.
//  Copyright (c) 2014 Hawk iMedia. All rights reserved.
//

#import "FFBadgedBarButtonItem.h"

@interface FFBadgedBarButtonItem()
@property (nonatomic, strong) UIView *buttonView;
@property (nonatomic, strong) UILabel *badgeLabel;
@end

@implementation FFBadgedBarButtonItem

-(id)initWithImage:(UIImage *)image target:(id)target action:(SEL)action
{
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(0, 7, image.size.width, image.size.height);
    
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, image.size.width+7, image.size.height+7)];
    [v addSubview:imageView];

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(v.frame.size.width - 14, 0, 14, 14)];
    label.backgroundColor = [UIColor redColor];
    label.layer.cornerRadius = 7;
    label.layer.masksToBounds = YES;
    label.userInteractionEnabled = NO;
    label.font = [UIFont fontWithName:@"HelveticaNeue" size:10];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"";
    label.hidden = YES;
        
    [v addSubview:label];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    tap.numberOfTapsRequired = 1;
    [v addGestureRecognizer:tap];
    
    self = [super initWithCustomView:v];
    if (self) {
        self.buttonView = v;
        self.badgeLabel = label;
    }
    
    return self;
}

-(NSString *)badge
{
    if (_badgeLabel.hidden)
        return nil;
    
    return _badgeLabel.text;
}

-(void)setBadge:(NSString *)badge
{
    if (!badge || badge.length < 1) {
        _badgeLabel.hidden = YES;
    } else {
        _badgeLabel.text = badge;
        CGSize newSize = [_badgeLabel sizeThatFits:CGSizeMake(_buttonView.frame.size.width, 14)];
        CGRect frame = _badgeLabel.frame;
        frame.origin.x = MIN(_buttonView.frame.size.width - 14, MAX(0, _buttonView.frame.size.width - newSize.width));
        frame.size.width = MAX(14,newSize.width);
        _badgeLabel.frame = frame;
        _badgeLabel.hidden = NO;
        [_buttonView setNeedsDisplay];
    }
}

@end
