//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Entities Contracts
// File       :   PPGSample.thrift
//----------------------------------------------------------------------------

include "..\\Types\\CommonTypes.thrift"

namespace * Noldus.NLinx.Contracts.Public.Entities

/** Represents one PPG sample that describes which PPG output was occuring at what time. */
struct PPGSample
{
    /** The date and time that the PPG output took place, in Unix time. */
    1: required CommonTypes.UnixTime timeStamp,

    /** The value for the PPG sample in millivolts.*/
    2: optional double opticalPulsemV,

    /** The validity of the sample based on signal data status. */
    3: optional CommonTypes.EValidity validity,

    /** The time stamp as read directly from the device software. For interpretation of this time stamp, please consult the documentation of the manufacturer of the device. Value is in microseconds.*/
    4: optional i64 deviceTimeStampMicroseconds,
}
