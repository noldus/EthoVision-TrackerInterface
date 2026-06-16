//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Entities Contracts
// File       :   EyeMovementPoint.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 22-02-2019 Tijmen van Voorthuijsen   - Original version
//----------------------------------------------------------------------------

include "..\\Types\\CommonTypes.thrift"

namespace * Noldus.NLinx.Contracts.Public

/** The eye movement position is the 2D position of a fixation or saccade. For a fixation, the eye movement point is the central point 
*   of the fixation, calculated as the average from the left and right eye gaze positions during the fixation. For a saccade, it is the average
*   gaze position from the left and right eye.*/
struct EyeMovementPoint
{
    /** The position of the eye movement state in 2D on the user display area. The 2D position is mapped to normalized coordinates for X and Y,
     *  expressed as a floating point value which run from 0.0 to 1.0, both ends included. The point (0, 0) denotes the upper left corner 
     *  and (1, 1) the lower right corner.*/
    1: optional CommonTypes.Point2D positionOnDisplay,

    /** This parameter only applies to fixation events. It is the size of the eye movement state, as the radius from the position, also in normalized coordinates. */
    2: optional double radialSize,
}
