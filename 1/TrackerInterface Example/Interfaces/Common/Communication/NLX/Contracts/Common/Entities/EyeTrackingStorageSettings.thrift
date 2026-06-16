//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   EyeTrackingStorageSettings.thrift
//----------------------------------------------------------------------------
// Revisions  :
//----------------------------------------------------------------------------
include "..\\Types\\CommonTypes.thrift"
include "..\\Types\\ProgramTypes.thrift"

namespace * Noldus.NLinx.Contracts.Public


/** 
 *  The eye tracking storage settings are used during saving or retrieval of gaze data. They allow to specify what to be saved or loaded.
 */
struct EyeTrackingStorageSettings
{
    /** The identifier of the eye tracker process to which the settings apply. So the settings in this struct are only applied to this eye tracker process ID.*/
    1: optional CommonTypes.GUID eyeTrackerProcessId,

    /** Tags can be used to label the eye tracking data in storage with custom string values. These tags can be used later during data retrieval, to define
    *   what data should be retrieved from storage. For example, when the eye tracking data is recorded within a session, use a tag with name sessionId and 
    *   value a session guid.*/
    2: optional map<string, string> tags

    /** When saving: specify true and gaze data will be saved to storage, specify false and gaze data will not be saved to storage.
    *   When retrieving: specify true to retrieve gaze data, specify false to retrieve eye movement data.*/
    3: optional bool saveGazeDataToStorage,

    /** When saving: specify true and eye movement data will be streamed to storage, specify false and eye movement data will not be streamed to storage.
    *   When retrieving: specify true to retrieve eye movement data, specify false to retrieve eye movement data.*/
    4: optional bool saveMovementDataToStorage,

    /** When specified, it specifies the to and from times for gettings or setting data. */
    5: optional CommonTypes.SampleTimeInterval sampleTimeInterval,
}
