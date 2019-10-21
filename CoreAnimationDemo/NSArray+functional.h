//
//  NSArray+functional.h
//  HighOrder
//
//  Created by fanke on 2018/5/2.
//  Copyright © 2018年 fanke. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef id(^TransformBlock)(id obj);
typedef BOOL(^ValidBlock)(id obj);
typedef void(^TraverseBlock)(id obj);
typedef void(^TraverseIndexBlock)(id obj, NSInteger index);
typedef BOOL(^CompareBlock)(id one, id two);

typedef id(^ReduceBlock)(id one, id two);

typedef id(^TransformBlock)(id obj);

@interface NSArray (functional)

- (NSArray *)pdd_map:(TransformBlock)transfromBlock;

- (NSArray *)pdd_filter:(ValidBlock)validBlock;

- (NSArray *)pdd_select:(ValidBlock)validBlock;

- (NSArray *)pdd_reject:(ValidBlock)validBlock;

- (void)pdd_each:(TraverseBlock)traverseBlock;

- (void)pdd_eachWithIndex:(TraverseIndexBlock)traverseIndexBlock;

- (id)pdd_find:(ValidBlock)validBlock;

- (instancetype)pdd_take:(NSInteger)index;

- (NSArray *)pdd_ejectDuplicate:(CompareBlock)compareBlock;


- (NSArray *)pdd_spliceSubList:(TransformBlock)transformBlock;

+ (NSArray *)combineArrayList:(NSArray<NSArray *> *)arrayList;

- (id)pdd_reduce:(id)initial withBlock:(ReduceBlock)block;
@end
