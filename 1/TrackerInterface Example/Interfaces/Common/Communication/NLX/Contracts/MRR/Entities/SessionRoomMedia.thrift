//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Viso Contracts
// File       :   SessionRoomMedia.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 02-02-2017 Dragana Verpoort Petric   - Original version
//----------------------------------------------------------------------------
include "..\\Entities\\Room.thrift"
include "..\\Entities\\Media.thrift"

namespace csharp Noldus.NLinx.Contracts.Viso.Entities
namespace * Noldus.NLinx.Contracts.Viso

/**
 *  Holds the information and data from one session media of the recorded session.
 */
struct SessionRoomMedia
{
    /**  A unique identifier of the Session media. */
    1: optional i32 id,

    /** The room or location in which this session was recorded. */
    2: optional Room.Room room,

    /** The media related properties of a session. Contains video and layout information when the session was recorded. */
    3: optional Media.Media media
}

