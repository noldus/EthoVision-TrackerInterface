//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   AcquisitionSettings.thrift
//----------------------------------------------------------------------------
// Revisions  :
//----------------------------------------------------------------------------

include "..\\Types\\CommonTypes.thrift"
include "DeviceSelection.thrift"

namespace * Noldus.NLinx.Contracts.Public

/** 
 * The AcquisitionSettings specify all the properties and settings needed for making a live session recording.
 */
struct AcquisitionSettings
{
    /** Information about devices selected for making a recording.*/
    1: optional DeviceSelection.DeviceSelection selectedDevices,

    /** Specifies one or more videos that were used during a session recording. If this member field is not filled in, no videos were recorded. */
    2: optional list<CommonTypes.GUID> selectedVideos,

    /** Specifies eventstreams that were added to session. If this member field is not filled in, session doesn't have eventstream. */
    3: optional list<CommonTypes.GUID> eventStreams,
}
