@import <Foundation/Foundation.j>
@import "../JSONPredicateKit.j"

@implementation JSONPredicateTest : OJTestCase

- (void)testTRUEPREDICATE
{
    var tpred = [CPPredicate predicateWithFormat:@"TRUEPREDICATE"];

    [self assert:[tpred predicateJSON] equals:@{@"type":@"TRUEPREDICATE"}];
}

- (void)testTRUEPREDICATE
{
    var fpred = [CPPredicate predicateWithFormat:@"FALSEPREDICATE"];

    [self assert:[fpred predicateJSON] equals:@{@"type":@"FALSEPREDICATE"}];
}

@end
