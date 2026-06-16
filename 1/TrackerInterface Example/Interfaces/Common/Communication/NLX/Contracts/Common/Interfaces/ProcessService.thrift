//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Common Contracts
// File       :   ProcessService.thrift
//----------------------------------------------------------------------------
// Revisions  :
//----------------------------------------------------------------------------

include "..\\Types\\CommonTypes.thrift"
include "..\\Entities\\Program.thrift"
include "..\\Entities\\Process.thrift"
include "..\\Entities\\Recording.thrift"
include "..\\Entities\\Configuration.thrift"
include "..\\Entities\\MasterSlave.thrift"
include "CommonService.thrift"

namespace * Noldus.NLinx.Contracts.Common

// Settings for this service

/** Version of the interface.*/
const i32         interfaceVersion          = 1;
/** The name of the RabbitMQ exchange on which the communication of this service runs.*/
const string      exchange                  = "Noldus.NLinx.Common.ProcessService"
/** The first routing key that all running processes should be listening on.*/
const string      mainRoutingKey            = "All"
/** This service runs on a topic exchange that supports multiple routing keys. For this service two routing keys are used:
 *  1. The mainRoutingKey as defined above.
 *  2. The GUID of a process when you want to target a specific process, e.g. used in the StartRecording method.
*/
const CommonTypes.ExchangeType exchangeType = CommonTypes.ExchangeType.TOPIC

 
/**
 *  Return information about StartRecording.
 */
struct StartRecordingResult
{
    /** The local start date and time when the process was actually started.*/
    1: optional CommonTypes.IsoDateTime startTime,

    /** Custom settings which can be defined as [key, value] pairs in a hierarchical property tree. These settings are application specific and not documented in a general way.*/
    2: optional CommonTypes.PropertyTree customProperties,
}


/**
 *  Return information about StopRecording.
 */
struct StopRecordingResult
{
    /** The local start date and time when the process was actually stopped.*/
    1: optional CommonTypes.IsoDateTime stopTime,

    /** Custom settings which can be defined as [key, value] pairs in a hierarchical property tree. These settings are application specific and not documented in a general way.*/
    2: optional CommonTypes.PropertyTree customProperties,
}


/** 
*   The process service is responsible for querying the list of all running processes in
*   the N-Linx connected network and for starting and stopping of a recording in a process. Implement both 
*   requestor and replier sides of this service because you need to listen to update changes from processes
*   and send yourself requests.
*/
service ProcessService extends CommonService.CommonService
{
    /** Send a request to all running processes to return information about themselves. This is a oneway and fast method. The information is 
    *  returned in the UpdateProcess method.*/
    oneway void			    RequestProcessListing   (   /** The identifier of the process that sends out the request.*/
                                                        1: Process.Process sender
                                                    );
    
    /** Listen to changes in other processes or send back a reply about your own process when you are called by RequestProcessListing.*/
    oneway void 		    UpdateProcess           (   /** Information about a process that was newly added or changed.*/
                                                        1: Process.Process updatedProcess
                                                    ); 

    /** Set the settings for making new recordings. What can be set as settings is defined by the process itself and are retrieved
     *  from the OnUpdateProcess. Use the Configuration of the process, modify it, and pass the modified configuration as argument of this method.
    */
    void                    SetConfiguration        (   /** The process to change the control settings.*/
                                                        1: Process.Process sender,
                                                        
                                                        /** The configuration settings to be set. */
                                                        2: Configuration.Configuration updatedConfiguration
                                                    ) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);

    /** Define who is master and who is slave. At init, start and stop recording you should check if you are controlled by the sender process.
     * If not you should throw an application exception.
     * */
    void                    SetMasterSlave          (   /** The process to change the control settings.*/
                                                        1: Process.Process sender,

                                                        /** The master-slave settings to be set. */
                                                        2: MasterSlave.MasterSlave updatedMasterSlave
                                                    ) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);

    /** Optional command to initialize the system before starting a new recording.
    *   Precondition(s): 1. current command status of the process = READY
    */
    void                    InitRecording           (   /** The process to initialize for starting a new recording. The process contains the selected configuration for the recording.*/
                                                        1: Process.Process sender
                                                    ) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);

    /**  Start the recording in a process.
    *  Precondition(s): 1. the processId is set as the SetNextRoutingKey on the requestor channel.
    *                   2. current command status of the process = INIT.
    */
    StartRecordingResult    StartRecording          (   /** The process to start a new recording.*/
                                                        1: Process.Process sender,
                                                    
                                                        /** The local date and time when the master started the recording. If a chained master-slave setup has been defined it will be
                                                         *  the start time of the primary master.*/
                                                        2: CommonTypes.IsoDateTime isoStartTime
                                                    ) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);

    /**  Stop the recording in a process. 
    *  Precondition(s): 1. processId is set as the SetNextRoutingKey on the requestor channel.
    *                   2. current command status of the process = STARTED.
    */
    StopRecordingResult     StopRecording           (   /** The process to stop a recording.*/
                                                        1: Process.Process sender,

                                                        /** The local date and time when the master, or principle master, stopped the recording.*/
                                                        2: CommonTypes.IsoDateTime isoStopTime
                                                    ) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);

    /** Use this command to exit a running process.
    */
    void                    Exit                    (   /** The process to exit.*/
                                                        1: Process.Process sender
                                                    ) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);

    /** Set the log level that the process uses for logging.*/
    void                    SetLogLevel             (   /** The process that issued this call to change the log level.*/
                                                        1: Process.Process sender,
                                                        
                                                        /** The new log level for the process.*/
                                                        2: CommonTypes.ELogLevel logLevel);
}
