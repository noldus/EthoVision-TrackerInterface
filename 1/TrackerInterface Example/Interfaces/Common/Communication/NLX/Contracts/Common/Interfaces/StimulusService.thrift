//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   StreamingService.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 14-03-2019 Tijmen van Voorthuijsen   - Original version
//----------------------------------------------------------------------------

include "..\\Types\\CommonTypes.thrift"
include "..\\Entities\\StimulusStorageSettings.thrift"
include "CommonService.thrift"

namespace * Noldus.NLinx.Contracts.Public

/** Version of the interface.*/
const i32         interfaceVersion          = 1;
/** The name of the RabbitMQ exchange on which the communication of this service runs.*/
const string      exchange                  = "Noldus.NLinx.Public.StimulusService"
/** The eye tracking service runs on a direct exchange.*/
const CommonTypes.ExchangeType exchangeType = CommonTypes.ExchangeType.DIRECT

const string      routingKey                = "2853f2ce-b275-43ab-b730-c50fdd656ff2"

/** 
* The command interface to operate the stimulus service. The stimulus service is responsible for all operations in the domain of presenting and logging
* stimuli. The stimulus service implements:
*   1. Receiving and saving of logged stimuli data, coming from a stimulus logger in the collection tier.
*/
service StimulusService extends CommonService.CommonService
{
    /**  Starts saving the live stimulus data to long-term storage.*/
    void    StartSaving     (   /** Settings that specify which stimulus data to store.*/
                                1: StimulusStorageSettings.StimulusStorageSettings storageSettings) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);

    /**  Stops saving the live stimulus data to long-term storage.*/
    void    StopSaving      (   /** Settings that specify which stimulus data to store.*/
                                1: StimulusStorageSettings.StimulusStorageSettings storageSettings) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);
}
