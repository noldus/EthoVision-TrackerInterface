//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Common Entities Contracts
// File       :   GazePoint.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 11-07-2017 Csaba Balazs   - Original version
//----------------------------------------------------------------------------

include "..\\Types\\CommonTypes.thrift"

namespace * Noldus.NLinx.Contracts.Common

/** Provides properties for the gaze point. */
struct GazePoint
{
    /** The gaze point position in user 3D coordinate system. */
    1: optional CommonTypes.Point3D positionInUserCoordinates,

    /** The gaze point position in 2D on the user display area. The 2D gaze position is mapped to normalized coordinates for X and Y,
     * expressed as a floating point value which run from 0.0 to 1.0, both ends included. The point (0, 0) denotes the upper left corner 
     * and (1, 1) the lower right corner.*/
    2: optional CommonTypes.Point2D positionOnDisplay,

    /** The validity of the gaze origin data. */
    3: optional CommonTypes.EValidity validity
}
