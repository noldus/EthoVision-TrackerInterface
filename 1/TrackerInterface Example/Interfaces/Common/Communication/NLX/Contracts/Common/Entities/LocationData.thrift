//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Common Entities Contracts
// File       :   LocationData.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 22-08-2019 Coen van Kaam   Original version
//----------------------------------------------------------------------------

include "..\\Types\\CommonTypes.thrift"

namespace * Noldus.NLinx.Contracts.Common

/** Provides properties for the location data. */
struct LocationData
{
    /** The sample time stamp of the location data, in Unix time. */
    1: required CommonTypes.UnixTime timeStamp,

    /** The 3D location or (0, 0, 0) in case the event does not represent a sample. Mind that double.NaN cannot be transferred by thrift or be stored in ADA. (or both?) */
    2: required CommonTypes.Point3D location,

    /** TagId (stored as a tag in Influx DB) or EntityId.Invalid in case the event does not represent a sample. */
    3: required string tagId,

    /** Optional additional information stored as tags in Influx DB or empty in case the event does not represent a sample. */
    4: optional map<string, i32> additionalTags,
}
