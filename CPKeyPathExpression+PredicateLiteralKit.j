@implementation _CPKeyPathExpression (PredicateLiteralKit)

- (CPDictionary)predicateLiteral
{
    return @{@"type":@"keypath", @"keypath":[self keyPath]};
}

@end
