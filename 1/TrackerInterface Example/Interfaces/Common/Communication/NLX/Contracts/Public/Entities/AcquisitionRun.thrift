//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public contracts
// File       :   AcquisitionRun.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 17-17-2021 Tijmen van Voorthuijsen - Original version
//----------------------------------------------------------------------------

include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "..\\..\\Common\\Types\\ProgramTypes.thrift"
include "..\\Entities\\Device.thrift"

namespace * Noldus.NLinx.Contracts.Public.Entities

/** 
 *  Represents an acquisition, c.q. a recording that is going on.
 */
struct AcquisitionRun
{
    /** Identifier of the run.*/
    1: optional CommonTypes.GUID id,

    /** Describes in which the recording is.*/
    2: optional ProgramTypes.ERecordingStatus recordingStatus,

    /** The id of the session associated with the acquisition run. */
	3: optional CommonTypes.GUID sessionId,

    /** The id of the project in which the acquisition is done. */
    4: optional CommonTypes.GUID projectId,

    /** The id of the location in which the acquisition is done. */
    5: optional CommonTypes.GUID locationId,

    /** The selected devices for which the data should be recorded.*/
    6: optional list<Device.Device> selectedDevices

    /** The date and time when the recording has started. This is a local date and time.*/
    7: optional CommonTypes.IsoDateTime recordingStartTime,

    /** The date and time when the recording was stopped. This is a local date and time.*/
    8: optional CommonTypes.IsoDateTime recordingStopTime,

    /** The current or past duration of the recording, in microseconds. Use this duration as the true duration, which might be different from 
     *  the stop minus start time. For example, when daylight saving corrections were applied during the recording, than the recordingDuration 
     *  still gives the valid duration.*/
    9: optional CommonTypes.Duration recordingDuration,

    /** The local date and time that the acquisition run is created.*/
    10: optional CommonTypes.IsoDateTime createdOn,
}
