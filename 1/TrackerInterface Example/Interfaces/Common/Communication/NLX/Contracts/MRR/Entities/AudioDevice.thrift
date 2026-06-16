//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   MRR
// Module     :   Noldus.Mrr.Contracts
// File       :   AudioDevice.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 29-05-2015 Krizsán Péter             - Original version
//----------------------------------------------------------------------------
include "..\\Types\\VisoTypes.thrift"

namespace csharp Noldus.NLinx.Contracts.Viso.Entities
namespace * Noldus.NLinx.Contracts.Viso

/**
 *  An entity that contains the selected audio device of a channel
 */
struct AudioDevice
{
    /**  A unique identifier of the device. */
    1: optional i32 id,

    /**  The name of the audio device */
    2: optional string name,

    /**  The description of the audio device */
    3: optional string description,

    /**  The unique ID of the audio device that identifies it in the system */
    4: optional string sourceID
}