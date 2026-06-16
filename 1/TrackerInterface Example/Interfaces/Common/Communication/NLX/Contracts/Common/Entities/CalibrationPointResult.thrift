//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   CalibrationPointResult.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 05-09-2018 Dragana Verpoort Petric   - Original version
//----------------------------------------------------------------------------

include "..\\Types\\CommonTypes.thrift"
include "CalibrationMappedSamplePoint.thrift"

namespace * Noldus.NLinx.Contracts.Public


/**
*   The result for the process of collecting data, for one calibration point. This status is set by each implementation of a specific eye tracker.
*/
enum ECollectStatus
{
    /** The collection of calibration data for the calibration point was successful.*/
    Success,

    /** The collection of calibration data for the calibration point failed.*/
    Failure
}

/** Calibration point location on the display and gaze samples collected during the calibration. 
/*  Gaze sample position is calculated with the applied calibration on eye tracker.*/
struct CalibrationPointResult
{
    /** Calibration point position on display. */
    1: optional CommonTypes.Point2D calibrationPointPosition,
    
    /** The collection of calibration mapped samples for corresponding point. */
    2: optional list<CalibrationMappedSamplePoint.CalibrationMappedSamplePoint> calibrationMappedSamplePoints,

    /** The result for the process of collecting data, for one calibration point. This status is set by each implementation of a specific eye tracker. */
    3: optional ECollectStatus collectStatus
}