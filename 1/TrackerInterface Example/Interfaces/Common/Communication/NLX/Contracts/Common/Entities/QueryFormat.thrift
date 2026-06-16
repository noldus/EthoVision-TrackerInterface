//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Common Contracts
// File       :   QueryFormat.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 25-09-2019 Rogier Giesen - Refactor
//----------------------------------------------------------------------------

include "..\\Types\\CommonTypes.thrift"

namespace * Noldus.NLinx.Contracts.Common

/**
 *  Determines what function to use to .
 */
enum EQueryAggregationFunction
{
    /** No aggregation. Return all individual point. */
    None = 0,

    /** COUNT(): There will be one row, with the count result in the IntFields */
    Count = 1,

    /** MEAN(): Returns the average field value associated with each field key in the measurement. supports int64 and float64 field value data types. */
    Mean = 2,

    /** MEDIAN(): Returns the middle field value associated with each field key in the measurement. MEDIAN() supports int64 and float64 field value data types. */
    Median = 3,

    /** Returns the sums of field values associated with each field key in the measurement. SUM() supports int64 and float64 field value data types. */
    Sum = 4
}

/** A Struct with information to filter results of a query to a Time Series Database */
struct QueryFormat
{
    /** Only return samples from this time. Including the time specified. */
    1: optional EQueryAggregationFunction aggregationFunction = EQueryAggregationFunction.None,

    /** Limit the number of results.  */
    2: optional i32 limit,

    /** Offset/Skip the first n results. Remember to only use on a collection that does not change between calls. */
    3: optional i32 offset = 0,

    /** Order ascending or descending on time. */
    4: optional bool orderAscending = false
}