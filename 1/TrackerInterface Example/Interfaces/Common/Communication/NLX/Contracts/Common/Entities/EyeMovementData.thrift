//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Entities Contracts
// File       :   EyeMovementData.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 25-02-2019 Tijmen van Voorthuijsen - Original version
//----------------------------------------------------------------------------

include "..\\Types\\CommonTypes.thrift"
include "EyeMovementSample.thrift"

namespace * Noldus.NLinx.Contracts.Public

/** Data on calculated eye data, like fixations and saccades. */
struct EyeMovementData
{
    /** Identifier of the eye tracker process which was used to generate the raw gaze data. This ID is used to identify the raw gaze data and the derived data,
    *   for example the list of fixation and saccade events. */
    1: optional CommonTypes.GUID eyeTrackerId,
    
    /** A list of eye movement samples that describes at each sample point if the eyes are in a state of fixation, saccade or other type of eye movement.*/
    2: list<EyeMovementSample.EyeMovementSample> eyeMovementSamples,

    /** The aspect ratio of the user 2D display area. */
    3: optional CommonTypes.AspectRatio aspectRatio,
}
