//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Entities Contracts
// File       :   StimulusEventData.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 12-03-2019 Tijmen van Voorthuijsen - Original version
//----------------------------------------------------------------------------

include "..\\Types\\CommonTypes.thrift"
include "..\\Types\\StimulusTypes.thrift"

namespace * Noldus.NLinx.Contracts.Public


/** The data associated for one type of stimulus event. This is a union, so it transports exactly one field 
*   of the possible set of stimulus event data fields. */
union StimulusEventData
{
    /** Stimulus type: WEB_PAGE_URL_CHANGED, WEB_PAGE_SIZE_CHANGED. Data associated with when browsing to a new URL in a web browser or when the browser application window is resized.*/
    1: StimulusTypes.WebPageChangedData webPageChangedData,
}
