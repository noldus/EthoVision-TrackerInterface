//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Viso Contracts
// File       :   OnvifDevice.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 30-07-2019 Adrian Kovacs           - Original version
//----------------------------------------------------------------------------

include "..\\..\\Common\\Types\\CommonTypes.thrift"

namespace csharp Noldus.NLinx.Contracts.Viso.Entities
namespace * Noldus.NLinx.Contracts.Viso

/**
 *  An entity that contains the properties of a discovered ovnif device
 */
struct OnvifDevice
{
    /**  IP address of the device */
    1: optional string IPAddress,

    /** Name of the device */
    2: optional string Name,

    /** Time when the device discovered */
    3: optional CommonTypes.IsoDateTime DiscoverTime,

    /** Cababilities of the devices listed here */
    4: optional list<string> Capabilities
}

