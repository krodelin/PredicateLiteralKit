/*
 * CPCompoundPredicate+PredicateLiteralKit.j
 * PredicateLiteralKit
 *
 * Created by Udo Schneider on December 8, 2013.
 *
 * Copyright 2013, Krodelin Software Solutions. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 */

 @import <Foundation/Foundation.j>

@implementation CPCompoundPredicate (PredicateLiteralKit)

- (CPDictionary)predicateLiteral
{
    var result = @[@"cmd"],
        count = [_predicates count];

    if (count == 0)
        return [[[CPPredicate_BOOL alloc] initWithBool:YES] predicateLiteral];

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
