//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   ResourceService.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 23-04-2021 Tijmen van Voorthuijsen - Original version
//----------------------------------------------------------------------------

include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "..\\..\\Common\\Interfaces\\CommonService.thrift"
include "..\\Types\\ResourceTypes.thrift"
include "..\\Entities\\Device.thrift"
include "..\\Entities\\Location.thrift"
include "..\\Entities\\LocationLockInfo.thrift"
include "..\\Entities\\LocationOwner.thrift"
include "..\\Entities\\SignalGroup.thrift"

namespace * Noldus.NLinx.Contracts.Public.Services

/** Version of the interface.*/
const i32         interfaceVersion          = 1;
/** The name of the RabbitMQ exchange on which the communication of this service runs.*/
const string      exchange                  = "Noldus.NLinx.Public.ResourceService"
/** This service runs on a direct exchange.*/
const CommonTypes.ExchangeType exchangeType = CommonTypes.ExchangeType.DIRECT
/** Use this routing key to direct messages to this service.*/
const string      routingKey                = "167a6276-d496-4cb7-81c7-566ee961b813"

/** 
* The command interface to operate the resource service. 
*/
service ResourceService extends CommonService.CommonService
{
    /**
     *  Get a list of all current locations. Current locations are locations that are available at present time, for making new recordings. 
     *  A location also contains the information on devices.
     *  @return A list of all current locations.
     *  @Exception: None.
     */
    list<Location.Location> GetCurrentLocations();

    /**
     *  Get a list of all current locations to which the specified owner is linked to. For general information on current locations, see function GetCurrentLocations().
     *  @return A list of all current locations that have a link to the specified owner.
     *  @Exception: ApplicationException if the specified owner is not found or invalid.
     */
    list<Location.Location> GetCurrentLocationsForOwner(/** Must be a valid and existing owner. */	
                                                        1: CommonTypes.GUID ownerId
                                                        ) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);

    /**
     *  Get a list of all enabled locations including their lock info, fitted with the device/signal selection info for the specified owner (= project).
     *  For general information on current locations (selected/locked for a specific owner (= project)), see function GetCurrentLocations().
     *  @return A list of all enabled locations including their lock info, fitted with the device/signal selection info for the specified owner (= project).
     *  @Exception: ApplicationException if the specified owner (= project) is not found or invalid.
     */
    list<Location.Location> GetEnabledLocationsForOwner(/** Must be a valid and existing owner (= project). */	
                                                        1: CommonTypes.GUID ownerId
                                                        ) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);

    /**
     *  Get a list of all dicsovered devices that are free, i.e. not assigned to any location.
     *  @return A list of all free devices.
     *  @Exception: None.
     */
    list<Device.Device> GetFreeDevices();

    /**
     *  Get a list of all devices of the resource service.
     *  @return A list of all free devices.
     *  @Exception: None.
     */
    list<Device.Device> GetAllDevices();

    /**
     *  Get the device object for the specified id.
     *  @return The device object when a valid id is supplied of an existing device, or application exception when device does not exist.
     *  @Exception: ApplicationException: when an invalid deviceId is supplied or a deviceId that has no device object.
     */
    Device.Device GetDevice(
             /** Must be a valid and existing device. */	
             1: CommonTypes.GUID deviceId
             ) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);

    /**
     *  Get all the devices for the specified location, filtered by the selection made by the owner. If the owner is not found, the 
     *  default selections for a location are returned. For example, if a device is selected by default and no owner information is present, the device
     *  will be returned in the list.
     *  @return A list of devices that are part of the location, and filtered by owner, if any.
     *  @Exception: ApplicationException: when an invalid locationId is supplied.
     */
    list<Device.Device> GetDevicesOfOwnerFromLocation(
             /** Must be a valid and existing location. */	
             1: CommonTypes.GUID locationId,
             /** Must be a valid guid, not null. */	
             2: CommonTypes.GUID ownerId
             ) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);

    /**
     *  Sets devices for a location.  The function adds new devices or deletes old devices
     *  @return The updated location.
     *  @Exception: ApplicationException or SystemException.
     */
    Location.Location SetDevicesForLocation(
             /** Must be a valid and existing location. */	
             1: CommonTypes.GUID locationId,
        
             /** A list of ids of devices that will be associated with this location.*/
             2: list<CommonTypes.GUID> deviceIds
             ) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);

    /**
     *  Sets owner for current locations.
     *  @return A list of all current locations.
     *  @Exception: ApplicationException or SystemException.
     */
    list<Location.Location> SetOwnerForCurrentLocations(
             /** Must be a valid and existing owner. */	
             1: LocationOwner.LocationOwner owner,

             /** Whether to add or remove the owner.*/
             2: bool add
             ) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);

    /**
     *  Creates a new location.
     *  @return newly created location.
     *  @Exception: ApplicationException when location name is empty.
     */
    Location.Location CreateNewLocation(
             /** New name for the location. */	
             1: string locationName,

             /** Must be a non-empty location short name. */	
             2: string locationShortName
             ) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);


    /**
     *  Renames a location.
     *  @return The updated location.
     *  @Exception: ApplicationException or SystemException.
     */
    Location.Location RenameLocation(
             /** Must be a valid and existing location. */	
             1: CommonTypes.GUID locationId,

             /** New name for the location. */	
             2: string locationName,
        
             /** New short name for the location.*/
             3: string locationShortName
             ) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);

    /**
     *  Enables/disables a location.
     *  @return The updated location.
     *  @Exception: ApplicationException or SystemException.
     */
    Location.Location EnableLocation(
             /** Must be a valid and existing locations. */	
             1: CommonTypes.GUID locationId,
             
             /** Whether to enable or not.*/
             2: bool enabled
             ) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);

    /**
     *  Get a list of all current enabled locations. Current locations are locations that are available at present time. 
     *  @return A list of all current enabled locations.
     *  @Exception: None.
     */
    list<Location.Location> GetEnabledLocations();

    /**
     *  Deletes a location. Location is not removed from the storage, but just marked as removed. 
     *  @return void.
     *  @Exception: (1) throws application exception when the index of the location argument is a zero guid.
     */
    void   DeleteLocation(
             /** Id of the existing location. */	
             1: CommonTypes.GUID locationId
             ) throws(1: CommonTypes.SystemException sysEx, 2 : CommonTypes.ApplicationException appEx);

    /**
     *  Retrieve a specific location.
     *  @return the requested location.
     *  @Exception: ApplicationException or SystemException.
     */
    Location.Location GetLocation(
             /** Id of location to retrieve. */	
             1: CommonTypes.GUID locationId
             ) throws(1: CommonTypes.SystemException sysEx, 2 : CommonTypes.ApplicationException appEx);

    /**
     *  Locks or unlocks a location.
     *  @return The updated location.
     *  @Exception: ApplicationException or SystemException.
     */
    Location.Location SetLocationLockStatus(
             /** Id of the location to lock or unlock. */	
             1: CommonTypes.GUID locationId, 

             /** info on lock or unlock the location. */	
             2: LocationLockInfo.LocationLockInfo locationLockInfo
             ) throws(1: CommonTypes.SystemException sysEx, 2 : CommonTypes.ApplicationException appEx);

    /**
     *  Retrieve the lock status of specified location.
     *  @return The location lock status.
     *  @Exception: ApplicationException or SystemException.
     */
    LocationLockInfo.LocationLockInfo GetLocationLockStatus(
             /** Id of the location to retrieve lock status from. */	
             1: CommonTypes.GUID locationId, 
             ) throws(1: CommonTypes.SystemException sysEx, 2 : CommonTypes.ApplicationException appEx);

    /**
     *  Selects/deselects a device for an owner. Also updates the selection state of signal groups for the device.
     *  By default, a device and its signal groups are selected (for recording), but with this function you specify differently.
     *  @return The updated device.
     *  @Exception: ApplicationException or SystemException.
     */
    Device.Device SelectDeviceForOwner(
             /** Unique identifier of an owner for who a device or one of its signal groups will be selected/deselected. Must be a valid guid, not null.*/	
             1: CommonTypes.GUID ownerId,

             /** Unique identifier of a device that itself or one of its signal groups will be selected/deselected. Must be a valid guid, not null.*/
             2: CommonTypes.GUID deviceId,

             /** Whether or not the device is selected.*/
             3: bool selected,
             
             /** List of signal groups for the device.*/
             4: list<SignalGroup.SignalGroup> signalGroups,

             /** List of Ids of signal groups which are selected.*/
             5: list<CommonTypes.GUID> selectedSignalGroupIds
             ) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);

    /**
     *  Each devices has an processId that identifies the runtime N-Linx process. This method gets the device objects
     *  for a list of processIds.
     *  @return A list of devices that have the corresponding processId as field.
     *  @Exception: ApplicationException or SystemException.
     */
    list<Device.Device> GetDevicesByProcessId(
             /** A list of processIds of N-Linx processes. */	
             1: list<CommonTypes.GUID> processIds
             ) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);
}
