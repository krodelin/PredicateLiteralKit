@implementation CPPredicate_BOOL (JSONPredicate)

- (CPDictionary)toPredicateLiterals
{
    return (_value) ? @{@"type":@"true"} : @{@"type":@"false"};
}

@end
