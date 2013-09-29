@import <Foundation/Foundation.j>

@implementation _CPAggregateExpression (PredicateLiteralKit)

- (CPDictionary)predicateLiteral
{
    // _CPRaiseInvalidAbstractInvocation(self, _cmd);
    var collection = [[CPMutableArray alloc] init];

    [[self collection] enumerateObjectsUsingBlock:(function (object){ [collection addObject:[object predicateLiteral]]})];
    return @{@"type":@"aggregate", @"collection":collection};
}

@end
