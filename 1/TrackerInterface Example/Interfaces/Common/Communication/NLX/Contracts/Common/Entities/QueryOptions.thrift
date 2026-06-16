//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Common Contracts
// File       :   QueryOptions.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 20191017 Ramon Bollen
//----------------------------------------------------------------------------

include "..\\Types\\CommonTypes.thrift"
include "..\\Entities\\TimeSeriesPoint.thrift"

namespace * Noldus.NLinx.Contracts.Common


/** A Struct with information on how to process the query */
struct QueryOptions
{
	/** Read the data as chunked data (this will increase performance with larger query results) */
	1: optional bool readChunked = false,

	/** Sets the size of the chunked responses.*/
	2: optional i32 chunkSize = 10000,

	/** Resolution of the timestamps.*/
	3: optional TimeSeriesPoint.ETimeSeriesPrecision precision = TimeSeriesPoint.ETimeSeriesPrecision.Millisecond
}