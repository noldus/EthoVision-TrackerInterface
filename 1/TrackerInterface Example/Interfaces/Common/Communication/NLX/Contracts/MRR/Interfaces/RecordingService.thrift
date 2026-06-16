//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Viso Contracts
// File       :   RecordingService.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 18-02-2015 Jeroen Diederix           - Original version
//----------------------------------------------------------------------------
include "..\\Entities\\Stream.thrift"
include "..\\Entities\\ChannelSettings.thrift"
include "..\\Entities\\AudioDevice.thrift"
include "..\\Entities\\OnvifDevice.thrift"
include "..\\Entities\\VideoDevice.thrift"
include "..\\Types\\VisoTypes.thrift"
include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "..\\..\\Common\\Interfaces\\CommonService.thrift"

namespace csharp Noldus.NLinx.Contracts.Viso.Services
namespace * Noldus.NLinx.Contracts.Viso

// Settings for this service
const i32         interfaceVersion  = 2;
const string      exchange          = "Noldus.NLinx.Viso.RecordingService"
const string      routingKey        = "00000000-0000-0000-0000-000000000000"


/**
 *   Small return enum for TryStartStreaming
 */
enum EStartStreamingResult
{
    /** Unknown result */
    Unknown,

    /** Succesfully started */
    Success,

    /** Start failed */
    Failed,

    /** Start partially succesfull (some streams failed but streaming is ongoing) */
    PartialSuccess
}


/**
 *  Small return enum for TryStartStreaming
 */
struct StartStreamingResult
{
    /** The start result */
    1:  optional EStartStreamingResult result,

    /** The video streams. Contains all video streams, in case of failure empty url and info about the failure (see Stream) */
    2:  optional list<Stream.Stream> streams
}


/**
 *  Small return enum for TryStartRecording
 */
enum ESStartRecordingResult
{
    /** Unknown result */
    Unknown,

    /** Succesfully started */
    Success,

    /** Start failed */
    Failed,

    /** Start failed, not enough disk space, or write location was unreachable */
    NotEnoughFreeSpace
}


/**
 *  Small return class for TryStartRecording
 */
struct StartRecordingResult
{
    /** The start result */
    1:  optional ESStartRecordingResult result,

    /** A list files */
    2:  optional list<string> files,

    /** The local start date and time. */
    3: optional CommonTypes.IsoDateTime startTime,
}


/**
*   Small return enum for TryStopRecording
*/
enum EStopRecordingResult
{
    /** Unknown result */
    Unknown,

    /** Succesfully stopped */
    Success,

    /** stop failed */
    Failed
}


/**
 *  Small return class for TryStopRecording
 */
struct StopRecordingResult
{
    /** The stop result */
    1:  optional EStopRecordingResult result,
    
    /** The local stop date and time. */
    2:  optional CommonTypes.IsoDateTime stopTime,

    /** The duration of the longest video file in this recording. */
    3: optional i64 longestVideoDuration
}


/**
 *  Smal return enum for TryGetDeviceOptions
 */
enum EGetDeviceOptionsResult
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
struct GetDeviceOptionsResult
{
    /** The result */
    1: optional EGetDeviceOptionsResult result,

    /** The options and values that can be changed for this device */
    2: optional VisoTypes.VideoDeviceOptions videoDeviceOptions,

    /** Current Device settings */
    3 : optional VideoDevice.VideoDevice currentSettings,

    /** True if PTZ is supported, false otherwise */
    4 : optional bool isPtzSupported,

    /** True if Audio is supported, false otherwise */
    5 : optional bool isAudioSupported
}


/**
 *  Small return enum for TrySetDeviceOptions
 */
enum ESetDeviceOptionsResult
{
    /** Sucessfully set the new settings */
    Success = 0,

    /** unknown error */
    Failed = 1,

    /** The username/password was wrong, or check the webservice settings in the camera */
    CannotConnect = 2,

    /** No ONVIF capable device was found */
    NotOnvifCapable = 3,

    /** The settings are invalid */
    InvalidSettings = 4,
}


/**
 *  The result object for TrySetDeviceOptions
 */
struct SetDeviceOptionsResult
{
    /** The result */
    1: optional ESetDeviceOptionsResult result,

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
 *  The recorder service is responsable for recordings
 */
service RecordingService extends CommonService.CommonService
{

    /**
     *  Sets the a recording service or UMR device in streaming mode.
     *  @result StartStreamingResult - 
     */
    StartStreamingResult TryStartStreaming(
            /** Force a restart of the recorder graph */
            1:  bool forceRefresh
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Turns off streaming of a Viso recording service.
     */
    void StopStreaming() throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Sets a Viso Recording Service (Recording Device) in recording mode.
     *  @result StartRecordingResult - true if successfully started, false in case of any kind of error (exact error unknown).
     */
    StartRecordingResult TryStartRecording() throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Stops a recording of a Viso Recording Service (Recorder Device).
     *  @result StopRecordingResult - true if the recording was stopped, false if the recording was not running.
     */
    StopRecordingResult TryStopRecording() throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Get elapsed recorded time, if recording is started, otherwise it returns negative
     *  @result long - elapsed recoded time in micro seconds
     */
    i64 GetTimeInfo() throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

    /**
     * Returns the current position of the PTZ.
     */
    CommonTypes.Point3D GetPTZStatus(
            /** PTZ control Id.*/
            1: i32 ptzSettingsId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

    /**
     *  Send a PTZ command to the recoder
     */
    void PTZCommand(
            /** The PTZ control's Id */
            1: i32 ptzSettingsId,
            /** The command data  */
            2: VisoTypes.PtzCommandData command
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Get the available audio sources
     */
    list<AudioDevice.AudioDevice> TryGetAudioDevices() throws(1: VisoTypes.SystemException sysEx, 2 : VisoTypes.AuthorizationException authEx, 3 : VisoTypes.ApplicationException appEx);
    

    /**
     *  Get the options and status of a given channel/device
     *  @result GetDeviceOptionsResult - An extensive class with all device options
     */
    GetDeviceOptionsResult TryGetDeviceOptions(
            /** The channel settings to connect to a camera and get the profile and profile options */
            1:  ChannelSettings.ChannelSettings channelSettings
        ) throws(1: VisoTypes.SystemException sysEx, 2 : VisoTypes.AuthorizationException authEx, 3 : VisoTypes.ApplicationException appEx);


    /**
     *  Set the device options of the given channel/device
     *  @result SetDeviceOptionsResult - The result of the operation
     */
    SetDeviceOptionsResult TrySetDeviceOptions(
            /** The channel settings to connect to a camera and set the profile and profile options */
            1:  ChannelSettings.ChannelSettings channelSettings
        ) throws(1: VisoTypes.SystemException sysEx, 2 : VisoTypes.AuthorizationException authEx, 3 : VisoTypes.ApplicationException appEx);


    /**
     *  Checks if recording is ongoing
     *  @result bool - Returns true if recording is ongoing, false otherwise
     */
    bool CheckIsRecordingOngoing() throws(1: VisoTypes.SystemException sysEx, 2 : VisoTypes.AuthorizationException authEx, 3 : VisoTypes.ApplicationException appEx);

     /**
     *  Try to rename a recorded video file on the recorder. (If it's in the current shared folder).
     *  @result bool - true if successful.
     */
    bool UpdateFileName(
     1:  string oldFullPath,
     2:  string newFullPath) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

    /**
     *  Enable continous camera discovering
     */
     void EnableCameraDiscovering() throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

    /**
     *  Disable continous camera discovering
     */
     void DisableCameraDiscovering() throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

    /**
     *  Get the dicovered onvif devices
     *  @result GetDiscoveredOnvifDeviceListResult - The result of the operation
     */
    GetDiscoveredOnvifDeviceListResult GetDiscoveredOnvifDeviceList() throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);
}
