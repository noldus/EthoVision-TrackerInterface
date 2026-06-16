//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Common Entities Contracts
// File       :   GazeData.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 11-07-2017 Csaba Balazs   - Original version
//----------------------------------------------------------------------------

include "..\\Types\\CommonTypes.thrift"
include "EyeData.thrift"
include "GazePoint.thrift"

namespace * Noldus.NLinx.Contracts.Common

/** Provides properties for the gaze data. */
struct GazeData
{
    /** The plugin date and time of the sample, in UTC Unix time. */
    1: required CommonTypes.UnixTime timeStamp,

    /** A weighted value of the left and right eye position */
    2: optional GazePoint.GazePoint gazePosition,

    /** The aspect ratio of the user 2D display area. */
    3: optional CommonTypes.AspectRatio aspectRatio,
    
    /** The gaze data for the left eye. */
    4: optional EyeData.EyeData leftEye,

    /** The gaze data for the right eye. */
    5: optional EyeData.EyeData rightEye,

    /** Identifier of the eye tracker process which was used to generate the raw gaze data. */
    6: optional CommonTypes.GUID eyeTrackerId,

    /** The time stamp as read directly from the device software. For interpretation of this time stamp, please consult the documentation of the manufacturer of the device. Value is in microseconds.*/
    7: optional i64 deviceTimeStampMicroseconds,
}
