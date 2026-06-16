//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   Device.thrift
//----------------------------------------------------------------------------
// Revisions  :
//----------------------------------------------------------------------------

include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "..\\..\\Common\\Types\\ProgramTypes.thrift"
include "..\\..\\Common\\Entities\\DeviceInfo.thrift"
include "..\\Types\\ResourceTypes.thrift"
include "DeviceOwner.thrift"
include "SignalGroup.thrift"

namespace * Noldus.NLinx.Contracts.Public.Entities

/** The device represents the entity in the platform that collects data. A device is often a physical apparatus but 
*   may equally well be a software device, for example a plugin of a browser. Examples of devices: a remote eye tracker, an ECG sensor, a screen capture.
*/
struct Device
{
    /** Identifier of this device entity. This identifier is guaranteed to be unique within the platform. It does not represent the storage id because ephemeral devices, 
    *   those that are discovered but not selected in a location, have also a unique id. */
    1: optional CommonTypes.GUID id,

    /** The friendly name given to the device that is often used in the user interface. This name can be the same as the name in the device info, but can also be different.
    *   The name in the device info is more fixed and set by the device manufacturer.*/
    2: optional string displayName,

    /** Contains the name of the device, device settings and other meta data. */
    3: optional DeviceInfo.DeviceInfo deviceInfo,

    /** A device can be enabled or disabled. This is an application level turning on or off of the device. A device that has been disabled cannot be used anywhere.*/
    4: optional bool enabled,

    /** The name of the computer on which the device is connected or running. The computer name can be used for uniquely identifying a device, for example when there 
    *   are two of the same devices discovered, the computer name can be a discriminating factor.*/
    5: optional string computerName,

    /** Specifies a list of those who selected the device. A device can be enabled as a whole, but still be not selected for recording for a given owner, e.g. a project can deselect
    *   the device. This information is also needed on application level, for example when no one owns the device the device can be removed.*/
    6: optional list<DeviceOwner.DeviceOwner> owners, 
    
    /** Provides compiled information on the availability and other states of the device. The status will be compiled from different sources and the exact interpretation of the status levels
    *   depends on the device and collector site specifics.*/
    7: optional ResourceTypes.EDeviceStatus deviceStatus,

    /** If the processId is non-zero, it represents the id of the N-Linx data collection process to which this device is related. The processId is a runtime 
    *   value, not made persistent, and this value may change during the lifetime of the device entity. For example, when the N-Linx data collection
    *   process is restarted, a new processId is generated. Reading the devices from the resource service will always give a latest valid value for the processId.*/
    8: optional CommonTypes.GUID processId,

    /** Specifies a list of signal groups selected for the device. For example, for Webcam device you can have Facial Expression signal group and 
    *   Participant view signal group.*/
    9: optional list<SignalGroup.SignalGroup> signalGroups, 
}
