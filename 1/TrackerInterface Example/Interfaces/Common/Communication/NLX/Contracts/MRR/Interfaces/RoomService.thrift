//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Viso Contracts
// File       :   RoomService.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 17-02-2015 Jeroen Diederix           - Original version
//----------------------------------------------------------------------------
include "..\\Entities\\Recorder.thrift"
include "..\\Entities\\Machine.thrift"
include "..\\Entities\\Room.thrift"
include "..\\Entities\\User.thrift"
include "..\\Entities\\AudioDevice.thrift"
include "..\\Entities\\OnvifDevice.thrift"
include "..\\Entities\\VideoDevice.thrift"
include "..\\Entities\\ChannelSettings.thrift"
include "..\\Entities\\PtzSettings.thrift"
include "..\\Types\\VisoTypes.thrift"
include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "..\\..\\Common\\Interfaces\\CommonService.thrift"

namespace csharp Noldus.NLinx.Contracts.Viso.Services
namespace * Noldus.NLinx.Contracts.Viso

// Settings for this service
const i32         interfaceVersion  = 2;
const string      exchange          = "Noldus.NLinx.Viso.RoomService"
const string      routingKey        = "24145A22-D016-4E7C-BB55-DF06D9826E7B"


/**
 *  Return enum for the TryLockRoom function
 */
enum ELockRoomResult
{
    /** Could not determine the lock state */
    Unknown,
    /** Succesfully locked */
    Success,
    /** Success: already locked by the same user */
    LockedBySameUser,
    /** Failed: locked by other user */
    LockedByOtherUser
}


/**
*  Return enum for TryGetRecorderDeviceOptions
*/
enum EGetRecorderDeviceOptionsResult
{
    /** Successfully connected */
    Success = 0,

    /** unknown error */
    Failed = 1,

    /** The username/password was wrong, or check the webservice settings in the camera */
    CannotConnect = 2,

     /** The current user has insufficient rights for retrieving onvif profile information. You need operator or Administrator rights. */
    InsufficientUserRights = 3,

    /** No ONVIF capable device was found */
    NotOnvifCapable = 4,
}


/**
*  The possible values that can be used for the VideoDevice
*/
struct GetRecorderDeviceOptionsResult
{
    /** The result */
    1: optional EGetRecorderDeviceOptionsResult result,

    /** The options and values that can be changed for this device */
    2: optional VisoTypes.VideoDeviceOptions videoDeviceOptions,

    /** Current Device settings */
    3: optional VideoDevice.VideoDevice currentSettings,

    /** True if PTZ is supported, false otherwise */
    4 : optional bool isPtzSupported,

    /** True if audio is supported, false otherwise */
    5 : optional bool isAudioSupported
}


/**
*  Small return enum for TrySetRecorderDeviceOptions
*/
enum ESetRecorderDeviceOptionsResult
{
    /** Sucessfully set the new settings */
    Success,

    /** unknown error */
    Failed,

    /** The username/password was wrong, or check the webservice settings in the camera */
    CannotConnect,

    /** No ONVIF capable device was found */
    NotOnvifCapable,

    /** The settings are invalid */
    InvalidSettings,
}


/**
*  The result object for TrySetRecorderDeviceOptions
*/
struct SetRecorderDeviceOptionsResult
{
    /** The result */
    1: optional ESetRecorderDeviceOptionsResult result,

    /** The newly set device properties */
    2: optional VideoDevice.VideoDevice newSettings,
}

/**
 *  Small return enum for GetDiscoveredOnvifDeviceList
 */
enum EGetDiscoveredOnvifDeviceListResult
{
    /** Sucessfully found at least one device */
    Success = 0,

    /** unknown error */
    Failed = 1,

    /** Machine is not running */
    MachineNotRunning = 2,

    /** No onvif capable device was found */
    NoOnvifDeviceFound = 3,
}

/**
 *  The result object for GetDiscoveredOnvifDeviceList
 */
struct GetDiscoveredOnvifDeviceListResult
{
    /** The result */
    1: optional EGetDiscoveredOnvifDeviceListResult result,

    /** The newly set device properties */
    2: optional list<OnvifDevice.OnvifDevice> devices,
}

/**
*  Enum to define room update result
*/
enum ERoomUpdateResult
{
    /** Room updated successfully */
    Success,

    /** The name of the room is not unique */
    NameNotUnique,

    /** The room to be updated not found in the repository */
    RoomNotFound,
}


struct RoomUpdateResult
{
    /** The result */
    1: optional ERoomUpdateResult result,

    /** The updated Room */
    2: optional Room.Room updatedRoom,
}


/**
*  Parameters for GetMachine function.
*/
struct GetMachineParams
{
    /** Machine entity Id */
    1: optional i32 machineEntityId,

    /** Machine Id */
    2: optional CommonTypes.GUID machineId,
}



/** 
 *  The session service is responsible for creating new live recordings and for retrieving recorded sessions. 
 */
service RoomService extends CommonService.CommonService
{

    /**
     *  Get a list of all the rooms added in the MRR Solution.
     *  @return list<Room> - Complete list of all the rooms.
     */
    list<Room.Room> GetRooms() throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Get an recent version of the room.
     *  @return Room - The room entity that belongs to the specified room Id.
     *  @exception InvalidIndex - when the roomId is invalid, not found in the services.
     */
    Room.Room GetRoom(
            /** The room id */
            1: i32 roomId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

     /**
     *  check if the current user has elevated room access to a location (may view location even if locked by someone else)
     *  @return bool - true if starting, false otherwise
     */
    bool HasElevatedRoomAccess(
            /** The room id */
            1: i32 roomId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Get the room that belongs to a MRR Recorder device.
     *  @return Room - The room entity that belongs to the specified device Id.
     *  @exception InvalidRoom - invalid deviceId, the deviceId is not found in the services.
     */
    Room.Room GetRoomByDevice(
            /** The device ID of the MRR Recorder. */
            1: CommonTypes.GUID deviceId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

    /**
     *  Get all the rooms that are locked by the given user.
     *  @return A list of rooms that are locked by the given user.
     */
    list<Room.Room> GetRoomsLockedBy(
            /** The user entity for which to find the locked rooms.*/
            1: User.User user
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Get the room based on the Id (only for services calls)
     *  @return Room - The room entity that belongs to the specified room Id.
     *  @exception InvalidIndex - when the roomId is invalid, not found in the services.
     */
    Room.Room GetRoomByID(
            /** The room id */
            1: i32 roomId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Get the rooms based on the machine Id. (only for services calls)
     *  @return A list of rooms that belongs to the specified machine Id.
     *  @exception InvalidIndex - when the roomId is invalid, not found in the services.
     */
    list<Room.Room> GetRoomsByMachineID(
            /** The machine id */
            1: CommonTypes.GUID MachineId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Adds one room to the MRR Services with the specified name and information about the UMR device.
     *  @return Room - the room has been successfully added, false: the specified roomName was already in use within the MRR Solution, no duplicate names can be added.
     */
    Room.Room  AddRoom(
            /** A descriptive name of the room as entered by the user. This name must be unique withing the MRR Solution, if not unique this method will fail. */
            1: string roomName,
            /** Describes a UMR device. */
            2: i32 recorderId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Updates the room information in the services with the supplied argument. Only the name of the room is updated.
     *  @return RoomUpdateResult - Contains the result and the updated room as present in the services.
     */
    RoomUpdateResult UpdateRoom(
            /** The new data of the room. Must not be null */
            1: Room.Room updatedRoom
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Remove an existing room entity
     */
    void RemoveRoom(
        /** The machine id that should be removed */
        1:  i32 roomId
        ) throws(1: VisoTypes.SystemException sysEx, 2 : VisoTypes.AuthorizationException authEx, 3 : VisoTypes.ApplicationException appEx);


    /**
     *  Adds a new MRR Recorder device to the services with the specified device Id.
     *  @return Recorder - The new and valid device entity that has been added to the services.
     */
    Recorder.Recorder AddRecorderDevice(
            /** A new and unique device Id. */
            1: CommonTypes.GUID deviceId
            /** The machine id */
            2: i32 machineId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Update the recorder to startup automatically.
     *  @return bool - true if starting, false otherwise
     */
    bool SetRecoderStartup(
            /** The recorder is */
            1: i32 recorderId,
            /** True to startup this recorder, false not to startup */
            2: bool startup
            /** True to skip checking the maximum allowed number of recorders (on add new location), false to not allow exceeding the number of maximum allowed recorders */
            3: bool ignoreMaxRecorderCountCheck
        ) throws(1: VisoTypes.SystemException sysEx, 2 : VisoTypes.AuthorizationException authEx, 3 : VisoTypes.ApplicationException appEx);


    /**
    *  Stops the video streaming from the associated recorder
    */
    void StopStreaming(
            /** A valid and existing room must be supplied. */
            1:  i32 roomId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Determines if we can startup more recorders on the specified machine.
     *  @return bool - true if limit reached, false otherwise
     */
    bool IsRecorderLimitReached(
            /** The machine id */
            1: i32 machineId
        ) throws(1: VisoTypes.SystemException sysEx, 2 : VisoTypes.AuthorizationException authEx, 3 : VisoTypes.ApplicationException appEx);


    /**
     *  Get the MRR Recorder device for the specified device Id.
     *  @return Recorder - The device entity.
     *  @exception InvalidDevice - thrown when the deviceId is invalid or not present in the services.
     */
    Recorder.Recorder GetRecorderDevice(
            /** The device ID of the MRR Recorder. This ID must be valid and exist in the services. */
            1: CommonTypes.GUID deviceId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Set the MRR Recorder device data.
     *  @return Recorder - The device entity.
     *  @exception InvalidDevice - thrown when the deviceId is invalid or not present in the services.
     */
    Recorder.Recorder UpdateRecorderDevice(
        /** The recorder to update with the new data. */
        1: Recorder.Recorder recorder
        ) throws(1: VisoTypes.SystemException sysEx, 2 : VisoTypes.AuthorizationException authEx, 3 : VisoTypes.ApplicationException appEx);


    /**
     *  Set the MRR video device properties of a specific camera/channel
     *  @return VideoDevice - The updated video device entity
     */
    VideoDevice.VideoDevice UpdateVideoDevice(
            /** The id of the channel settings entity */
            1: i32 channelId
            /** The new or updated video device properties */
            2: VideoDevice.VideoDevice videoDevice
        )


    /**
     *  DEPRECATED since R4. Since R4 the room status is a readonly property and is internally composed out of the recorder status and
     *  other inputs like for example if a room is locked by a user.
     *  Set the status of a room.
     */
    void SetRoomStatus(
            /** room Guid */
            1: CommonTypes.GUID deviceId,
            /** The new room status */
            2: VisoTypes.ERoomStatus status
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Set the status of a machine
     */
    void SetMachineStatus(
            /** machine Guid */
            1: CommonTypes.GUID deviceId,
            /** The new machine status */
            2: VisoTypes.EMachineStatus status
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Set the status of a recorder
     */
    void SetRecorderStatus(
            /** Device ID of the recorder. */
            1: CommonTypes.GUID deviceId,
            /** The new recorder status */
            2: VisoTypes.ERecorderStatus status
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Try to lock the room for the current user. The current user is implicitly retrieved from the session token that
     *  is send throught the message header.
     */
    ELockRoomResult TryLockRoom(
            /** Room to be locked. */
            1:  i32 roomId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Try to lock the room for the specific user. The userId is explicitly passed as parameter to this function.
     */
    ELockRoomResult TryLockRoomExplicitly(
            /** Room to be locked. */
            1:  i32 roomId
            /** User who locks the room. */
            2:  i32 userId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Unlock the room when the current user locked it
     */
    void UnlockRoom(
            /** Room to be unlocked */
            1:  i32 roomId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Forced unlocking of a room. Normally only the user that locked the room can unlock his room. But by using this method a user with
     *  user management rights can also enforce to unlock any room.
     *  Rights needed: user management.
     */
    void UnlockRoomEnforced(
            /** Room to be unlocked */
            1:  i32 roomId        
        )

    /**
     *  Add a new machine entity, the name should be unique.
     *  @return Machine - The machine that was added.
     */
    Machine.Machine AddMachine(
            /** Machine that should be added */
            1:  Machine.Machine machine
        ) throws(1: VisoTypes.SystemException sysEx, 2 : VisoTypes.AuthorizationException authEx, 3 : VisoTypes.ApplicationException appEx);


    /**
     *  Update an existing machine entity, the name should be unique.
     *  @return Machine - The machine that was updated.
     */
    Machine.Machine UpdateMachine(
        /** Machine that should be updated */
        1:  Machine.Machine machine
        ) throws(1: VisoTypes.SystemException sysEx, 2 : VisoTypes.AuthorizationException authEx, 3 : VisoTypes.ApplicationException appEx);


    /**
     *  Remove an existing machine.
     */
    void RemoveMachine(
        /** The machine id that should be removed */
        1:  i32 machineId
        ) throws(1: VisoTypes.SystemException sysEx, 2 : VisoTypes.AuthorizationException authEx, 3 : VisoTypes.ApplicationException appEx);


    /**
     *  Get a list of all registered machines.
     *  @return List<Machine> - The list of all machines
     */
    list<Machine.Machine> GetMachines() throws(1: VisoTypes.SystemException sysEx, 2 : VisoTypes.AuthorizationException authEx, 3 : VisoTypes.ApplicationException appEx);


    /**
     *  Get the machine specified in the parameters class.
     *  @return Machine - machine that match given entity id or machine id.
     */
    Machine.Machine GetMachine(
            1:    GetMachineParams parameters
            ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Tries to resolve a name conflict issue due to duplicated recorder machines.
     *  @result bool - true if success, false otherwise
     */
    bool TryFixNameConflict(
            /** The id of the machine entity that has name conflict to be fixed */
            1:  i32 machineId
        ) throws(1: VisoTypes.SystemException sysEx, 2 : VisoTypes.AuthorizationException authEx, 3 : VisoTypes.ApplicationException appEx);


    /**
     *  Get the available audio sources
     */
    list<AudioDevice.AudioDevice> TryGetAudioDevices(
            /** The id of the recorder */
            1:  i32 recorderId
        ) throws(1: VisoTypes.SystemException sysEx, 2 : VisoTypes.AuthorizationException authEx, 3 : VisoTypes.ApplicationException appEx);


    /**
     *  Get the options and status of a given channel/device
     *  @result GetRecorderDeviceOptionsResult - An extensive class with all device options
     */
    GetRecorderDeviceOptionsResult TryGetRecorderDeviceOptions(
            /** The id of the recorder that handles this device */
            1:  i32 recorderId
            /** The channel settings to connect to a camera and get the profile and profile options */
            2:  ChannelSettings.ChannelSettings channelSettings
        ) throws(1: VisoTypes.SystemException sysEx, 2 : VisoTypes.AuthorizationException authEx, 3 : VisoTypes.ApplicationException appEx);


    /**
     *  Set the device options of the given channel/device
     *  @result SetRecorderDeviceOptionsResult - The result of the operation
     */
    SetRecorderDeviceOptionsResult TrySetRecorderDeviceOptions(
            /** The id of the recorder that handles this device */
            1:  i32 recorderId
            /** The channel settings to connect to a camera and set the profile and profile options */
            2:  ChannelSettings.ChannelSettings channelSettings
        ) throws(1: VisoTypes.SystemException sysEx, 2 : VisoTypes.AuthorizationException authEx, 3 : VisoTypes.ApplicationException appEx);

    
    /**
     *  Updates the given ptz settings entity in the database
     *  @result PtzSettings - The saved ptz settings entity from the database
     */
    PtzSettings.PtzSettings UpdatePtzSettings(
            /** The ptz settings entity with the new data to save/update in the database */
            1: PtzSettings.PtzSettings ptzSettings
        ) throws(1: VisoTypes.SystemException sysEx, 2 : VisoTypes.AuthorizationException authEx, 3 : VisoTypes.ApplicationException appEx);
    

    /**
     *  Gets the given ptz settings entity from the database by the given Id
     *  @result PtzSettings - The loaded ptz settings entity from the database
     */
    PtzSettings.PtzSettings GetPtzSettings(
            /** The Id of the ptz settings entity to load from the database */
            1: i32 ptzSettingsId
        ) throws(1: VisoTypes.SystemException sysEx, 2 : VisoTypes.AuthorizationException authEx, 3 : VisoTypes.ApplicationException appEx);


    /**
     *  Send a PTZ command to the recoder
     */
    void PTZCommand(
            /** The room to receive the PTZ command */
            1:  i32 roomId, 
            /** The PTZ control's Id */
            2:  i32 ptzSettingsId,
            /** The command data  */
            3:  VisoTypes.PtzCommandData command
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

    /**
     *  Enable continous camera discovering
     */
     bool EnableCameraDiscovering(
            /** The machine id */
            1: CommonTypes.GUID MachineId     
     ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

    /**
     *  Disable continous camera discovering
     */
     bool DisableCameraDiscovering(
            /** The machine id */
            1: CommonTypes.GUID MachineId     
     ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

    /**
     * Get the dicovered onvif devices
     *  @result GetDiscoveredOnvifDeviceListResult - The result of the operation
     */
    GetDiscoveredOnvifDeviceListResult GetDiscoveredOnvifDeviceList(
            /** The machine id */
            1: CommonTypes.GUID MachineId
    ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

	    /**
     *  Get an recent version of the room.
     *  @return Room - The room entity that belongs to the specified room Id.
     *  @exception InvalidIndex - when the roomId is invalid, not found in the services.
     */
    void AuditLogRoomViewed(
            /** The room id */
            1: i32 roomId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

	 /**
     *  Get the ptz settings id based on room and streamindex
     *  @return ptzSettingsId 
     */
    i32 GetPtzSettingsId(
        /** The room */
        1:  i32 roomId, 
        /** The index of the stream */
        2:  i32 streamIdx
    ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

}
