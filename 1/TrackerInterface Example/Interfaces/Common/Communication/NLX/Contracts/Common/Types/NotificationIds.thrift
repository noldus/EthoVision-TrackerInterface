//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   NotificationIds.thrift
//----------------------------------------------------------------------------
// Revisions  :
//----------------------------------------------------------------------------


namespace * Noldus.NLinx.Contracts.Public

/**
 *  All Ids for sending event notifications.
 *  NOTE: Thrift enumerator constants must be in the range of positive 32-bit integers. Each block of IDs below contains 1,000,000 values,
 *        so with a 32 bit integer it can hold a maximum of 4,294 number of blocks.
 */
enum ENotificationId
{
    /** A default if all other do not apply.*/
    Undefined                               = 0,


    /** 
    *  Session
    *  Range 1,000,000 - 1,999,999
    *  
    */

    /** Marks the begin of the session range. */
    SessionBegin                            = 1000000,

    /** A new session is created. */
    NewSession                              = 1000001,

    /** A new session recording has started. Probably not used anymore.   Updated field(s): newTime. */
    SessionRecordingStarted                 = 1000002,

    /** A new session recording has stopped. Probably not used anymore.   Updated field(s): newTime. */
    SessionRecordingStopped                 = 1000003,

    /** A session is changed.     NewName = sessionName */
    SessionChanged                          = 1000004,

    /** A session is deleted.     EntityId = sessionId */
    SessionDeleted                          = 1000005,

    /** A finished session name is changed.    EntityId = sessionId */
    FinishedSessionNameChanged              = 1000006,

    /** A existing session name is changed.    EntityId = sessionId */
    SessionRenamed                          = 1000007,

    /** Marks the end of the session range. */
    SessionEnd                              = 1999999,


    /** 
    *  Eye tracking
    *  Range 2,000,000 - 2,999,999
    *  
    */
    
    /** Marks the begin of the eye tracking range. */
    EyeTrackingBegin                        = 2000000,

    /** The calibration of an eye tracker has started.   EntityId = processId */
    CalibrationStarted                      = 2000001,

    /** The calibration of an eye tracker is finished started.   EntityId = processId */
    CalibrationStopped                      = 2000002,

    /** The eye tracker plugin has been set. Probably not used anymore.   Updated field(s): deviceId.*/
    EyeTrackerSet                           = 2000003,

    /** The trackbox process of an eye tracker has started.    EntityId = processId */
    TrackBoxStarted                         = 2000004,
    
    /** The trackbox process of an eye tracker is finished started.    EntityId = processId */
    TrackBoxStopped                         = 2000005,

    /** The calibration validation of an eye tracker has started.    EntityId = processId */
    CalibrationValidationStarted            = 2000006,

    /** The calibration validation of an eye tracker is finished started.    EntityId = processId */
    CalibrationValidationStopped            = 2000007,

    /** Marks the end of the eye tracking range. */
    EyeTrackingEnd                          = 2999999,

    /** 
    *  Security
    *  Range 3,000,000 - 3,999,999
    *  
    */

    /** Marks the begin of the security range. */
    SecurityBegin                           = 3000000,

    /** No license has been found while the application requires a valid license. */
    NoLicense                               = 3000001,

    /** Marks the end of the security range. */
    SecurityEnd                             = 3999999,

    /** 
    *  Project
    *  Range 4,000,000 - 4,999,999
    *  
    */

    /** Marks the begin of the project range. */
    ProjectBegin                            = 4000000,

    /** A new project is created. */
    NewProject                              = 4000001,

    /** A project is changed. Session added.    EntityId = sessionId */
    ProjectAddSession                       = 4000002,

    /** A project is changed. Session deleted.  EntityId = sessionId */
    ProjectDeleteSession                    = 4000003,

    /** The name of a project is changed.       EntityId = projectId */
    ProjectNameChanged                      = 4000004,

    /** The LastModified dateTime of a project is changed.      EntityId = projectId */
    ProjectLastModifiedDateTimeChanged      = 4000005,

    /** Marks the end of the project range. */
    ProjectEnd                              = 4999999


    /** 
    *  Video
    *  Range 5,000,000 - 5,999,999
    *  
    */

    /** Marks the begin of the video range. */
    VideoBegin                              = 5000000,

    /** The video recording engine sends this message when the WebRTC sources are ready to record. */
    VideoSourceInitialized                  = 5000001,

    /** The video recording engine sends this message when the recording is started successfully. */
    VideoSourceRecordingStarted             = 5000002,

    /** The video recording engine sends this message when the recording is stopped successfully. */
    VideoSourceRecordingStopped             = 5000003,

    /** The video recording engine sends this message when the connection is lost with a WebRTC source. */
    VideoSourceConnectionLost               = 5000004,

    /** The video recording engine sends this message when the connection is closed. */
    VideoSourceConnectionClosed             = 5000005,

    /** The video recording engine sends this message when there is a change in the video frame type. */
    VideoSourceVideoFrameTypeChanged        = 5000006,

    /** The video recording engine sends this message when there is a change in the audio frame type. */
    VideoSourceAudioFrameTypeChanged        = 5000007,

    /** The videosource error happened, state of videosource is unknown, best to restart. */
    VideoSourceUnexpectedError              = 5000008,

    /** The video recording engine sends this message when there is a WebRTC message to be sent toward frontend. */
    VideoSourceWebRtcMessage                = 5000009,

    /** The video recording engine sends this message after recording is finished to update the video storage with the recorded file. */
    VideoSourceUpdateVideoInStorage         = 5000010,

    /** VideoWebService send this message to a concrete signalR connection */
    VideoSourceWebRtcMessageTo              = 5000011,

    /** Marks the end of the video range. */
    VideoEnd                                = 5999999,

    /** 
    *  Facial Expressions
    *  Range 6,000,000 - 6,999,999
    *  
    */

    /** Marks the begin of the facial expressions range. */
    FacialExpressionsBegin                  = 6000000,

    /** An image processor has been started for a newly detected N-Linx image source.    EntityId = ID of the image source */
    FacialExpressionsImageProcessorStarted  = 6000001,

    /** Marks the end of the facial expressions range. */
    FacialExpressionsEnd                    = 6999999,


    /** 
    *  Physiology
    *  Range 7,000,000 - 7,999,999
    *  
    */

    /** Marks the begin of the physiology range. */
    PhysiologyBegin                         = 7000000,

    /** An ECG processor has been started for a newly detected N-Linx ECG collector source.   EntityId = ID of the collector source */
    PhysiologyEcgProcessorStarted           = 7000001,

    /** An PPG processor has been started for a newly detected N-Linx PPG collector source.   EntityId = ID of the collector source */
    PhysiologyPpgProcessorStarted           = 7000002,

    /** An EDA processor has been started for a newly detected N-Linx EDA collector source.   EntityId = ID of the collector source */
    PhysiologyEdaProcessorStarted           = 7000003,

    /** Marks the end of the physiology range. */
    PhysiologyEnd                           = 7999999,


    /** 
    *  Resource
    *  Range 8,000,000 - 8,999,999
    *  
    */

    /** Marks the begin of the physiology range. */
    ResourceBegin                           = 8000000,

    /** A newly discovered device has been added to the resource service.    entityId = deviceId. */
    DeviceAdded                             = 8000001,

    /** A device has been updated.    entityId = deviceId. */
    DeviceUpdated                           = 8000002,

    /** A location has been locked.    entityId = locationId. */    
    LocationLocked                          = 8000003,

    /** A location has been unlocked.    entityId = locationId. */    
    LocationUnlocked                        = 8000004,

    /** Marks the end of the resource range. */
    ResourceEnd                             = 8999999,

    /** 
    *  Export
    *  Range 9,000,000 - 9,999,999
    *  
    */
    /** Marks the begin of the Export range. */
    ExportBegin                             = 9000000,

    /** A session export finished for a given user.    EntityId = sessionId    NewName = userName */
    ExportFinished                          = 9000001, 

    /** Marks the end of the Export range. */
    ExportEnd                               = 9999999,

    /** 
    *  Acquisition
    *  Range 10,000,000 - 10,999,999
    *  
    */

    /** Marks the begin of the Acquisition range. */
    AcquisitionBegin                        = 10000000,

    /** An acquisition run is initialized for starting a new recording.    EntityId = the acquisition run ID */
    AcquisitionRunInitialized               = 10000001,

    /** An acquisition run has started.    EntityId = the acquisition run ID */
    AcquisitionRunStarted                   = 10000002,

    /** An acquisition run is in the process of stopping.    EntityId = the acquisition run ID */
    AcquisitionRunStopping                  = 10000003,

    /** An acquisition run has stopped.    EntityId = the acquisition run ID */
    AcquisitionRunStopped                   = 10000004,

    /** Marks the end of the Acquisition range. */
    AcquisitionEnd                          = 10999999


    /** 
    *  Generic
    *  Range 11,000,000 - 11,999,999
    *  
    */

    /** Marks the begin of the Generic range. */
    GenericBegin                            = 11000000,

    /** An acquisition run is initialized for starting a new recording.    EntityId = the acquisition run ID */
    GenericRunInitialized                   = 11000001,

    /** An acquisition run has started.    EntityId = the acquisition run ID;     newTime = the start time of the acquisition run */
    GenericRunStarted                       = 11000002,

    /** An acquisition run is in the process of stopping.    EntityId = the acquisition run ID */
    GenericRunStopping                      = 11000003,

    /** An acquisition run has stopped.    EntityId = the acquisition run ID;     newTime = the stop time of the acquisition run */
    GenericRunStopped                       = 11000004,

    /** Marks the end of the Generic range. */
    GenericEnd                              = 11999999


    /** 
    *  Event scoring
    *  Range 12,000,000 - 12,999,999
    *  
    */

    /** Marks the begin of the Event range. */
    EventBegin                              = 12000000,

    /** An event has been scored and added to the event stream.    EntityId = eventStreamId */
    EventAdded                              = 12000001,

    /** An event has been removed from the event stream.    EntityId = eventStreamId */
    EventRemoved                            = 12000002

    /** Marks the end of the Event range. */
    EventEnd                                = 12999999

}
