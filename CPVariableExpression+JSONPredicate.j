@implementation _CPVariableExpression (JSONPredicate)

- (CPDictionary)toPredicateLiterals
{
    return @{@"type":@"variable", @"variable":[[self variable] toPredicateLiterals]};
}

@end
