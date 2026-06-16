//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Common Contracts
// File       :   QueryFilter.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 25-09-2019 Rogier Giesen - Refactor
//----------------------------------------------------------------------------

include "..\\Types\\CommonTypes.thrift"

namespace * Noldus.NLinx.Contracts.Common


/**
 *  Determines how the search term must match in the results for boolean.
 */
enum EQueryMatchBool
{
    /** Value is Undefined. WARNING: Does not work on InfluxDb 1.7! */
    Undefined = 0,

    /** Value is True */
    IsTrue = 1,
    
    /** Value is False */
    IsFalse = 2,
}


/**
 *  Determines how the search term must match in the results for string.
 */
enum EQueryMatchString
{
    /** Only results with exactly the search string will be returned */
    IsExactly = 0,

    /** Everything except this exact string will be returned */
    IsNotExactly = 1,

    /** Results that contain the search string will be returned */
    Contains = 2,

    /** Results that contain the search string will be returned */
    DoesNotContain = 3,

    /** Results that contain (case insensitive) the search string will be returned */
    ContainsCaseInsensitive = 4,

    /** Results match Regular Expression */
    Regex = 5,

    /** Results don't match Regular Expression */
    NotRegex = 6}

/**
 *  Determines how the search term must match in the results for boolean.
 */
struct QueryBoolFilter
{
    /** An enum with option(s) to match upon.*/
    1: required EQueryMatchBool matchType
}

/**
 *  Determines how the search term must match in the results for string.
 */
struct QueryStringFilter
{
    /** the exact name of the tag.*/
    1: required string value,

    /** An enum with option(s) to match the value property with a field value.*/
    2: required EQueryMatchString matchType
}

/**
 *  Determines how the search term must match in the results for float.
 */
struct QueryFloatFilter
{
    /** Determines if the lower limit is included.*/
    1: optional bool includeLowerLimit = true,

    /** If a sample had a value below this it will be filtered out.*/
    2: optional double lowerLimit,

    /** Determines if the upper limit is included.*/
    3: optional bool includeUpperLimit = true,

    /** If a sample had a value above this it will be filtered out.*/
    4: optional double upperLimit
}

/**
 *  Determines how the search term must match in the results for integer.
 */
struct QueryIntegerFilter
{
    /** Determines if the lower limit is included.*/
    1: optional bool includeLowerLimit = true,

    /** If a sample had a value below this it will be filtered out.*/
    2: optional i32 lowerLimit,

    /** Determines if the upper limit is included.*/
    3: optional bool includeUpperLimit = true,

    /** If a sample had a value above this it will be filtered out.*/
    4: optional i32 upperLimit
}


/** A variant-like value placeholder which ensures type safety.*/
union QueryFilterValue
{
    1: QueryBoolFilter    boolValue,
    2: QueryStringFilter  stringValue,
    3: QueryIntegerFilter intValue,
    4: QueryFloatFilter   doubleValue
}


/** A set of variables to define a filter on a field.*/
struct QueryFieldFilter
{
    /** the exact name of the field.*/
    1: required string field,

    /** How to filter the field. E.g. Exact match 'Cat' or greater than 5. Can contain one filter of 4 types. */
    2: required QueryFilterValue filter
}

/** A set of variables to define a filter on a tag.*/
struct QueryTagFilter
{
    /** the exact name of the tag.*/
    1: required string tag,

    /** A list of values to filter on. A record having any of these exact strings for the tag will be returned.*/
    2: required list<string> values
}

/** A Struct with information to filter results of a query to a Time Series Database */
struct QueryFilter
{
    /** Only return samples from this time. Including the time specified. */
    1: optional CommonTypes.UnixTime fromTime,

    /** Includes the 'fromTime' into the query. i.e. False = larger than toTime, True = larger than or equal to toTime. true by default */
    2: optional bool fromTimeIncluded = true,

    /** Only return samples before this time. Excluding the time specified by default. Set toTimeIncluded to true to include.  */
    3: optional CommonTypes.UnixTime toTime,

    /** Includes the 'toTime' into the query. i.e. False = smaller than toTime, True = smaller than or equal to toTime. false by default */
    4: optional bool toTimeIncluded = false,

    /** Only return samples that have the specified value(s) in the specified Tag(s). */
    5: optional list<QueryTagFilter> tagFilter,

    /** Only return samples that have the specified characteristic(s) in the specified Field(s). */
    6: optional list<QueryFieldFilter> fieldFilter
}
