//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Entities Contracts
// File       :   HeartData.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 14-01-2021 Cecilia Herrera - Original version
//----------------------------------------------------------------------------

include "..\\Types\\CommonTypes.thrift"
include "HeartSample.thrift"

namespace * Noldus.NLinx.Contracts.Public.Entities

/** ECG/PPG data contains one or more ECG/PPG samples and its related meta data. The raw ECG/PPG data is collected by a ECG/PPG collector process.*/
struct HeartData
{
    /** A unique identifier of the ECG/PPG collector which was used to generate the raw ECG/PPG data. In most cases you can pass in the process ID of the hosting 
    *   N-Linx process, but this is not always required. This ID will be used to identify the collected ECG/PPG data and its derived data, so as long as this ID is unique
    *   it can be used to identify the collected ECG/PPG data. */
    1: optional CommonTypes.GUID collectorId,

    /** A list of collected heart samples. */
    2: list<HeartSample.HeartSample> heartSamples,
}
