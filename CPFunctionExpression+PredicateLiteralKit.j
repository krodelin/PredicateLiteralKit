@implementation _CPFunctionExpression (PredicateLiteralKit)

- (CPDictionary)predicateLiteral
{

	var result = @[@"fn", [self function]];

    [[self arguments] enumerateObjectsUsingBlock:(function (object){ [result addObject:[object predicateLiteral]]; })];

    return result;
}

@end
