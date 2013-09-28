@implementation _CPFunctionExpression (JSONPredicate)

- (CPDictionary)toPredicateLiterals
{
	// print("_operand = " + _operand);
    // print("_selector = " + _selector);
    // print("_arguments = " + [self arguments]);
    // print("_argc = " + _argc);
    // print("_maxargs = " + _maxargs);
    // _CPRaiseInvalidAbstractInvocation(self, _cmd);
    var args = [[CPMutableArray alloc] init];

    [[self arguments] enumerateObjectsUsingBlock:(function (object){ [args addObject:[object toPredicateLiterals]]; })];

    return @{@"type":@"function", @"function":[self function], @"arguments":args};
}

@end
