//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Common Contracts
// File       :   DeviceInfo.thrift
//----------------------------------------------------------------------------
// Revisions  :
//----------------------------------------------------------------------------
include "..\\Types\\CommonTypes.thrift"
include "..\\Types\\ProgramTypes.thrift"
include "..\\..\\Public\\Types\\DataTypes.thrift"

namespace * Noldus.NLinx.Contracts.Common

/** The device info provides additional information about a device that collects data. This information only applies
*   to N-Linx processes that take the role of producer, see ProgramTypes.ERole. A device is often a physical hardware device but 
*   may equally well be a software device, for example a plugin of a browser.
*/
struct DeviceInfo
{
    /** The name of the device as a human readable string. This name can be used for example in the user interface and in logging files. */
    1: optional string name,

    /** The type of the device places the device is a category of similar devices. This type allows clients to group and select devices
    *   which are similar. */
    2: optional ProgramTypes.EDeviceType deviceType,

    /** This ID will be attached to the data stream that is produced by the device, it identifies the source of the data. This guid identifier 
    *   can be the processId of an N-Linx process, but may equally well be some other ID, for example an ID of a video source.*/
    3: CommonTypes.GUID deviceId,

    /** Preferably a unique identifier of a device. The serial number can help in a unique identification of a device in the matching between live devices and those saved
    *   in long-term storage.*/
    4: optional string serialNumber,

    /** Device-specific settings, which can be defined as [key, value] pairs in a hierarchical property tree.*/
    5: optional CommonTypes.PropertyTree customProperties,

    /** The data types that are collected through this device.*/
    6: optional list<CommonTypes.DataType> providedDataTypes
}
