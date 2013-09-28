@implementation _CPConstantValueExpression (JSONPredicate)

- (CPDictionary)toPredicateLiterals
{
    return @{@"type":@"constant", @"value":[self constantValue]}
}

@end
