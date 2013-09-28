@implementation _CPAggregateExpression (JSONPredicate)

- (CPDictionary)toPredicateLiterals
{
    // _CPRaiseInvalidAbstractInvocation(self, _cmd);
    var collection = [[CPMutableArray alloc] init];

    [[self collection] enumerateObjectsUsingBlock:(function (object){ [collection addObject:[object toPredicateLiterals]]})];
    return @{@"type":@"aggregate", @"collection":collection};
}

@end
