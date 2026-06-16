//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Entities Contracts
// File       :   EyeMovementSample.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 22-02-2019 Tijmen van Voorthuijsen   - Original version
//----------------------------------------------------------------------------

include "..\\Types\\CommonTypes.thrift"
include "..\\Types\\EyeTrackingTypes.thrift"
include "..\\Entities\\EyeMovementPoint.thrift"

namespace * Noldus.NLinx.Contracts.Public

/** Defines the eye movement state for one gaze sample point. This state can be a fixation, a saccade or another type of eye movement.*/
struct EyeMovementSample
{
    /** The sample time stamp of the eye movement, in Unix time. */
    1: required CommonTypes.UnixTime timeStamp,

    /** The fixation counter (starts with 0 until the number of fixations when the gaze data stops coming.*/
    2: optional i32 movementCounter,

    /** The state of the sample, which can be a fixation state, a saccade state or other.*/
    3: optional EyeTrackingTypes.EEyeMovementState eyeMovementState,

    /** It defines the central point of the fixation, calculated as the average of the left and right eye gaze positions during the fixation.*/
    4: optional EyeMovementPoint.EyeMovementPoint eyeMovementPoint,
}
