//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Common Contracts
// File       :   ProgramTypes.thrift
//----------------------------------------------------------------------------
// Revisions  :
//----------------------------------------------------------------------------

namespace * Noldus.NLinx.Contracts.Common

/** The status of a running N-Linx process. Each N-Linx process should send out a change in its status through the UpdateProcess function.*/
enum EProcessStatus
{
    /** The status of the process is unknown.*/
    UNDEFINED       = 0,

    /** No response is retrieved from the process. This normally indicates that the process is not running.*/
    NONRESPONSIVE   = 1,

    /** The process is up and running.*/
    RUNNING         = 2,

    /** When the process is closing it should send out this as the last status update to gracefully notify others that this process has ended normally.*/
    CLOSED          = 3,
}

/** The main role of an N-Linx process. Each N-Linx process should define its role in the N-Linx network. Based on this role, the recipient
*   of the message can take specific actions. For example, it can only show producers when it want to present a list of data providing devices.
*/
enum ERole
{
    /** The default role of a process. Use the default role when the role of your process is not described by one of the other roles, or it is not important
    *   that other N-Linx processes are aware of your presence. In general, expect that a process with this default role will be ignored by other processes.*/
    OTHER			= 0,

    /** A producer is an N-Linx process that produces data and makes it available within N-Linx. For example: a process that collects and sends out physiological data.*/
    PRODUCER		= 1,

    /** A processor is an N-Linx process that inputs data, does conversions on this data, and outputs the result.*/
    PROCESSOR		= 2,

    /** A consumer is an N-Linx process that inputs messages and presents this on an end point. For example, on a user interface, or for export to a file.*/
    CONSUMER        = 3,
}

/** The device type applies to N-Linx processes which are producers, see ERole. It is a property of the DeviceInfo, which provides information
*   on the (hardware) device that produces the data. The device type allows for grouping of similar devices.  
*/
enum EDeviceType
{
    /** The default type for a device. Use the default type when the device type of your producer process is not described by one of the other device types.*/
    OTHER			= 0,

    /** A device that measures eye positions and collects gaze data.*/
    EYETRACKER		= 1,

    /** A device that logs actions on for example a web page.*/
    STIMULUSLOGGER  = 2,

    /** A device that produces an audio-video stream of a human face.*/
    FACECAMERA      = 3,

    /** A device that produces electrocardiogram (ECG) signals.*/
    ECGRECORDER     = 4,

    /** A device that produces Photoplethysmography (PPG) signals.*/
    PPGRECORDER     = 5,

    /** A device that produces Electrodermal Activity (EDA) signals.*/
    EDARECORDER     = 6,

    /** A device that produces scoring events.*/
    EVENTSCORING    = 7,

    /** A device, often special software, that produces a video stream of screenshots, c.q. screen grabs, c.q. screen capture.*/
    SCREENSHARE     = 8,

    /** A device, that provides general video stream.*/
    ENVIRONMENTCAMERA    = 9
}

/** The type of a N-Linx process. Each N-Linx process should define its type in the N-Linx network for process discovery.
*/
enum EProcessType
{
    /** The default type for a device. Use the default type when the device type of your producer process is not described by one of the other device types.*/
    OTHER			= 0,

    /** A device that measures eye positions and collects gaze data.*/
    EYETRACKER		= 1,

    /** A device that logs actions on for example a web page.*/
    STIMULUSLOGGER  = 2,

    /** A device that produces an audio-video stream of a human face.*/
    FACECAMERA      = 3,

    /** A device that produces electrocardiogram (ECG) signals.*/
    ECGRECORDER     = 4,

    /** A device that produces Photoplethysmography (PPG) signals.*/
    PPGRECORDER     = 5,

    /** A device that produces Electrodermal Activity (EDA) signals.*/
    EDARECORDER     = 6,

    /** A device that produces scoring events.*/
    EVENTSCORING    = 7,

    /** A device, often special software, that produces a video stream of screenshots, c.q. screen grabs, c.q. screen capture.*/
    SCREENSHARE     = 8,

    /** Acquisition Service.*/
    ACQUISITIONSERVICE = 9,

    /** Facial Expression Service.*/
    FACIALEXPRESSIONSERVICE = 10,

    /** Resource Service.*/
    RESOURCESERVICE = 11,

    /** Video Web Service.*/
    VIDEOWEBSERVICE = 12,

    /** Timeseries Storage Service.*/
    TIMESERIESSTORAGESERVICE = 13,

    /** File Storage Service.*/
    FILESTORAGESERVICE = 14,

    /** Event Scoring Service.*/
    EVENTSCORINGSERVICE = 15,

    /** Web API Service.*/
    WEBAPISERVICE = 16,

    /** Export Service.*/
    EXPORTSERVICE = 17,

    /** Diagnostic Service.*/
    DIAGNOSTICSERVICE = 18,

    /** Physiology Service.*/
    PHYSIOLOGYSERVICE = 19,

    /** Session Monitoring Service.*/
    SESSIONMONITORINGSERVICE = 20
}

/** The host of a N-Linx process. Each N-Linx process should define if it belongs to the server or to the participant pc. The host type allows for grouping of the same hosts.
*/
enum EHostType
{
    /** A process that runs on the participant pc.*/
    PARTICIPANT = 0,

    /** A process that runs on the participant pc or on the server.*/
    ALL		= 1
}

/** The status of the start-stop recording cycle. Change the command status of your process by calling UpdateProcess, it will
 *  inform others in the network about the progress of your recording. The standard recording cycle is 
 *  
 *    IDLE --> [ READY --> STARTING --> STARTED --> STOPPING -->| --> STOPPED
 *                  ^                                           |
 *                  |-------------------------------------------|
 *  */
enum ERecordingStatus
{
  /** A default status when the status has not been set or when the status is unknown.*/
  UNDEFINED = 0,

  /** The process is running but it not set ready for remote control of the recording.*/
  IDLE      = 1,

  /** The process is set ready to allow for remote control of the recording start-stop.*/
  READY     = 2,
  
  /** A recording is in the process of starting. Often it takes some time to startup a recording, e.g. to initialize new 
   *  data files. Setting the status to STARTING immediately after receiving the start command will inform the controlling 
   *  application the start command was successfully received.*/
  STARTING  = 3,

  /** A recording has been successfully started and is running.*/
  STARTED   = 4,

  /** A recording is in the process of stopping. Often it takes some time to stop a recording, e.g. when saving the
   *  recorded data files. By setting the status to STOPPING immediately after receiving the stop command will inform 
   *  the controlling application that the stop command was successfully received.*/
  STOPPING  = 5,

  /** Some error has occurred. More information about this error can only be retrieved by the controlling program that controlled the start-stop.*/
  FAULT     = 6,

  /** A recording has been fully stopped, all data has been saved and the recording run is done.*/
  STOPPED   = 7
}
