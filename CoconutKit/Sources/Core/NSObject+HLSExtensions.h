//
//  NSObject+HLSExtensions.h
//  CoconutKit
//
//  Created by Samuel Défago on 2/11/11.
//  Copyright 2011 Hortis. All rights reserved.
//

@interface NSObject (HLSExtensions)

/**
 * Returns the name of a class as a string
 */
+ (NSString *)className;

/**
 * Returns the name of an object's class as a string
 */
- (NSString *)className;

/**
 * Returns YES iff the object class implements all methods of a given protocol
 */
- (BOOL)implementsProtocol:(Protocol *)protocol;

@end
