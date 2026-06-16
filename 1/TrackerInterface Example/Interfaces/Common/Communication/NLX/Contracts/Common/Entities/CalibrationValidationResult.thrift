//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   CalibrationValidationResult.thrift
//----------------------------------------------------------------------------
// Revisions  :
//----------------------------------------------------------------------------
include "..\\Types\\CommonTypes.thrift"
include "CalibrationValidationPointResult.thrift"

namespace * Noldus.NLinx.Contracts.Public

/**
 *   The overall status of an eye tracker calibration validation.
 */
enum ECalibrationValidationStatus
{
    /** No calibration validation has been carried out, or a calibration validation is in progress, so the result is unknown or not applicable.*/
    Indeterminate,

    /** Calibration validation process succeeded.*/
    Successful,

    /** Calibration validation process failed.*/
    Failed
}


/** Results from the calibration validation of an eye tracker.*/
struct CalibrationValidationResult
{
    /** The status of calibration validation process, flag- by default value indeterminate. */
    1: optional ECalibrationValidationStatus calibrationValidationStatus = ECalibrationValidationStatus.Indeterminate, 

    /** The collection of calibration validation points and results. */
    2: optional list<CalibrationValidationPointResult.CalibrationValidationPointResult> calibrationValidationPointResultCollection,

    /** The accuracy in degrees averaged over all collected points for the left eye. */
    3: optional double averageAccuracyLeftEye = -1.0,

    /** The precision (standard deviation) in degrees averaged over all collected points for the left eye. */
    4: optional double averagePrecisionLeftEye,

    /** The precision (root mean square of sample-to-sample error) in degrees averaged over all collected points for the left eye. */
    5: optional double averagePrecisionRMSLeftEye,

    /** The accuracy in degrees averaged over all collected points for the right eye. */
    6: optional double averageAccuracyRightEye = -1.0,

    /** The precision (standard deviation) in degrees averaged over all collected points for the right eye. */
    7: optional double averagePrecisionRightEye,

    /** The precision (root mean square of sample-to-sample error) in degrees averaged over all collected points for the right eye. */
    8: optional double averagePrecisionRMSRightEye,

    /** The average of the left and right eye accuracy in degrees. */
    9: optional double averageAccuracyBothEyes = -1.0,

    /** The date and time of the calibration validation result, in UTC Unix time. */
    10: required CommonTypes.UnixTime timeStamp
    
}
