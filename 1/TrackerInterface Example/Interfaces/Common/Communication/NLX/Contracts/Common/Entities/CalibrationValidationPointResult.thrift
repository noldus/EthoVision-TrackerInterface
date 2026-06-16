//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   CalibrationValidationPointResult.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 22-08-2022 Dragana Verpoort Petric   - Original version
//----------------------------------------------------------------------------

include "..\\Types\\CommonTypes.thrift"

namespace * Noldus.NLinx.Contracts.Public


/**
*   The result for the process of collecting data, for one calibration validation point. This status is set by each implementation of a specific eye tracker.
*/
enum ECollectStatus
{
    /** The collection of calibration validation data for the calibration validation point was successful.*/
    Success,

    /** The collection of calibration validation data for the calibration validation point failed.*/
    Failure
}

/** Calibration validation point location on the display and gaze samples collected during the calibration validation. */
struct CalibrationValidationPointResult
{
    /** Calibration validation point position on display. */
    1: optional CommonTypes.Point2D calibrationValidationPointPosition,

    /** The result for the process of collecting data, for one calibration validation point. This status is set by each implementation of a specific eye tracker. */
    2: optional ECollectStatus collectStatus,

    /** The accuracy in degrees for the left eye. */
    3: optional double accuracyLeftEye = -1.0,

    /** The precision (standard deviation) in degrees for the left eye. */
    4: optional double precisionLeftEye,

    /** The precision (root mean square of sample-to-sample error) in degrees for the left eye. */
    5: optional double precisionRMSLeftEye,

    /** The accuracy in degrees for the right eye. */
    6: optional double accuracyRightEye = -1.0,

    /** The precision (standard deviation) in degrees the right eye. */
    7: optional double precisionRightEye,

    /** The precision (root mean square of sample-to-sample error) in degrees for the right eye. */
    8: optional double precisionRMSRightEye,

    /** The average of the left and right eye accuracy in degrees. */
    9: optional double accuracyAverageBothEyes = -1.0
}