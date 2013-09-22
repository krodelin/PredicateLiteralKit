@implementation CPPredicate (JSONPredicate)

- (CPString)predicateJSON
{
    return @{};
}

@end

@implementation CPPredicate_BOOL (JSONPredicate)

- (CPString)predicateJSON
{
    return (_value) ? @{@"type":@"TRUEPREDICATE"} : @{@"type":@"FALSEPREDICATE"};
}

@end
