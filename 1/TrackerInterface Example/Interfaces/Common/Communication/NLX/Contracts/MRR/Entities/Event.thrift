//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Viso Contracts
// File       :   Event.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 15-12-2014 Gabriela Ignacio              - Original version
//----------------------------------------------------------------------------

include "..\\Entities\\Marker.thrift"
include "..\\Entities\\Subject.thrift"
include "..\\..\\Common\\Types\\CommonTypes.thrift"

namespace csharp Noldus.NLinx.Contracts.Viso.Entities
namespace * Noldus.NLinx.Contracts.Viso

/** 
 *  Represents an event, an event contains a comment or a marker or both.
 */
struct Event
{
    /**  A unique identifier of the event. */
    1: optional i32 id,

    /** Time of the event relative to the start of a session in microseconds. */
    2: optional CommonTypes.Duration relativeTimeStamp,

    /** The scored marker of the event. */
    3: optional Marker.Marker marker

    /** A free text comment. */
    4: optional string comment,

    /** The scored subject of the event. That can be null if only marker/comment is scored. */
    5: optional Subject.Subject subject
}

