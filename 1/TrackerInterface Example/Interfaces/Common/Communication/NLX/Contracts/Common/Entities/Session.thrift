//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   Session.thrift
//----------------------------------------------------------------------------
// Revisions  :
//----------------------------------------------------------------------------

include "..\\Types\\CommonTypes.thrift"
include "AcquisitionSettings.thrift"

namespace * Noldus.NLinx.Contracts.Public

/** A session holds information on one data acquisition run. A data acquisition is in general determined by a start and a stop recording time, meta data, 
*   and references to all data sets that were selected for recording.*/
struct Session
{
    /** Identifier of a session. This identifier is guaranteed to be unique within the platform. If the identifier is not filled in, it indicates a new session.*/
    1: optional CommonTypes.GUID id,
    
    /** The friendly name of the session. This name can be seen in the user interface.*/
    2: optional string name,

    /** The date and time when the recording of the session has started. This is a local date and time. If the start time
    *   has not been set, it means that the session has not started yet.*/
    3: optional CommonTypes.IsoDateTime startTime,

    /** The date and time when the recording of the session has stopped. This is a local date and time. If the stop time has not been set, but the start
    *   time has been set, it means that the session is actively recording.*/
    4: optional CommonTypes.IsoDateTime stopTime,

    /** The AcquisitionSettings specify all the properties and settings that were used for making the session recording. */
    5: optional AcquisitionSettings.AcquisitionSettings acquisitionSettings
}

