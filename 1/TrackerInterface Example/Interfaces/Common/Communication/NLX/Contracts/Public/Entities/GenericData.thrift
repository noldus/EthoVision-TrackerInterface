//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Entities Contracts
// File       :   GenericData.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 16-01-2022 Rogier Giesen - Original version
//----------------------------------------------------------------------------

include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "..\\..\\Common\\Entities\\TimeSeriesPoint.thrift"

namespace * Noldus.NLinx.Contracts.Public.Entities

/** Generic timeseries data. */
struct GenericData
{
    /** Identifier of the source process. This ID should be used to identify to which
    *   source the generic data belongs, for example in storage.*/
    1: optional CommonTypes.GUID sourceId,
    
    /** A list generic samples that describes at each sample point value and meta data.*/
    2: TimeSeriesPoint.TimeSeriesPoint Point
}
