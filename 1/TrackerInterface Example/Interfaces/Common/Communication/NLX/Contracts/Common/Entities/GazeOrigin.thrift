//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Common Entities Contracts
// File       :   GazeOrigin.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 11-07-2017 Csaba Balazs   - Original version
//----------------------------------------------------------------------------

include "..\\Types\\CommonTypes.thrift"

namespace * Noldus.NLinx.Contracts.Common

/** Provides properties for the gaze origin. */
struct GazeOrigin
{
    /** The gaze origin position in user 3D coordinate system. */
    1: optional CommonTypes.Point3D positionInUserCoordinates,

    /** The validity of the gaze origin data. */
    2: optional CommonTypes.EValidity validity
}
