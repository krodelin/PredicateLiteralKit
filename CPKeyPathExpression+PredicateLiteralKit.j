@implementation _CPKeyPathExpression (PredicateLiteralKit)

- (CPDictionary)predicateLiteral
{
	return @["key", [self keyPath]];
}

@end
