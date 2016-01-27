//
//  SoccerPlayer.h
//  DocumentationComments
//
//  http://devtype.blogspot.com/2016/01/Kommentarii-dlya-dokumentirovaniya-koda-Objective-C.html
//  Copyright © 2016 DEVTYPE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SoccerPlayer : NSObject

/*!
 * Пнуть мяч.
 * \param aBall Мяч, который надо пнуть
 * \returns Место куда упал мяч.
 */
- (CGPoint)kickBall:(id)aBall;

@end
