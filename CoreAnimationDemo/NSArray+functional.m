//
//  NSArray+functional.m
//  HighOrder
//
//  Created by fanke on 2018/5/2.
//  Copyright © 2018年 fanke. All rights reserved.
//

#import "NSArray+functional.h"
#import <objc/runtime.h>

@implementation NSArray (functional)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(objectAtIndex:);
        SEL swizzledSelector = @selector(safeObjectAtIndex:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL didAddMethod =
        class_addMethod(class,
                        originalSelector,
                        method_getImplementation(swizzledMethod),
                        method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(class,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

- (id)safeObjectAtIndex:(NSInteger)index {
    if (index >= self.count) {
        return nil;
    }
    return [self safeObjectAtIndex:index];
}

- (NSArray *)pdd_map:(TransformBlock)transfromBlock {
    if (transfromBlock == nil) {
        return nil;
    }
    
    NSMutableArray * mutableArray = [[NSMutableArray alloc] initWithCapacity:self.count];
    for (id obj in [self copy]) {
        id transfromResult = transfromBlock(obj);
        if (transfromResult) {
            [mutableArray addObject:transfromResult];
        }
    }
    
    return [mutableArray copy];
}

- (NSArray *)pdd_filter:(ValidBlock)validBlock {
    if (validBlock == nil) {
        return nil;
    }
    
    return [self objectsAtIndexes:[self indexesOfObjectsPassingTest:^BOOL(id  _Nonnull obj, NSUInteger idx, BOOL *stop) {
        return validBlock(obj);
    }]];
}

- (NSArray *)pdd_select:(ValidBlock)validBlock {
    if (validBlock == nil) {
        return nil;
    }
    
    return [self objectsAtIndexes:[self indexesOfObjectsPassingTest:^BOOL(id  _Nonnull obj, NSUInteger idx, BOOL *stop) {
        return validBlock(obj);
    }]];
}

- (NSArray *)pdd_reject:(ValidBlock)validBlock {
    if (validBlock == nil) {
        return nil;
    }
    
    return [self objectsAtIndexes:[self indexesOfObjectsPassingTest:^BOOL(id  _Nonnull obj, NSUInteger idx, BOOL *stop) {
        return !validBlock(obj);
    }]];
}

- (void)pdd_each:(TraverseBlock)traverseBlock {
    if (traverseBlock == nil) {
        return;
    }
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        traverseBlock(obj);
    }];
}

- (void)pdd_eachWithIndex:(TraverseIndexBlock)traverseIndexBlock {
    if (traverseIndexBlock == nil) {
        return;
    }
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        traverseIndexBlock(obj, idx);
    }];
}

- (id)pdd_find:(ValidBlock)validBlock {
    if (validBlock == nil) {
        return nil;
    }
    for (id obj in [self copy]) {
        if (validBlock(obj)) {
            return obj;
        }
    }
    return nil;
}

- (instancetype)pdd_take:(NSInteger)index {
    if (self.count <= index || index < 0) {
        return self;
    }
    return [self subarrayWithRange:NSMakeRange(0, index)];
}

- (NSArray *)pdd_ejectDuplicate:(CompareBlock)compareBlock {
    if (compareBlock == nil) {
        return nil;
    }
    if (self.count <= 1) {
        return self;
    }
    NSMutableArray * mutableArray = [NSMutableArray new];
    for (id obj in [self copy]) {
        BOOL contains = NO;
        for (id objStored in mutableArray) {
            if (compareBlock(obj, objStored)) {
                contains = YES;
                break;
            }
        }
        if (!contains) {
            [mutableArray addObject:obj];
        }
    }
    return [mutableArray copy];
}

- (NSArray *)pdd_spliceSubList:(TransformBlock)transformBlock {
    if (transformBlock == nil) {
        return nil;
    }
    NSArray * array = @[];
    for (id obj in [self copy]) {
        array = [array arrayByAddingObjectsFromArray:transformBlock(obj)];
    }
    return array;
}

+ (NSArray *)combineArrayList:(NSArray<NSArray *> *)arrayList {
    if (arrayList.count == 0) {
        return nil;
    }
    NSArray * totalArray = @[];
    for (NSArray *array in arrayList) {
        totalArray = [totalArray arrayByAddingObjectsFromArray:array];
    }
    return totalArray;
}

- (id)pdd_reduce:(id)initial withBlock:(ReduceBlock)block {
    id result = initial;
    for (id obj in self) {
        result = block(result, obj);
    }
    return result;
}

@end
