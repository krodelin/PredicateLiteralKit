@implementation CPComparisonPredicate (PredicateLiteralKit)
- (CPDictionary)predicateLiteral
{

    var operator;

    switch (_type)
    {
        case CPLessThanPredicateOperatorType:               operator = "<";
                                                            break;
        case CPLessThanOrEqualToPredicateOperatorType:      operator = "<=";
                                                            break;
        case CPGreaterThanPredicateOperatorType:            operator = ">";
                                                            break;
        case CPGreaterThanOrEqualToPredicateOperatorType:   operator = ">=";
                                                            break;
        case CPEqualToPredicateOperatorType:                operator = "==";
                                                            break;
        case CPNotEqualToPredicateOperatorType:             operator = "!=";
                                                            break;
        case CPMatchesPredicateOperatorType:                operator = "MATCHES";
                                                            break;
        case CPLikePredicateOperatorType:                   operator = "LIKE";
                                                            break;
        case CPBeginsWithPredicateOperatorType:             operator = "BEGINSWITH";
                                                            break;
        case CPEndsWithPredicateOperatorType:               operator = "ENDSWITH";
                                                            break;
        case CPInPredicateOperatorType:                     operator = "IN";
                                                            break;
        case CPContainsPredicateOperatorType:               operator = "CONTAINS";
                                                            break;
        case CPCustomSelectorPredicateOperatorType:         operator = CPStringFromSelector(_customSelector);
                                                            break;
    }

    var result =  @{
        @"type":@"comparison",
        @"operator":operator,
        @"lhs":[_left predicateLiteral],
        @"rhs":[_right predicateLiteral]
    };

    switch (_modifier)
    {
        case CPDirectPredicateModifier: break;
        case CPAllPredicateModifier:    [result setObject:@"ALL" forKey:@"modifier"];
                                        break;
        case CPAnyPredicateModifier:    [result setObject:@"ANY" forKey:@"modifier"];
                                        break;
        default:                        break;
    }

    switch (_options)
    {
        case CPCaseInsensitivePredicateOption:      [result setObject:@[@"c"] forKey:@"options"];
                                                    break;
        case CPDiacriticInsensitivePredicateOption: [result setObject:@[@"d"] forKey:@"options"];
                                                    break;
        case CPCaseInsensitivePredicateOption | CPDiacriticInsensitivePredicateOption:
                                                    [result setObject:@[@"c", @"d"] forKey:@"options"];
                                                    break;
        default:                                    break;
    }

    return result;
}

@end
