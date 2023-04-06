#import "NSMutableDictionary+Sentry.h"

@implementation
NSMutableDictionary (Sentry)

- (void)mergeEntriesFromDictionary:(NSDictionary *)otherDictionary
{
    [otherDictionary enumerateKeysAndObjectsUsingBlock:^(id otherKey, id otherObj, BOOL *stop) {
        if ([otherObj isKindOfClass:NSDictionary.class] &&
            [self[otherKey] isKindOfClass:NSDictionary.class]) {
            NSMutableDictionary *mergedDict = ((NSDictionary *)self[otherKey]).mutableCopy;
            [mergedDict mergeEntriesFromDictionary:(NSDictionary *)otherObj];
            self[otherKey] = mergedDict;
            return;
        }

        self[otherKey] = otherObj;
    }];
}

- (void)setBoolValue:(nullable NSNumber *)value forKey:(NSString *)key
{
    // why do we declare value to be nullable if we won't do anything here? should we remove that
    // value from the dictionary if it's nil?
    if (value != nil) {
        [self setValue:@([value boolValue]) forKey:key];
    }
}

@end
