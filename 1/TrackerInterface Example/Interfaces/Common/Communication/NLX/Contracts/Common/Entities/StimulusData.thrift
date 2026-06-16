//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Entities Contracts
// File       :   StimulusData.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 12-03-2019 Tijmen van Voorthuijsen - Original version
//----------------------------------------------------------------------------

include "..\\Types\\CommonTypes.thrift"
include "StimulusEvent.thrift"

namespace * Noldus.NLinx.Contracts.Public

/** Stimulus data contains one or more stimulus events and its related meta data. The raw stimulus data is collected by a stimulus collector process.*/
struct StimulusData
{
    /** A unique identifier of the stimulus collector which was used to generate the raw stimulus data. In most cases you can pass in the process ID of the hosting 
        N-Linx process, but this is not always required. This ID will be used to identify the collected stimulus data and its derived data, so as long as this ID is unique
        it can be used to identify the collected stimulus data.*/
    1: optional CommonTypes.GUID stimulusCollectorId,
    
    /** A list of collected stimulus events.*/
    2: list<StimulusEvent.StimulusEvent> stimulusEvents,

}
