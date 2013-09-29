@import <Foundation/Foundation.j>
@import "../JSONPredicateKit.j"

@implementation JSONPredicateTest : OJTestCase

- (void)testTRUEPREDICATE
{
    var tpred = [CPPredicate predicateWithFormat:@"TRUEPREDICATE"],
    	expected =
@{
    @"type": @"true"
};
    [self assert:expected equals:[tpred predicateLiteral]];
}

- (void)testTRUEPREDICATE
{
    var fpred = [CPPredicate predicateWithFormat:@"FALSEPREDICATE"],
    	expected =
@{
    @"type": @"false"
};

    [self assert:expected equals: [fpred predicateLiteral]];
}

- (void)testKeyPathAndStringEquality
{
	var pred = [CPPredicate predicateWithFormat: @" name == \"Udo\""],
		expected =
@{
    @"lhs": @{
        @"keypath": @"name",
        @"type": @"keypath"
    },
    @"modifier": @"",
    @"operator": @"==",
    @"options": @[],
    @"rhs": @{
        @"type": @"constant",
        @"value": @"Udo"
    },
    @"type": @"comparison"
};

	[self assert:expected equals:[pred predicateLiteral]]
}

- (void)testKeyPathAndNumberGreaterThan
{
	var pred = [CPPredicate predicateWithFormat: @" grade >= 2"],
		expected =
@{
    @"lhs": @{
        @"keypath": @"grade",
        @"type": @"keypath"
    },
    @"modifier": @"",
    @"operator": @">=",
    @"options": @[],
    @"rhs": @{
        @"type": @"constant",
        @"value": 2
    },
    @"type": @"comparison"
};

	[self assert:expected equals:[pred predicateLiteral]]
}

- (void)testCompoundPredicate
{
	var pred = [CPPredicate predicateWithFormat: @"(firstName like[cd] \"Mark\") OR (lastName like \"Adderley\")"],
		expected =
@{
    @"operator": @"OR",
    @"subpredicates": @[
        @{
            @"lhs": @{
                @"keypath": @"firstName",
                @"type": @"keypath"
            },
            @"modifier": @"",
            @"operator": @"LIKE",
            @"options": @[@"c", @"d"],
            @"rhs": @{
                @"type": @"constant",
                @"value": @"Mark"
            },
            @"type": @"comparison"
        },
        @{
            @"lhs": @{
                @"keypath": @"lastName",
                @"type": @"keypath"
            },
            @"modifier": @"",
            @"operator": @"LIKE",
            @"options": @[],
            @"rhs": @{
                @"type": @"constant",
                @"value": @"Adderley"
            },
            @"type": @"comparison"
        }
    ],
    @"type": @"compound"
};

	[self assert:expected equals:[pred predicateLiteral]];
}

- (void)testSelf
{
    var pred = [CPPredicate predicateWithFormat: @"yourself == SELF"],
        expected =
@{
    @"lhs": @{
        @"keypath": @"yourself",
        @"type": @"keypath"
    },
    @"modifier": @"",
    @"operator": @"==",
    @"options": @[],
    @"rhs": @{
        @"type": @"self"
    },
    @"type": @"comparison"
};

        [self assert:expected equals:[pred predicateLiteral]];
}

- (void)testFunctions
{
    var pred = [CPPredicate predicateWithFormat: @"name[6] = \"Udo\""],
        expected =
@{
    @"lhs": @{
        @"arguments": @[
            @{
                @"keypath": @"name",
                @"type": @"keypath"
            },
            @{
                @"type": @"constant",
                @"value": 6
            }
        ],
        @"function": @"fromObject:index:",
        @"type": @"function"
    },
    @"modifier": @"",
    @"operator": @"==",
    @"options": @[],
    @"rhs": @{
        @"type": @"constant",
        @"value": @"Udo"
    },
    @"type": @"comparison"
};
        [self assert:expected equals:[pred predicateLiteral]];
}

@end

