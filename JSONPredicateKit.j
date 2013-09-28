/*
 * JSONPredicateKit.j
 * JSONPredicateKit
 *
 * Created by Udo Schneider on September 22, 2013.
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

/*
    USAGE

    Put an @import of every source file in your framework here. Users of the framework
    can then simply import this file instead of having to know what the individual
    source filenames are.
*/

@import <Foundation/Foundation.j>
@import "JSONPredicateKitClass.j"

@import "CPPredicate+JSONPredicate.j"
@import "CPPredicate_BOOL+JSONPredicate.j"
@import "CPComparisonPredicate+JSONPredicate.j"
@import "CPCompoundPredicate+JSONPredicate.j"

@import "CPExpression+JSONPredicate.j"
@import "CPKeyPathExpression+JSONPredicate.j"
@import "CPConstantValueExpression+JSONPredicate.j"
@import "CPAggregateExpression+JSONPredicate.j"
@import "CPSelfExpression+JSONPredicate.j"
@import "CPFunctionExpression+JSONPredicate.j"
@import "CPVariableExpression+JSONPredicate.j"

@import "CPObject+JSON.j"
@import "CPNumber+JSON.j"
@import "CPString+JSON.j"
@import "CPArray+JSON.j"
@import "CPDictionary+JSON.j"
