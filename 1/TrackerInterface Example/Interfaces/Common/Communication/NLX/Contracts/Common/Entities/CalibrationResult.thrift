//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   CalibrationResult.thrift
//----------------------------------------------------------------------------
// Revisions  :
//----------------------------------------------------------------------------
include "..\\Types\\CommonTypes.thrift"
include "CalibrationPointResult.thrift"
include "CalibrationValidationResult.thrift"

namespace * Noldus.NLinx.Contracts.Public

/**
 *   The overall status of an eye tracker calibration.
 */
enum ECalibrationStatus
{
    /** No calibration has been carried out, or a calibration is in progress, so the result is unknown or not applicable.*/
    Indeterminate,

    /** Calibration process succeeded.*/
    Successful,

    /** Calibration process failed.*/
    Failed
}


/** Results from the calibration of an eye tracker.*/
struct CalibrationResult
{
    /** The status of calibration process, flag- by default value indeterminate. */
    1: optional ECalibrationStatus calibrationStatus = ECalibrationStatus.Indeterminate, 

    /** The collection of calibration points and results. */
    2: optional list<CalibrationPointResult.CalibrationPointResult> calibrationPointResultCollection, 

    /** The aspect ratio of the user 2D display area. */
    3: optional CommonTypes.AspectRatio aspectRatio,

    /** An optional status or error message from the device. */
    // Obsolete: 4: optional string calibrationMessage,

    /** ValidationResults for the calibration or null if the eye tracker at hand does not support CalibrationValidation. */
    5: optional CalibrationValidationResult.CalibrationValidationResult calibrationValidationResult
}
