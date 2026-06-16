//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Common Entities Contracts
// File       :   PositionData.thrift (renamed from LocationData.thrift 9-6-2021)
//----------------------------------------------------------------------------
// Revisions  :
// 22-08-2019 Coen van Kaam   Original version
//----------------------------------------------------------------------------

include "..\\Types\\CommonTypes.thrift"

namespace * Noldus.NLinx.Contracts.Common

/** Provides properties for the Position data. */
struct PositionData
{
    /** The sample time stamp of the position data, in Unix time. */
    1: required CommonTypes.UnixTime timeStamp,

    /** The 3D position of the sample. Mind that double.NaN cannot be transferred by thrift or be stored in TSS. (or both?) */
    2: required CommonTypes.Point3D position,

    /** TagId (stored as a tag in Influx DB) of the sample. */
    3: required string tagId,

    /** SessionId (stored as a tag in Influx DB) of the sample. EntityId.Invalid until a sessionId is assigned just before storage by TL server. */
    4: required i32 sessionId,

    /** TrackId (stored as an integer field in Influx DB) of the sample. EntityId.Invalid until a trackId is assigned just before storage by TL server. */
    5: required i32 trackId,
}
