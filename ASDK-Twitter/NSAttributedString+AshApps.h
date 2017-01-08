//
//  NSAttributedString+AshApps.h
//  AshApps
//
//  Created by Aaron Ash on 12/12/16.
//  Copyright © 2016 AshApps. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;


@interface NSAttributedString (AshApps)


+ (nullable NSAttributedString *)attributedStringWithString:(nullable NSString *)string font:(nullable UIFont*)font color:(nullable UIColor *)color firstWordColor:(nullable UIColor *)firstWordColor;

//+ (nullable NSAttributedString*)attributedStringWithString:(nullable NSString *)string fontSize:(CGFloat)size color:(nullable UIColor *)color firstWordColor:(nullable UIColor *)firstWordColor;

@end
