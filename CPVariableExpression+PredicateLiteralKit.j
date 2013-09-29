@import <Foundation/Foundation.j>

@implementation _CPVariableExpression (PredicateLiteralKit)

- (CPDictionary)predicateLiteral
{
    return @{@"type":@"variable", @"variable":[[self variable] keyPath]};
}

@end
