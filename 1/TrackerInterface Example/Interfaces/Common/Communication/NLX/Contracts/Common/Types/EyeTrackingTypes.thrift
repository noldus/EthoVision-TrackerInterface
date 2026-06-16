//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   EyeTrackingTypes.thrift
//----------------------------------------------------------------------------
// Revisions  : 09-09-2012 Rogier Giesen - Added Eye tracker Type
//----------------------------------------------------------------------------

namespace * Noldus.NLinx.Contracts.Public

/** Defines the different states of eye movement.*/
enum EEyeMovementState
{
    /** The status of the eye movement is unknown.*/
    UNDEFINED       = 0,

    /** The eye is fixating, i.e. maintaining the visual gaze on a single location.*/
    FIXATION        = 1,

    /** The eye is in a saccade, i.e. in a quick simultanuous movement of both eyes between two or more phases of fixation in the same direction.*/
    SACCADE         = 2,
}


/** Overall rating for a calibration based on a validation.*/
enum ECalibrationRating
{
    /** Quality of the Calibration is not set yet. */
    UNDEFINED = 0,

    /** Overall verdict for the calibration validation is that it failed. Either Calibration OR calibration Validation. */
    FAILED = 1,

    /** Quality of the Calibration is considered bad as angular accuracy is too large. */
    BAD = 2,

    /** Quality of the Calibration is considered moderate as angular accuracy is medium. */
    MODERATE = 3,

    /** Quality of the Calibration is considered good as angular accuracy is small. */
    GOOD = 4,
}


/** Indicates on what eye(s) the data applies to.*/
enum EEye
{
    /** The left eye.*/
    LEFT = 0,

    /** The right eye.*/
    RIGHT = 1,

    /** The eyes combined.*/
    COMBINED = 2,
}
