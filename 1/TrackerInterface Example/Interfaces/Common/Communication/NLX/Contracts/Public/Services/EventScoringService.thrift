//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   EventScoringService.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 17-11-2021 Krizsán Péter             - Original version
//----------------------------------------------------------------------------

include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "..\\..\\Common\\Interfaces\\CommonService.thrift"
include "..\\..\\Common\\Entities\\Process.thrift"
include "..\\..\\Common\\Entities\\Event.thrift"

namespace * Noldus.NLinx.Contracts.Public

/** Version of the interface.*/
const i32         interfaceVersion          = 1;

/** The name of the RabbitMQ exchange on which the communication of this service runs.*/
const string      exchange                  = "Noldus.NLinx.Public.EventScoringService"

/** This service runs on a direct exchange.*/
const CommonTypes.ExchangeType exchangeType = CommonTypes.ExchangeType.DIRECT

/** Use this routing key to direct messages to this service.*/
const string      routingKey                = "9b69ef9e-85e6-41ed-922e-b6cc375745dc"

/** 
* The command interface to operate the event scoring service. 
*/
service EventScoringService extends CommonService.CommonService
{
    /**
    *  Create event stream. 
    *  @return Return Id of new event stream.
    */
    CommonTypes.GUID            CreateEventStream( /** The EventStream*/
                                                   1:Event.EventStream eventStream
                                                   ) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);

    /**
    *  Get event stream.
    *  @return Return event stream.
    */
    Event.EventStream           GetEventStream( /** The EventStream guid*/
                                                1:CommonTypes.GUID eventStreamId
                                                ) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);

    /**
    *  Get event streams of a specific session.
    *  @return Return a list of event streams.
    */
    list<Event.EventStream>     GetEventStreams( /** The session guid*/
                                                 1:CommonTypes.GUID sessionId
                                                 ) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);


    /**Delete event streams. */
    void                        DeleteEventStreams( /** The EventStream guids*/
                                                    1:list<CommonTypes.GUID> eventStreamIds
                                                    ) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);


    /**
    *  Add event.
    *  @return Return Id of a new event. 
    */
    CommonTypes.GUID            AddEvent( /** The event */  
                                          1:Event.AbstractEvent abstractEvent
                                          ) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);

    /**
    *  Get events of an event stream.
    *  @return Return a list of abstract events. 
    */
    list<Event.AbstractEvent>   GetEvents( /** The EvenStream guid*/
                                           1:CommonTypes.GUID eventStreamId
                                           ) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);

    /**Delete event */
    void                        DeleteEvent( /** The event Id */  
                                             1:CommonTypes.GUID eventId
                                             ) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);
}