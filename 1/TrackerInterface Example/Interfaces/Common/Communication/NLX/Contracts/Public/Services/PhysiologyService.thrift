//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   PhysiologyService.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 07-01-2021 Tijmen van Voorthuijsen - Original version
//----------------------------------------------------------------------------

include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "..\\..\\Common\\Types\\PhysiologyTypes.thrift"
include "..\\..\\Common\\Interfaces\\CommonService.thrift"
include "..\\..\\Common\\Entities\\Process.thrift"
include "..\\..\\Common\\Entities\\StreamingTicket.thrift"
include "..\\..\\Common\\Entities\\StreamingOptions.thrift"
include "..\\..\\Common\\Entities\\PhysiologyStorageSettings.thrift"
include "..\\Entities\\StreamingQuery.thrift"

namespace * Noldus.NLinx.Contracts.Public

/** Version of the interface. This version is an old remnant and actually not used.*/
const i32         interfaceVersion          = 2;
/** The name of the RabbitMQ exchange on which the communication of this service runs.*/
const string      exchange                  = "Noldus.NLinx.Public.PhysiologyService"
/** This service runs on a direct exchange.*/
const CommonTypes.ExchangeType exchangeType = CommonTypes.ExchangeType.DIRECT
/** Use this routing key to direct messages to this service.*/
const string      routingKey                = "501aec5e-68c4-4fa0-940b-5178ef8cfa7a"

/** 
* The command interface to operate the physiology service. 
*/
service PhysiologyService extends CommonService.CommonService
{
    /** Turns on or off the saving of data that is currently being processed in the physiology service. The storage settings define what type of data should be saved.
    *   Application exception: when the storage settings specify a collector ID which is not being processed, an exception will be thrown.*/
    void                            EnableSaving                (/** Settings that specify which data to store and whether to turn on storing od turn it off.*/
                                                                 1: PhysiologyStorageSettings.PhysiologyStorageSettings storageSettings) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);

    /** Request the physiology service to stream out physiology data on demand. The requested stream of data will be received through the PhysiologyStreamingService and send specifically
    *   to the requestor only, based on the routing key. This method can be used to request restreaming for different types of physiological data (ERestreamingDataType in PhysiologyTypes.thrift).
    */
    StreamingTicket.StreamingTicket RequestRestreaming	        (/** The process that submits the request and wants to receive the physiology data via the streaming service. Put in here
                                                                 /*  the N-Linx my process */
                                                                 1: Process.Process sender,
                                                                 
                                                                 /** Specifies what type of data, in terms of storage settings, the physiology service should restream.*/
                                                                 2: StreamingQuery.StreamingQuery streamingQuery,

                                                                 /** Defines in what way the data should be restreamed and also the receiver part of the restreaming routing key.*/
                                                                 3: StreamingOptions.StreamingOptions streamingOptions
                                                                 ) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);

    /** Cancel a submitted restreaming request. 
    /*  @exceptions No specifics
    */ 
    void							CancelRestreaming          (/** The N-Linx process that wants to cancel the restreaming.*/
                                                                1: Process.Process sender,
                                                                 
                                                                /** The streaming ticket that was received in the call to RequestRestreaming.*/	
                                                                2: StreamingTicket.StreamingTicket token) throws(1: CommonTypes.ApplicationException appEx, 2: CommonTypes.SystemException sysEx);


    /** Resets all processing information for one data stream processor. Applies to for example the processing of ECG to heart data or the processing of PPG to heart data.
    *   A processor may keep buffered information of preceding data in order to calculate the next processed sample. By calling ResetProcessing these buffers and processing
    *   processing information is cleared.
    *   @return void - no return information
    *   @exceptions Application exception when no processor is found for the specified collectorId.
    */ 
    void						    ResetProcessing             (/** The N-Linx process that wants to reset the processing. This parameter is not functional and can be used for logging purposes.*/
                                                                  1: Process.Process sender,
                                                                 
                                                                 /** The N-Linx process ID of the collector process for which reset should be done.*/	
                                                                  2: CommonTypes.GUID collectorProcessId) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);


    /** Deletes all the physiology data that was recorded for a specified device and tagged data ranges.*/
    void                            DeleteDeviceData            (/** Settings that specify which physiology data be deleted.*/
                                                                  1: list<PhysiologyTypes.DeleteQuery> deleteQuery) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);                                 

}
