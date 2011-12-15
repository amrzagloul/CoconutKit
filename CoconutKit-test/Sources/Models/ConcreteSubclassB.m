#import "ConcreteSubclassB.h"

#import "TestErrors.h"

@implementation ConcreteSubclassB

// codeMandatoryStringB: Validation entirely defined in code
- (BOOL)checkCodeMandatoryStringB:(NSString *)codeMandatoryStringB error:(NSError **)pError
{
    if (! codeMandatoryStringB) {
        *pError = [HLSError errorWithDomain:@"ch.hortis.CoconutKit-test"
                                       code:TestValidationMandatoryValueError];
        return NO;
    }
    
    return YES;
}

// modelMandatoryCodeNotEmptyStringB: Validation defined in the xcdatamodel and in the code
- (BOOL)checkModelMandatoryCodeNotEmptyStringB:(NSString *)modelMandatoryCodeNotEmptyStringB error:(NSError **)pError
{
    if (! [modelMandatoryCodeNotEmptyStringB isFilled]) {
        *pError = [HLSError errorWithDomain:@"ch.hortis.CoconutKit-test"
                                       code:TestValidationIncorrectValueError];
        return NO;
    }
    
    return YES;
}

// modelMandatoryStringB: Validation entierly in the xcdatamodel

// noValidationStringB: No validation constraints, neither in the code, nor in the xcdatamodel

@end
