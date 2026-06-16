//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Common Contracts
// File       :   EyeTrackingService.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 11-07-2017 Csaba Balazs   - Original version
//----------------------------------------------------------------------------

include "..\\Types\\CommonTypes.thrift"
include "CommonService.thrift"

include "..\\Entities\\EyeData.thrift"
include "..\\Entities\\GazeData.thrift"
include "..\\Entities\\GazePoint.thrift"
include "..\\Entities\\Process.thrift"

namespace * Noldus.NLinx.Contracts.Common

// Settings for this service

/** Version of the interface.*/
const i32         interfaceVersion          = 1;
/** The name of the RabbitMQ exchange on which the communication of this service runs.*/
const string      exchange                  = "Noldus.NLinx.Common.EyeTrackingService"
/** The first routing key that all running processes should be listening on.*/
const string      mainRoutingKey            = "Listing"
/** This service runs on a topic exchange that supports multiple routing keys. For this service two routing keys are used:
 *  1. The mainRoutingKey as defined above.
 *  2. The GUID of a process when you want to target a specific process, e.g. used in the StartRecording method.
*/
const CommonTypes.ExchangeType exchangeType = CommonTypes.ExchangeType.TOPIC

/** 
* DEPRECATED: use the new EyeTrackingStreamingService
* The EyeTracking service is used for transferring gaze data.
* The messages are sent to a specific process, ususally the master
*/
service EyeTrackingServiceDeprecated extends CommonService.CommonService
{
    /** Send a list of gaze data.*/
    oneway void			    AddGazeData(    /** The identifier of the process that sends out the data.*/
                                            1: Process.Process sender,

                                            /** A list of gaze data to be added.*/
                                            2: list<GazeData.GazeData> gazeData);
}
