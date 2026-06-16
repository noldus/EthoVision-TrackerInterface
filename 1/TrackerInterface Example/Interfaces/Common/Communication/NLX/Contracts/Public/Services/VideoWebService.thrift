//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   VideoWebService.thrift
//----------------------------------------------------------------------------
// Revisions  :
//----------------------------------------------------------------------------

include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "..\\..\\Common\\Types\\ProgramTypes.thrift"
include "..\\..\\Common\\Interfaces\\CommonService.thrift"
include "..\\Entities\\WebRtcSource.thrift"
include "..\\Entities\\Device.thrift"

namespace * Noldus.NLinx.Contracts.Public.Services

// Settings for this service

/** Version of the interface.*/
const i32         interfaceVersion          = 1;
/** The name of the RabbitMQ exchange on which the communication of this service runs.*/
const string      exchange                  = "Noldus.NLinx.Public.VideoWebService"
/** This service runs on a direct exchange using the process ID as routing key. */
const CommonTypes.ExchangeType exchangeType = CommonTypes.ExchangeType.DIRECT
/** This service runs on a Direct exchange that supports one routing key. */
const string      routingKey                = "b4d5e258-2066-410c-92e2-8a90eb5b3b0c"

/** 
* The video web service owns videos recorded through webRtc.
*/
service VideoWebService extends CommonService.CommonService
{
    /**
    *  Initializes a WebRtc video recording, using the video web service.
    */
    void InitWebRtc(
            /** A list of WebRtc video sources, information about the video sources that need to be recorded.*/
            1:  list<WebRtcSource.WebRtcSource> webRtcVideoSources          
        ) throws(1: CommonTypes.SystemException appEx, 2: CommonTypes.ApplicationException sysEx);

    /**
    *  Disconnects from an initialized webRtc session.
    */
    void DisconnectWebRtc(
                          /** ALL devices selected in a recording on a specific participant PC */
                          1:  list<Device.Device> selectedDevices
        ) throws(1: CommonTypes.SystemException appEx, 2: CommonTypes.ApplicationException sysEx);

    /**
    * Update the existing webRtcClients for a recording on a specific participant PC. Update is only possible before recording.
    * @return True if successful.
    */
    bool UpdateWebRtcClients( /** ALL devices selected in a recording on a specific participant PC */
                              1: list<Device.Device> selectedDevices,
                              /** Project in which the recording takes place */
                              2: CommonTypes.GUID projectId
                            ) throws(1: CommonTypes.SystemException sysEx, 2: CommonTypes.ApplicationException appEx);

    /**
    * Start recording an already initiated WebRtc stream. 
    * @return The ids of the videos which will be recorded.
    */
    list<CommonTypes.GUID>  StartWebRtcRecording( /** ALL devices selected in a recording on a specific participant PC */
                                                  1: list<Device.Device> selectedDevices
                                                ) throws(1: CommonTypes.SystemException sysEx, 2: CommonTypes.ApplicationException appEx);

    /**
    * Stop a running WebRtc recording.
    * @return The ids of the videos which have been recorded.
    */
    list<CommonTypes.GUID>  StopWebRtcRecording( /** ALL devices selected in a recording on a specific participant PC */
                                                  1: list<Device.Device> selectedDevices
                                                ) throws(1: CommonTypes.SystemException sysEx, 2: CommonTypes.ApplicationException appEx);

    /**
    * This function is called when a WebRtc message arrives to Video Web Service from SignalR Hub that is used by the frontend to communicate.
    */
    oneway void ReceiveWebRtcMessage( /** JSON string message coming from SignalR Hub */
                                      1: string message);

    /**
    * Check if a specific instance of VWS has already a NLinx process and a webRtc connection for all of the specified webRtcVideoSources.
    */
    bool AllWebRtcSourcesAlreadyExist(
                                        /** webRtcSources to check for (video sources ONLY!)*/
                                        1: list<WebRtcSource.WebRtcSource> webRtcVideoSources     
                                      ) throws(1: CommonTypes.SystemException sysEx, 2: CommonTypes.ApplicationException appEx);

    /**
    * Check if the target VWS process is available to accept new WebRtcSources.
    */
    bool CanAcceptNewWebRtcSources() throws(1: CommonTypes.SystemException sysEx, 2: CommonTypes.ApplicationException appEx);
}
