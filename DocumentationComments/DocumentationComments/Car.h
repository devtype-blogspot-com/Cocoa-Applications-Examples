//
//  Car.h
//  DocumentationComments
//
//  http://devtype.blogspot.com/2016/01/Kommentarii-dlya-dokumentirovaniya-koda-Objective-C.html
//  Copyright © 2016 DEVTYPE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject

/**
 @description Передвигает автомобиль.
 @available Версия 1.0 до 2.2
 */
- (void)moveAtLocation:(CGPoint)aLocation;

- (void)park;

/*!
 Ускорить движение.\n Новой строки не будет (команда не работает).
 
 \brief Всплывающая подсказка будет отображать только этот текст. 
 \example Пример использования тоже не работает.
 */
- (void)accelerateWithValue:(CGFloat)aValue;

@end
