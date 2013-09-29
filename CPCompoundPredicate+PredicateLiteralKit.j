@implementation CPCompoundPredicate (PredicateLiteralKit)

- (CPDictionary)predicateLiteral
{
    var result = @[@"cmd"],
        count = [_predicates count];

    if (count == 0)
        return @{@"type":@"TRUEPREDICATE"};

    switch (_type)
    {
        case CPNotPredicateType:    [result addObject: @"!"];
        							[result addObject:[[_predicates objectAtIndex:0] predicateLiteral]];
                                    break;

        case CPAndPredicateType:    [result addObject: @"&"];
                                    for (var j = 0; j < count; j++)
                                        [result addObject:[[_predicates objectAtIndex:j] predicateLiteral]];
                                    break;

        case CPOrPredicateType:     [result addObject: @"|"];
                                    for (var j = 0; j < count; j++)
                                        [result addObject:[[_predicates objectAtIndex:j] predicateLiteral]];
                                    break;
    }

    return result;
}

@end
