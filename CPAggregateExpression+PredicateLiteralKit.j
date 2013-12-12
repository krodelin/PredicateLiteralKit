@import <Foundation/Foundation.j>

@implementation _CPAggregateExpression (PredicateLiteralKit)

- (CPDictionary)predicateLiteral
{
    // _CPRaiseInvalidAbstractInvocation(self, _cmd);
    var result = @[@"agr"];

    [[self collection] enumerateObjectsUsingBlock:(function (object){ [result addObject:[object predicateLiteral]]})];

    return result;
}

@end
