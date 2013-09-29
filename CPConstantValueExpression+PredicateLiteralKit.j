@implementation _CPConstantValueExpression (PredicateLiteralKit)

- (CPDictionary)predicateLiteral
{
	return @[@"con", [self constantValue]];
}

@end
