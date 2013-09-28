@implementation _CPKeyPathExpression (JSONPredicate)

- (CPDictionary)toPredicateLiterals
{
    return @{@"type":@"keypath", @"keypath":[self keyPath]};
}

@end
