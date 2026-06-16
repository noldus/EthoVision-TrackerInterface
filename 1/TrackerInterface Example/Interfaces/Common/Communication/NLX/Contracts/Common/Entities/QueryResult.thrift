//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Common Contracts
// File       :   QueryResult.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 25-09-2019 Rogier Giesen - Refactor
//----------------------------------------------------------------------------

include "..\\Types\\CommonTypes.thrift"
include "QueryFilter.thrift"
include "QueryFormat.thrift"
include "TimeSeriesPoint.thrift"

namespace * Noldus.NLinx.Contracts.Common


/**
 *  Indicates how the query succeeded.
 */
enum EQuerySearchStatus
{
    /** Default value Undetermined. */
    Undetermined = 0,

    /** The query was successful. */
    Success = 1,

    /** The query was unsuccessful and failed. */
    Failed = 2

    /** The query was successful, and more results are being processed. */
    ProcessingBatch = 3

    /** The query was successful, and this is the last batch.*/
    LastBatch = 4
}

/**
 *  Return status and TimeSeriesPoints.
 */
struct QueryResult
{
    /** The status of executing the query.*/
    1: optional EQuerySearchStatus querySearchStatus,

    /** The list of TimeSeriesPoints matching the query.*/
    2: optional list<TimeSeriesPoint.TimeSeriesPoint> timeSeriesPoints,

    /** Total number of of packages. Multiple batches can be returned to prevent timeouts and enable progress monitoring. */
    3: optional i32 totalNumberOfBatches = 1,

    /** The folowup number of the batch, starting at 1. */
    4: optional i32 batchNumber = 1
}
