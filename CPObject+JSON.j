@implementation CPObject (JSONObject)

- (JSObject)toJSObject
{
        var result = {};
    result["__clazz"] = [[self class] className]; //store the Objective-J class name so we can deserialize later
    for (var name in self) {
                // filters out Objective-J properties, and properties defined on the prototype
        if (self.hasOwnProperty(name) && name !== "isa" && name !== "__address" && name != "_UID") {
                        if (self[name] && self[name].isa) {
                                result[name] = [self[name] toJSObject]; // if the object is an Objective-J object, recurse.
                       //Check if a standard JS object as it can then have object pointers and we need to convert
                        } else if (self[name] != null && typeof(self[name]) == 'object') {
                                var obj = self[name];
                                for (var prop in obj) {
                                        //If the object is a Objective J object call toJSObject
                                        if (obj[prop] != null && obj[prop].isa) {
                                                obj[prop] = [obj[prop] toJSObject]
                                        } else {
                                                console.log("jsobject prop: " + prop)
                                                obj[prop] = obj[prop]
                                        }
                                }
                                result[name] = obj;
                        } else {
                                result[name] = self[name]; // otherwise do a shallowcopy
                        }
        }
    }
    return result;
}


+ (CPObject)fromJSObject:(JSObject)obj
{
        // not anObjective-J object (or toll free bridged), just return itself
    if (!obj) {
                return obj;
        } else if (obj["__clazz"] === undefined) {
                //Need to loop if there are sub objects that are CPObjects
                for (var prop in obj) {
                        //this is an object that we want to decode
                        if (obj[prop].hasOwnProperty("__clazz")) {
                                obj[prop] =  [CPObject fromJSObject:obj[prop]];
                        }
                }
                return obj;
        }

    var className = obj["__clazz"]; // get the class name
    var classObject = objj_lookUpClass(className); // lookup the class object by name
    return [[classObject alloc] initWithJSObject:obj]; // alloc anew instance, initialize it using obj
}

- (CPObject)initWithJSObject:(JSObject)obj
{
    for (var name in obj) {
                   if (name !== "__className") {
                        if (obj[name] instanceof Array) {
                                self[name] = [CPArray fromJSObject:obj[name]]; //Call special if array to make sure to convert all objects
                        } else {
                                self[name] = [CPObject fromJSObject:obj[name]]; // recursively copy the properties in
                        }
                }
        }
    return self;
}


@end
