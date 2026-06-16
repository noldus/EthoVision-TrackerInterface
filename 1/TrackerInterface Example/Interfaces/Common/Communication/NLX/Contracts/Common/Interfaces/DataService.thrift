//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Common Contracts
// File       :   DataService.thrift
//----------------------------------------------------------------------------
// Revisions  :
//----------------------------------------------------------------------------
include "..\\Types\\CommonTypes.thrift"
include "CommonService.thrift"

include "..\\Entities\\Process.thrift"
include "..\\Entities\\Event.thrift"
include "..\\Entities\\Sample.thrift"
include "..\\Entities\\Variable.thrift"

namespace * Noldus.NLinx.Contracts.Common

// Settings for this service

/** Version of the interface.*/
const i32         interfaceVersion          = 1;
/** The name of the RabbitMQ exchange on which the communication of this service runs.*/
const string      exchange                  = "Noldus.NLinx.Common.DataService"
/** The first routing key that all running processes should be listening on.*/
const string      mainRoutingKey            = "Listing"
/** This service runs on a topic exchange that supports multiple routing keys. For this service two routing keys are used:
 *  1. The mainRoutingKey as defined above.
 *  2. The GUID of a process when you want to target a specific process, e.g. used in the StartRecording method.
*/
const CommonTypes.ExchangeType exchangeType = CommonTypes.ExchangeType.TOPIC


/** 
* The data service is used for transferring simple event data and continuous data.
* It can be used in combination with the extended data service.
* The messages are sent to a specific process, ususally the master (see Process service)
*/
service DataService extends CommonService.CommonService
{
    /** Send an event.*/
        oneway void			    AddEvent                (   /** The identifier of the process that sends out the data.*/
                                                            1: Process.Process sender,

                                                            /** A simple event to be added.*/
                                                            2:Event.SimpleEvent nxevent);

    /** Send several data samples of the same timestamp.*/
    oneway void			    AddContinuousDataSamples(   /** The identifier of the process that sends out the data.*/
                                                        1: Process.Process sender,

                                                        /** The data and time of the samples in Unix time.*/
                                                        2: CommonTypes.UnixTime sampleTime, 
                                                        
                                                        /** A set of continuous data samples recorded at the same sample time.*/
                                                        3: list<Sample.Sample> sampleValues);

   
    /** Send several data samples of the same stream.*/
    oneway void			    AddContinuousDataSampleList(/** The identifier of the process that sends out the data.*/
                                                        1: Process.Process sender,

                                                        /** The name/identifier of the sample channel.*/
                                                        2: string streamName,
                                                        
                                                        /** a list of samples as time-value pair */
                                                        3: list<Sample.SampleWithTime> sampleValues);


    /** Send one data sample.*/
    oneway void			    AddContinuousDataSample (   /** The identifier of the process that sends out the data.*/
                                                        1: Process.Process sender,
                                                        
                                                        /** The data and time of the samples in Unix time.*/
                                                        2: CommonTypes.UnixTime sampleTime, 
                                                        
                                                        /** A sample defined as name-value pair. */
                                                        3: Sample.Sample sampleValue);

                                                          
    /** Send a user defined variable with its value*/
    oneway void			    AddUserVariableValue    (   /** The identifier of the process that sends out the data.*/   
                                                        1: Process.Process sender, 

                                                        /* The variable value to be added*/
                                                        2: Variable.VarValue variableValue);

    /** Add an event data stream (event log).*/
    oneway void			    AddEventDataStream      (/** The identifier of the process that sends out the data.*/
                                                     1: Process.Process sender, 

                                                     /** The EventStream */
                                                     2:Event.EventStream stream);

    /** Add a continuous data stream (external data).*/
    oneway void			    AddContinuousDataStream (/** The identifier of the process that sends out the data.*/
                                                     1: Process.Process sender, 

                                                     /** The sample stream */
                                                     2:Sample.SampleStream stream);

    /** Add a video file at the end of recording.*/
    oneway void			    AddVideoFile (/** The identifier of the process that sends out the data.*/
                                          1: Process.Process sender, 

                                          /** video recording start time*/
                                          2:CommonTypes.IsoDateTime videoStartTime,

                                          /** video name with full path to shared directory*/
                                          3:string videoName);


}

