@implementation CPDictionary (JSONDictionary)

- (JSObject)toJSObject
{
	// print([[self class] description] + " (" + [self description] + "): - (JSObject)toJSObject");
	var result = {};
	[self enumerateKeysAndObjectsUsingBlock: (function (key, object) { result[[key toJSObject]] = [object toJSObject]; })];
	return result;
}


+ (CPObject)fromJSObject:(JSObject)obj
{
        for (var i = 0; i < obj.length; i++) {
                obj[i] = [CPObject fromJSObject:obj[i]];
   }
   return obj;
}


@end
