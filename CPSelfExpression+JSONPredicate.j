@implementation _CPSelfExpression (JSONPredicate)

- (CPDictionary)toPredicateLiterals
{
    return @{@"type":@"self"}
}

@end
