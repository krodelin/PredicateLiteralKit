@implementation CPPredicate_BOOL (PredicateLiteralKit)

- (CPDictionary)predicateLiteral
{
    return (_value) ? @[true] : @[false];
}

@end
