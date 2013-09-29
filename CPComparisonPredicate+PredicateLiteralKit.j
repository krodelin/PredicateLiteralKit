@implementation CPComparisonPredicate (PredicateLiteralKit)
- (CPDictionary)predicateLiteral
{
    var modifier;

    switch (_modifier)
    {
        case CPDirectPredicateModifier: modifier = "";
                                        break;
        case CPAllPredicateModifier:    modifier = "ALL";
                                        break;
        case CPAnyPredicateModifier:    modifier = "ANY";
                                        break;

        default:                        modifier = "";
                                        break;
    }

    var options;

    switch (_options)
    {
        case CPCaseInsensitivePredicateOption:      options = @[@"c"];
                                                    break;
        case CPDiacriticInsensitivePredicateOption: options = @[@"d"];
                                                    break;
        case CPCaseInsensitivePredicateOption | CPDiacriticInsensitivePredicateOption:
                                                    options = @[@"c", @"d"];
                                                    break;

        default:                                    options = @[];
                                                    break;
    }

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

    // return [CPString stringWithFormat:@"%s%s %s%s %s",modifier,[_left description],operator,options,[_right description]];
    return @{
    	@"type":@"comparison",
        @"modifier":modifier,
        @"options":options,
    	@"operator":operator,
    	@"lhs":[_left predicateLiteral],
        @"rhs":[_right predicateLiteral]
    };
}

@end
