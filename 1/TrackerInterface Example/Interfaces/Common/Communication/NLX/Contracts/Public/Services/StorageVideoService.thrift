//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Common Contracts
// File       :   StorageVideoService.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 14-10-2020 Krizsán Péter    - Original version
//----------------------------------------------------------------------------

include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "..\\..\\Common\\Interfaces\\CommonService.thrift"

namespace * Noldus.NLinx.Contracts.Public.Services

/** Version of the interface.*/
const i32         interfaceVersion          = 1;

/** The name of the RabbitMQ exchange on which the communication of this service runs.*/
const string      exchange                  = "Noldus.NLinx.Public.StorageVideoService"

/** The type of RabbitMQ exchange on which this service sends the messages.*/
const CommonTypes.ExchangeType exchangeType = CommonTypes.ExchangeType.TOPIC

/** The routing key to address the storage control service.*/
const string      routingKey				= "23c245d4-70ab-436a-a82f-57aabed6a708"

/** 
* The storage video service is responsible for the configuration of the storage engine of video metadata.
*/
service StorageVideoService extends CommonService.CommonService
{
    /** Creates a new database for video metadata.*/
    void							CreateVideoDatabase       ( /** The name of the new database to be created.*/
                                                              1: string databaseName) throws(1: CommonTypes.ApplicationException appEx, 2: CommonTypes.SystemException sysEx);
}