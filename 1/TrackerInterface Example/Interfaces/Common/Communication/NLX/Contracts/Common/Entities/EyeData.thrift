//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Common Entities Contracts
// File       :   EyeData.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 11-07-2017 Csaba Balazs   - Original version
//----------------------------------------------------------------------------

include "GazeOrigin.thrift"
include "GazePoint.thrift"
include "PupilData.thrift"

namespace * Noldus.NLinx.Contracts.Common

/** Provides properties for the eye data. */
struct EyeData
{
    /**  The gaze point data. */
    1: optional GazePoint.GazePoint gazePoint,

    /**  The pupil data. */
    2: optional PupilData.PupilData pupilData,

    /**  The gaze origin data. */
    3: optional GazeOrigin.GazeOrigin gazeOrigin
}
