@import <Foundation/Foundation.j>
@import "../PredicateLiteralKit.j"

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
@[
    false
];

    [self assert:expected equals: [fpred predicateLiteral]];
}

- (void)testKeyPathAndStringEquality
{
	var pred = [CPPredicate predicateWithFormat: @" name == \"Udo\""],
		expected =
@[
    @"cmp",
    @"==",
    @[
        @"key",
        @"name"
    ],
    @[
        @"con",
        @"Udo"
    ]
];

	[self assert:expected equals:[pred predicateLiteral]]
}

- (void)testKeyPathAndNumberGreaterThan
{
	var pred = [CPPredicate predicateWithFormat: @" grade >= 2"],
		expected =
@[
    @"cmp",
    @">=",
    @[
        @"key",
        @"grade"
    ],
    @[
        @"con",
        2
    ]
];

	[self assert:expected equals:[pred predicateLiteral]]
}

- (void)testCompoundPredicate
{
	var pred = [CPPredicate predicateWithFormat: @"(firstName like[cd] \"Mark\") OR (lastName like \"Adderley\")"],
		expected =
@[
    @"cmd",
    @"|",
    @[
        @"cmp",
        @"LIKE",
        @[
            @"key",
            @"firstName"
        ],
        @[
            @"con",
            @"Mark"
        ],
        @"cd"
    ],
    @[
        @"cmp",
        @"LIKE",
        @[
            @"key",
            @"lastName"
        ],
        @[
            @"con",
            @"Adderley"
        ]
    ]
];

	[self assert:expected equals:[pred predicateLiteral]];
}

- (void)testSelf
{
    var pred = [CPPredicate predicateWithFormat: @"yourself == SELF"],
        expected =
@[
    @"cmp",
    @"==",
    @[
        @"key",
        @"yourself"
    ],
    @[
        @"slf"
    ]
];

        [self assert:expected equals:[pred predicateLiteral]];
}

- (void)testFunctions
{
    var pred = [CPPredicate predicateWithFormat: @"name[6] = \"Udo\""],
        expected =
@[
    @"cmp",
    @"==",
    @[
        @"fn",
        @"fromObject:index:",
        @[
            @"key",
            @"name"
        ],
        @[
            @"con",
            6
        ]
    ],
    @[
        @"con",
        @"Udo"
    ]
];
        [self assert:expected equals:[pred predicateLiteral]];
}

- (void)testVariables
{
    var pred = [CPPredicate predicateWithFormat: @"date == $TODAY"],
        expected =
@[
    @"cmp",
    @"==",
    @[
        @"key",
        @"date"
    ],
    @[
        @"var",
        @"TODAY"
    ]
];
        [self assert:expected equals:[pred predicateLiteral]];
}

- (void)testModifierAndOptions
{
    var pred = [CPPredicate predicateWithFormat: @"( ANY lastName BEGINSWITH[cd] $letter)"],
        expected =
@[
    @"cmp",
    @"BEGINSWITH",
    @[
        @"key",
        @"lastName"
    ],
    @[
        @"var",
        @"letter"
    ],
    @"cd",
    @"ANY"
];
        [self assert:expected equals:[pred predicateLiteral]];
}


@end

