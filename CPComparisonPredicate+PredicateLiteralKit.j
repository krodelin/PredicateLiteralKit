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

    var modifier;

    switch (_modifier)
    {
        case CPDirectPredicateModifier: modifier = @"";
                                        break;
        case CPAllPredicateModifier:    modifier = @"ALL";
                                        break;
        case CPAnyPredicateModifier:    modifier = @"ANY";
                                        break;
        default:                        modifier = @"";
                                        break;
    }

    var options;

    switch (_options)
    {
        case CPCaseInsensitivePredicateOption:      options = @"c";
                                                    break;
        case CPDiacriticInsensitivePredicateOption: options = @"d";
                                                    break;
        case CPCaseInsensitivePredicateOption | CPDiacriticInsensitivePredicateOption:
                                                    options = @"cd";
                                                    break;
        default:                                    options = @"";
                                                    break;
    }

    var result =  @[
        @"cmp",
        operator,
        [_left predicateLiteral],
        [_right predicateLiteral],
    ];

    if ([options length] > 0 || [modifier length] > 0)
    {
        [result addObject:options];
        if ([modifier length] > 0)
        {
            [result addObject:modifier];
        }
    }

    return result;
}

@end
