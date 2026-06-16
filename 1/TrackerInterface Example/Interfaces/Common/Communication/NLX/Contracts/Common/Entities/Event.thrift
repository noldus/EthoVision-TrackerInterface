//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Common Contracts
// File       :   Event.thrift
//----------------------------------------------------------------------------
// Revisions  :
//----------------------------------------------------------------------------
include "..\\Types\\CommonTypes.thrift"

namespace * Noldus.NLinx.Contracts.Common

/**
 *   An event stream contains the meta information for an event log.
 */
struct EventStream
{
    /** The stream name. */
    1: string streamName,

    /** The absolute start time of the stream. */
    2: CommonTypes.UnixTime time,

    /** The observer person. */
    3: string createdBy, 

    /** The optional description. */
    4: optional string description,

    /** optional source Id, where the stream is coming from. */
    5: optional CommonTypes.GUID sourceId, 

    /** OBSOLETE: optional Id of the containing session/recording. */
    /** OBSOLETE: 6: optional CommonTypes.GUID sessionId, */
    
    /** Identifier of this stream event entity. */
    7: optional CommonTypes.GUID id
}


/** An abstract event is a generic description of some observed behavior in time. */
struct AbstractEvent
{
    /** The event Id. */
    1: optional CommonTypes.GUID eventId,

    /** The event stream Id to which an event belongs to. */
    2: optional CommonTypes.GUID eventStreamId,

    /** The start time of an event. */
    3: optional CommonTypes.UnixTime startTime,

    /** The stop time of an event. */
    4: optional CommonTypes.UnixTime stopTime
    
    /** The annotation definitions. */
    5: optional list<CommonTypes.GUID> definitionIds,

    /** The comment in the event. */
    6: optional string comment

    /** The observer that created the event. */
    7: optional string scorer
}


/** The following event types are used mainly in the previous generations of our software 
 *  like The Observer XT and Viso. Be careful when changing.
 */

 /** An event is a description of some observed behavior in time.*/
struct SimpleEvent
{
    /** The absolute time in the event.*/
    1: CommonTypes.UnixTime time,

    /** The subject in the event.*/
    2: optional string subject,

    /** The behavior in the event.*/
    3: optional string behavior,

    /** The comment in the event.*/
    4: optional string comment,

    /** The event log name.*/
    5: optional string eventLog,

    /** The state start/stop or point flag- by default point event*/
    6: optional CommonTypes.EEventState state = EEventState.Point

}

/**
 *   An attribute value of a given attribute group.
 */
struct AttrValue
{
    /** The attribute name*/
    1: string attrGroupName,

    /** The attribute value*/
    2: string attributeValue

}


/**
 *   An extended event, containing a simple event+attributes.
 */
struct ExtendedEvent  
{
    /** The basic event*/
    1:SimpleEvent basicEvent,

    /** The list of numeric attribute values */
    2:list<AttrValue> numAttributes,

    /** The list of nominal attribute values*/
    3:list<AttrValue> nomAttributes 
}



/**
 *   TO BE REMOVED
 *   Event data for streaming.
 */
struct EventData
{
    /** source Id, where the stream is coming from */
    1: optional CommonTypes.GUID sourceId 

   /** list of events */
    2: optional list<SimpleEvent> events
}
