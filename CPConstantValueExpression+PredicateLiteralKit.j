@implementation _CPConstantValueExpression (PredicateLiteralKit)

- (CPDictionary)predicateLiteral
{
    return @{@"type":@"constant", @"value":[self constantValue]}
}

@end
