@implementation CPPredicate_BOOL (PredicateLiteralKit)

- (CPDictionary)predicateLiteral
{
    return (_value) ? @{@"type":@"true"} : @{@"type":@"false"};
}

@end
