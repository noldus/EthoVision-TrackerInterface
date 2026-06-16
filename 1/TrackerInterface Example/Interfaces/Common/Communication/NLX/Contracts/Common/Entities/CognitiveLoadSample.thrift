//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Common Entities Contracts
// File       :   CognitiveLoadSample.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 11-03-2023 Rogier Giesen   - Original version
//----------------------------------------------------------------------------

include "..\\Types\\EyeTrackingTypes.thrift"
include "..\\Types\\CommonTypes.thrift"

namespace * Noldus.NLinx.Contracts.Common

/** Provides properties for the eye data. */
struct CognitiveLoadSample
{
    /** The sample time stamp of the image, in Unix UTC time. */
    1: required CommonTypes.UnixTime timeStamp,

    /** Timestamp of stimulus causing the cognitive load state. The message timestamp
	/*  indicates the signal time, the exact time when the pupil diameter and according
	/*  cognitive load was detected. The stimulus time is slightly before this, due to
	/*  the physiological delay between stimulus and expression in the pupil diameter. */
    2: optional CommonTypes.UnixTime stimulusTimeStamp,

    /**  Cognitive load score, value 0 - openended (in principle normalized between 0 and 1). */
    3: optional double cogLoad,

    /**  Confidence score, value 0 - 1. */
    4: optional double confidence,

    /**  Pupil diameter [mm]. */
    5: optional double pupDia,

    /**  Pupil size caused by pupillary light reflex [mm]. */
    6: optional double plr,

    /**  Environment brightness, value 0 - 255. */
    7: optional double brightness,

    /**  The eye from which this sample was generated. */
    8: EyeTrackingTypes.EEye eye,

    /**  Error information; explain low confidence estimate. */
    9: optional string error
}
