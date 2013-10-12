@import <Foundation/CPArray.j>

@implementation CPSortDescriptor (JSLiteralKit)

- (JSObject)toJSObject
{
	return @[ _key, _selector, _ascending];
}


@end
