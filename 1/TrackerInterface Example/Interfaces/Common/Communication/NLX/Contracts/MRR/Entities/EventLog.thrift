//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Viso Contracts
// File       :   EventLog.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 15-12-2014 Gabriela Ignacio      - Original version
//----------------------------------------------------------------------------
include "..\\Entities\\Event.thrift"
include "..\\Entities\\CodesList.thrift"

namespace csharp Noldus.NLinx.Contracts.Viso.Entities
namespace * Noldus.NLinx.Contracts.Viso

/**
 *  Holds the information and data of one event log in a session.
 */
struct EventLog
{
    /**  A unique identifier of the event log. */
    1: optional i32 id,

    /** The list of scored events in this event log. */
    2: optional list<Event.Event> events,

    /** The list of codes used to score events with subjects and markers on this event log. */
    3: optional CodesList.CodesList codesList
}

