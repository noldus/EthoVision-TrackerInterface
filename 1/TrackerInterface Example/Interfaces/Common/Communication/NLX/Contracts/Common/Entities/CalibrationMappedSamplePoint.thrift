//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   CalibrationMappedSamplePoint.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 05-09-2018 Dragana Verpoort Petric   - Original version
//----------------------------------------------------------------------------

include "..\\Types\\CommonTypes.thrift"

namespace * Noldus.NLinx.Contracts.Public

/** Gaze sample point position for the left and right eye collected during the calibration process and calculated with applied calibration.*/
struct CalibrationMappedSamplePoint
{
    /** The calibration mapped sample of the left eye. */
    1: optional CommonTypes.Point2D leftEye,
    
    /** The calibration mapped sample of the right eye. */
    2: optional CommonTypes.Point2D rightEye
}
