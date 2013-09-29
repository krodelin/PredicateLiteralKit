@import <Foundation/Foundation.j>

@implementation _CPVariableExpression (PredicateLiteralKit)

- (CPDictionary)predicateLiteral
{
	return @[@"var", [[self variable] keyPath]];
}

@end
