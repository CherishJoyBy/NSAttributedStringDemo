//
//  BYTextField.m
//  NSAttributedString和NSMutableAttributedString
//
//  Created by lby on 2017/4/27.
//  Copyright © 2017年 lby. All rights reserved.
//

#import "BYTextField.h"
#import <objc/runtime.h>

@implementation BYTextField

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    // 写法1.
//        NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
//        attributes[NSForegroundColorAttributeName] = [UIColor yellowColor];
//        attributes[NSBackgroundColorAttributeName] = [UIColor redColor];
//    attributes[NSUnderlineStyleAttributeName] = @YES;
//    self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:attributes];
    
    // 写法2.
//    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:self.placeholder];
//    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
//    attributes[NSForegroundColorAttributeName] = [UIColor yellowColor];
//    attributes[NSBackgroundColorAttributeName] = [UIColor redColor];
//    attributes[NSUnderlineStyleAttributeName] = @YES;
//    [string setAttributes:attributes range:NSMakeRange(0, 4)];
//    self.attributedPlaceholder = string;

    // 写法3.
//        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:self.placeholder];
//        [string addAttribute:NSForegroundColorAttributeName value:[UIColor yellowColor] range:NSMakeRange(0, 4)];
//        [string addAttribute:NSBackgroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 4)];
//        [string addAttribute:NSUnderlineStyleAttributeName value:@YES range:NSMakeRange(0, 4)];
//        self.attributedPlaceholder = string;
    
    // 写法5.
    static NSString * const kPlaceholderColorKey = @"placeholderLabel.textColor";
    static NSString * const kPlaceholderBGColorKey = @"placeholderLabel.backgroundColor";
    static NSString * const kPlaceholderUnderLineKey = @"placeholderLabel.attributedText";
    [self setValue:[UIColor yellowColor] forKeyPath:kPlaceholderColorKey];
    [self setValue:[UIColor redColor] forKeyPath:kPlaceholderBGColorKey];
    
    // 下划线单独设置
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    attributes[NSBackgroundColorAttributeName] = [UIColor redColor];
    NSAttributedString *attributeText = [[NSAttributedString alloc] initWithString:@"o惜乐o" attributes:attributes];
    [self setValue:attributeText forKeyPath:kPlaceholderUnderLineKey];
    
    // 获取UITextField的成员变量或属性
    unsigned int count;
    Ivar *ivarList = class_copyIvarList([UITextField class], &count);
    for (int i = 0; i < count; i++)
    {
        Ivar ivar = ivarList[i];
        NSString *str = [NSString stringWithUTF8String:ivar_getName(ivar)];
        NSLog(@"%@", str);
    }
    free(ivarList);

}
//- (void)drawPlaceholderInRect:(CGRect)rect
//{
//    // 写法4.
//    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
//    attributes[NSForegroundColorAttributeName] = [UIColor whiteColor];
//    attributes[NSBackgroundColorAttributeName] = [UIColor redColor];
//    attributes[NSFontAttributeName] = self.font;
//    attributes[NSUnderlineStyleAttributeName] = @YES;
//    CGPoint placeholderPoint = CGPointMake(0, (rect.size.height - self.font.lineHeight) * 0.5);
//    [self.placeholder drawAtPoint:placeholderPoint withAttributes:attributes];
//}


@end
