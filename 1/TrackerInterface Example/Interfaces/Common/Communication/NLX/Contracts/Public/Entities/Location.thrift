//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   Location.thrift
//----------------------------------------------------------------------------
// Revisions  :
//----------------------------------------------------------------------------

include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "..\\..\\Common\\Types\\ProgramTypes.thrift"
include "..\\Types\\ResourceTypes.thrift"
include "Device.thrift"
include "LocationOwner.thrift"
include "LocationLockInfo.thrift"

namespace * Noldus.NLinx.Contracts.Public.Entities

/** The location represents a logical combination of devices with the purpose to use these devices in a live recording. */
struct Location
{
    /** Identifier of a location. When this identifier has been defined, it is guaranteed to be unique within the platform and represents the storage id. When the 
    *   Id is not defined, it represents a new location, not yet present in storage.*/
    1: optional CommonTypes.GUID id,

    /** The name of the location and this name you can see in the user interface. An example for the name is a name a room or the name given to a recording site. */
    2: optional string name,

    /** The devices assigned to this location. There can be zero or more devices in a location.*/
    3: optional list<Device.Device> devices,

    /** A location owner is for example a project that has selected the location for making recordings. */
    4: optional list<LocationOwner.LocationOwner> owners,

    /** Locations can be enabled/disabled for usage. */
    5: optional bool enabled,

    /** Locations which were deleted are marked as removed and kept in the storage. */
    6: optional bool removed,

    /** The short name of the location, used in the UI in case when Name is too long to dispaly. Any lenght is allowed, lenght is controled and specified by the UI. */
    7: optional string shortName,

    /** Locations lock information. */
    8: optional LocationLockInfo.LocationLockInfo lockInfo
}
