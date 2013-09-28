@implementation CPArray (JSONArray)

- (JSObject)toJSObject
{
        //Iterate over all the items inside
        for (var i = 0; i < self.length; i++) {
                self[i] = [self[i] toJSObject];
        }
        return self;
}


+ (CPObject)fromJSObject:(JSObject)obj
{
        for (var i = 0; i < obj.length; i++) {
                obj[i] = [CPObject fromJSObject:obj[i]];
   }
   return obj;
}


@end
