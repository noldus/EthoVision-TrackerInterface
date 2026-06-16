//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Entities Contracts
// File       :   ECGSample.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 14-01-2021 Cecilia Herrera - Original version
//----------------------------------------------------------------------------

include "..\\Types\\CommonTypes.thrift"
include "ECGSampleData.thrift"

namespace * Noldus.NLinx.Contracts.Public.Entities

/** Represents one ECG sample that describes which ECG output was occuring at what time. An example of a ECG sample is a Lead I value. */
struct ECGSample
{
    /** The date and time that the ECG output took place, in Unix time. */
    1: required CommonTypes.UnixTime timeStamp,

    /** A list of ECG output data. */
    2: list<ECGSampleData.ECGSampleData> ecgSampleData,

    /** The time stamp as read directly from the device software. For interpretation of this time stamp, please consult the documentation of the manufacturer of the device. Value is in microseconds.*/
    3: optional i64 deviceTimeStampMicroseconds,
}
