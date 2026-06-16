//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   SessionMonitorService.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 09-08-2022 Tijmen van Voorthuijsen - Original version
//----------------------------------------------------------------------------

include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "..\\..\\Common\\Interfaces\\CommonService.thrift"
include "..\\Entities\\Status.thrift"

namespace * Noldus.NLinx.Contracts.Public.Services

/** Version of the interface.*/
const i32         interfaceVersion          = 1;
/** The name of the RabbitMQ exchange on which the communication of this service runs.*/
const string      exchange                  = "Noldus.NLinx.Public.SessionMonitorService"
/** This service runs on a direct exchange.*/
const CommonTypes.ExchangeType exchangeType = CommonTypes.ExchangeType.DIRECT
/** Use this routing key to direct messages to this service.*/
const string      routingKey                = "8f2c7184-5af4-40ec-acbf-e1082b171eeb"

/** The command interface to operate the session monitor service. */
service SessionMonitorService extends CommonService.CommonService
{
    /**
     *  Get all statuses from the given list of source IDs.
     *  @return A list of statuses - Holds information about the status condition given a source ID.
     *  @Exception: None.
     */
    list<Status.Status>     GetStatuses(/** Must be a valid and existing owner. */	
                                        1: list<CommonTypes.GUID> sourceIds,
                                                        ) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);
}