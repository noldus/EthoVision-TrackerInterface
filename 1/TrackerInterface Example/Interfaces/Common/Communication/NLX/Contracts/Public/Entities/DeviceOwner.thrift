//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   DeviceOwner.thrift
//----------------------------------------------------------------------------
// Revisions  :
//----------------------------------------------------------------------------

include "..\\..\\Common\\Types\\CommonTypes.thrift"

namespace * Noldus.NLinx.Contracts.Public.Entities

/** The device owner identifies the entity or platform concept that is using a device. It also leaves room for adding possible other relevant data about the device owner. */
struct DeviceOwner
{
    /** Identifies the owner of a device.*/
    1: optional CommonTypes.GUID id,

    /** Specify true if this owner has selected the device, for making a recording. Specify false when the device is not in use by the owner. */
    2: optional bool selected,
}
