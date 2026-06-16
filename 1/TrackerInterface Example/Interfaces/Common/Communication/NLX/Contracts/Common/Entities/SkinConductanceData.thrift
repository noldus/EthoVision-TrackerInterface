//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Entities Contracts
// File       :   SkinConductanceData.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 23-03-2022 Csaba Balazs - Original version
//----------------------------------------------------------------------------

include "..\\Types\\CommonTypes.thrift"
include "SkinConductanceSample.thrift"

namespace * Noldus.NLinx.Contracts.Public.Entities

/** SkinConductanceData contains one or more SkinConductance samples and its related meta data. The raw SkinConductanceData is collected by a EDA collector process.*/
struct SkinConductanceData
{
    /** A unique identifier of the EDA collector which was used to generate the raw EDA data. In most cases you can pass in the process ID of the hosting 
    *   N-Linx process, but this is not always required. This ID will be used to identify the collected EDA data and its derived data, so as long as this ID is unique
    *   it can be used to identify the collected EDA data. */
    1: optional CommonTypes.GUID collectorId,

    /** A list of skin conductance samples. */
    2: list<SkinConductanceSample.SkinConductanceSample> skinConductanceSamples,
}
