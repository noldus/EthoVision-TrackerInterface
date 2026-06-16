//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Entities Contracts
// File       :   HeartSample.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 14-01-2021 Cecilia Herrera - Original version
//----------------------------------------------------------------------------

include "..\\Types\\CommonTypes.thrift"
include "HeartSampleData.thrift"

namespace * Noldus.NLinx.Contracts.Public.Entities

/** Represents one ECG processed sample. An example of an ECG processed sample is HR. */
struct HeartSample
{
    /** The date and time that the sample took place, in Unix time. */
    1: required CommonTypes.UnixTime timeStamp,

    /** A list of collected heart sample data. */
    2: list<HeartSampleData.HeartSampleData> heartSampleData,
}
