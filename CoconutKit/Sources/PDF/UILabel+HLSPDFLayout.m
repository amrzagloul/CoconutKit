//
//  UILabel+HLSPDFLayout.m
//  CoconutKit-dev
//
//  Created by Samuel Défago on 15.09.11.
//  Copyright 2011 Hortis. All rights reserved.
//

#import "UILabel+HLSPDFLayout.h"

#import "HLSCategoryLinker.h"
#import "NSString+HLSExtensions.h"
#import "UIView+HLSPDFLayout.h"

HLSLinkCategory(UILabel_HLSPDFLayout)

@implementation UILabel (HLSPDFLayout)

- (void)drawElement
{    
    // Draw common view properties first
    [super drawElement];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    // TODO: Labels on several lines: Are not drawn currently yet
    
    // Label context properties    
    UIColor *textColor = self.textColor ? self.textColor : [UIColor blackColor];
    CGContextSetFillColorWithColor(context, textColor.CGColor);
    
    UIColor *shadowColor = self.shadowColor ? self.shadowColor : [UIColor clearColor];
    CGContextSetShadowWithColor(context, self.shadowOffset, 0.f, shadowColor.CGColor);
        
    // Draw the label
    CGFloat minFontSize = 0.f;
    if (self.adjustsFontSizeToFitWidth) {
        minFontSize = [self minimumFontSize];
    }
    else {
        minFontSize = self.font.pointSize;
    }
    
    [self.text drawInRect:self.frame 
                 withFont:self.font
              minFontSize:minFontSize 
           actualFontSize:NULL
            textAlignment:self.textAlignment 
            lineBreakMode:self.lineBreakMode 
       baselineAdjustment:self.baselineAdjustment];
        
    CGContextRestoreGState(context);
}

@end