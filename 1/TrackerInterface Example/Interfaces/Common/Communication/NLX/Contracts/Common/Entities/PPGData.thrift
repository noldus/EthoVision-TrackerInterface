//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Entities Contracts
// File       :   PPGData.thrift
//----------------------------------------------------------------------------

include "..\\Types\\CommonTypes.thrift"
include "PPGSample.thrift"

namespace * Noldus.NLinx.Contracts.Public.Entities

/** PPG data contains one or more PPG samples and its related meta data. The raw PPG data is collected by a PPG collector process.*/
struct PPGData
{
    /** A unique identifier of the PPG collector which was used to generate the raw PPG data. In most cases you can pass in the process ID of the hosting 
    *   N-Linx process, but this is not always required. This ID will be used to identify the collected PPG data and its derived data, so as long as this ID is unique
    *   it can be used to identify the collected PPG data. */
    1: optional CommonTypes.GUID ppgCollectorId,
    
    /** A list of collected PPG samples. */
    2: list<PPGSample.PPGSample> ppgSamples,

    /** The rate set on the PPG sensor, in samples per second, at which the continuous PPG signal is sampled.*/
    3: optional double samplingRate,
}
