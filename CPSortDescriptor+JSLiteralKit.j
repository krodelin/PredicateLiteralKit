@import <Foundation/CPArray.j>

@implementation CPSortDescriptor (PredicateLiteralKit)

- (JSObject)sortDescriptorLiteral
{
	return @[ _key, _selector, _ascending];
}


@end
