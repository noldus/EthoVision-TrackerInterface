//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Viso Contracts
// File       :   Room.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 07-11-2014 Tijmen van Voorthuijsen   - Original version
//----------------------------------------------------------------------------
include "..\\Entities\\Recorder.thrift"
include "..\\Entities\\User.thrift"
include "..\\Entities\\Department.thrift"
include "..\\Types\\VisoTypes.thrift"
include "..\\..\\Common\\Types\\CommonTypes.thrift"

namespace csharp Noldus.NLinx.Contracts.Viso.Entities
namespace * Noldus.NLinx.Contracts.Viso

/** 
 *  A Room represents a location from which a live recording can take place.
 *  It is connected to a Viso Recording instance.
 */
struct Room
{
    /** A unique identifier of the room. */
    1: optional i32 id,

    /** The user-friendly name of the room. */
    2: optional string name,   

    /** A description of the room. */
    3: optional string description,    

    /** The Viso Recorder instance connected to this room. A room without a Viso Recorder instance is allowed, i.e. there can be 0 or 1 Viso Recorder instance connected. */
    4: optional Recorder.Recorder recorder,

    /** The status of the room, see ERoomStatus for more details. */
    5: optional VisoTypes.ERoomStatus roomStatus,

    /** When a user uses a room for making a live recording the room will be locked from other users. Other users can only view the room but not score or make a recording in a locked room. */
    6: optional User.User lockedBy,

    /** The date and time when the user locked the room for editing. */
    7: optional CommonTypes.IsoDateTime lockedTime,

    /** A property used for specifying that a room is under the creation progress. */
    8: optional bool isNew,

    /** Holds the department that this room belongs to. */
    9: optional Department.Department department
}

