//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Entities Contracts
// File       :   EDAData.thrift
//----------------------------------------------------------------------------

include "..\\Types\\CommonTypes.thrift"
include "EDASample.thrift"

namespace * Noldus.NLinx.Contracts.Public.Entities

/** EDA data contains one or more EDA samples and its related meta data. The raw EDA data is collected by a EDA collector process.*/
struct EDAData
{
    /** A unique identifier of the EDA collector which was used to generate the raw EDA data. In most cases you can pass in the process ID of the hosting 
    *   N-Linx process, but this is not always required. This ID will be used to identify the collected EDA data and its derived data, so as long as this ID is unique
    *   it can be used to identify the collected EDA data. */
    1: optional CommonTypes.GUID edaCollectorId,
    
    /** A list of collected EDA samples. */
    2: list<EDASample.EDASample> edaSamples,

    /** The rate set on the EDA sensor, in samples per second, at which the continuous EDA signal is sampled.*/
    3: optional double samplingRate,
}
