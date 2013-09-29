#!/usr/bin/env objj

@import "PredicateLiteralKit.j"
@import <JSLiteralKit/JSLiteralKit.j>


var pred_string;

// pred_string = @"array[FIRST ] = 3"
pred_string =  @"date > $YESTERDAY";
// pred_string = @"array[3+3] == 3";
// pred_string = "age > 2**8";
// pred_string = @"@sum.items.price < 1000";
// pred_string = @"age > %@";
// print("pred_string = " + pred_string);
pred_string = @"date > 3 || date < 4 && age >= 4 OR age <= 5 AND type == \"type\" and name LIKE \"Udo\" and not age != ((((3+4)*5-6)/7)**5) and size == array[SIZE]";

var pred = [CPPredicate predicateWithFormat:pred_string];
// print("[pred predicateFormat] = " + [pred predicateFormat]);
// print("[[pred predicateLiteral] description] = " + [[pred predicateLiteral] description]);

var string = [[pred predicateLiteral] toJSObject];
// print("[CPString JSONFromObject:string] = " + [CPString JSONFromObject:string]);
print([CPString JSONFromObject:string]);
