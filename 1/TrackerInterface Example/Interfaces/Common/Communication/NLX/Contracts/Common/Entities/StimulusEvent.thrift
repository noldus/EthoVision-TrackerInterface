//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Entities Contracts
// File       :   StimulusEvent.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 12-03-2019 Tijmen van Voorthuijsen - Original version
//----------------------------------------------------------------------------

include "..\\Types\\CommonTypes.thrift"
include "..\\Types\\StimulusTypes.thrift"
include "StimulusEventData.thrift"

namespace * Noldus.NLinx.Contracts.Public

/** Represents one stimulus event that describes which stimulus was occuring at what time. An example of a stimulus event is a web page url change.*/
struct StimulusEvent
{
    /** The date and time that the stimulus took place, in Unix time. */
    1: required CommonTypes.UnixTime timeStamp,

    /** The event state defines the life time moments of the stimulus. In most cases this will be a single point event, without duration. If for some
    *   stimulus a duration applies, the start and stop of the stimulus event can be defined as two separate events, the start stimulus event and the stop stimulus event. 
    *   The event state in combination with the stimulus type determines the stimulus event.*/
    2: optional CommonTypes.EEventState eventState = EEventState.Point,

    /** The stimulus type defines which type of stimulus took place, for example a web page URL change.*/
    3: optional StimulusTypes.EStimulusType stimulusType,

    /** The stimulus event data holds the meta information about this stimulus event.*/
    4: optional StimulusEventData.StimulusEventData stimulusEventData
}
