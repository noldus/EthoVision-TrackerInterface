//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Test Contracts
// File       :   TestContractVersioning.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 16-12-2015 Tijmen van Voorthuijsen - Original version
//----------------------------------------------------------------------------
include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "..\\..\\Common\\Entities\\Header.thrift"

namespace * Noldus.NLinx.Contracts.Test

// Use these settings when creating the caller and receiver channels
const string    exchange             = "Noldus.NLinx.Library.Test"

// Just some dummie defaults for testing
const i32       defaultIntValueV1    = 7
const i32       defaultIntValueV2    = 8
const double    defaultDoubleValueV2 = 8.945
const string    defaultStringValueV2 = "Default V2 string value"


enum EnumV1
{
    FIRST = 0,
    RENAME_OLD_NAME = 1
}

enum EnumV2Success
{
    FIRST = 0,
    RENAME_NEW_NAME = 1,
    NEW_VALUE = 2
}

/** A struct used by a version 1 client or server.*/
struct StructV1
{
    1:  required i32            notChanged,
    2:  optional i32            renameOldName,

    10: required i32            toBeRemovedRequired,
    11: optional i32            toBeRemovedOptional = defaultIntValueV1,

    30: optional EnumV1         successEnum,
}

/** Some new data struct defined in version 2.*/
struct NewDataV2
{
    1: optional i32             someInt,
}

/** The version 2 of the StructV1 that is backward/forward compatible.*/
struct StructV2Success
{
    1:  required i32            notChanged,
    2:  optional i32            renameNewName,

    10: required i32            toBeRemovedRequired,
    //11: optional i32            toBeRemovedOptional,  

    20: optional i32            newFieldInt = defaultIntValueV2,
    21: optional string         newFieldString = defaultStringValueV2,
    22: optional NewDataV2      newFieldDataV2,

    30: optional EnumV2Success  successEnum,
}

/** The version 2 of the StructV1 that is only backward compatible.*/
struct Struct2SuccessBackwardOnly
{
     1:  required i32           notChanged,

    //10: required i32          toBeRemovedRequired,  // For backward it seems OK to remove a required member
}

/** The version 2 of the StructV1 that fails.*/
struct StructV2Fail
{
    1:  required i32                    notChanged,

    //10: required i32                    toBeRemovedRequired,  // To test remove of a required member
}


/** Some dummie error code.*/
enum EErrorCode
{
    SUCCESS = 0,
    FAIL    = 1
}


 /**
 *  Generic exception that is thrown when something in the business application whent
 *  wrong, usually due to wrong input.
 */
exception ExceptionV2
{
    /*  The error code that specifies the exception in more detail.*/
    1: required EErrorCode errorCode,
    /*  A detailed technical description of the error */
    2: optional string technicalDescription
}

/** The old version 1 service. */
service TestServiceVersion1
{
    /** For testing that the service is still reachable and functioning properly.*/
    i32     Ping                            (1: i32 input);

    /** For success backward and forward testing. */
    void    MethodStructSuccess             (1: StructV1 input);

    /** For testing failure.*/
    void    MethodStructFail                (1: StructV1 input);

    /** For testing success backward compatibility only. */
    void    MethodStructSuccessBackward     (1: StructV1 input);

    /** Testing failure if you change the name of a method. */
    void    MethodRenamingOldName           ();

    /** Testing that you can add new parameters at the end of the method parameter list. */
    i32     MethodWithAddedParameter        (1: i32 intValue);

    /** Testing that you cannot change the type of a function parameter. */
    i32     MethodWithChangedParameterType  (1: i32 intParam);

    /** Testing that you can add a new exception specification */
    i32     MethodWithAddingException       (1: i32 intValue);

    /** Testing that you can rename enums. */
    EnumV1  MethodEnumSuccess               (1: EnumV1 input);
    
    /** Test that you can rename a struct that is used as a return value */
    StructV1 MethodWithReturnRenamedStruct  (1: i32 input);
}


/** The new version 2 service. */
service TestServiceVersion2
{
    /** For testing that the service is still reachable and functioning properly.*/
    i32     Ping                            (1: i32 input);

    /** For success backward and forward testing. */
    void    MethodStructSuccess             (1: StructV2Success input);

    /** For testing failure.*/
    void    MethodStructFail                (1: StructV2Fail    input);

    /** For testing success backward compatibility only. */
    void    MethodStructSuccessBackward     (1: Struct2SuccessBackwardOnly input);

    /** Testing failure if you change the name of a method.*/
    void    MethodRenamingNewName           ();

    /** Testing that you can add new parameters at the end of the method parameter list.*/
    i32     MethodWithAddedParameter        (1: i32 intValue, 2: double newValue = defaultDoubleValueV2);

    /** Testing that you cannot change the type of a function parameter. */
    i32     MethodWithChangedParameterType  (1: NewDataV2 v2dataParam);

    /** Testing that you can add a new exception specification.*/
    i32     MethodWithAddingException       (1: i32 intValue) throws(1: ExceptionV2 sysEx);

    /** Testing that you can add new methods.*/
    i32     MethodNew                       (1: i32 intValue = defaultIntValueV2);

    /** Testing that you can rename enums. */
    EnumV2Success   MethodEnumSuccess        (1: EnumV2Success input);

    /** Test that you can rename a struct that is used as a return value */
    StructV2Success MethodWithReturnRenamedStruct   (1: i32 input);
}
