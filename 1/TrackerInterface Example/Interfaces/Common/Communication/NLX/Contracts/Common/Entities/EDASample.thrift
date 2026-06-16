//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Entities Contracts
// File       :   EDASample.thrift
//----------------------------------------------------------------------------

include "..\\Types\\CommonTypes.thrift"

namespace * Noldus.NLinx.Contracts.Public.Entities

/** Represents one EDA sample that describes which EDA output was occuring at what time. */
struct EDASample
{
    /** The date and time that the EDA output took place, in Unix time. */
    1: required CommonTypes.UnixTime timeStamp,

    /** The value for the EDA sample in microsiemens.*/
    2: optional double conductancemS,

    /** The validity of the sample based on signal data status. */
    3: optional CommonTypes.EValidity validity,

    /** The time stamp as read directly from the device software. For interpretation of this time stamp, please consult the documentation of the manufacturer of the device. Value is in microseconds.*/
    4: optional i64 deviceTimeStampMicroseconds,
}
