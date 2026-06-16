//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Entities Contracts
// File       :   SkinConductanceSample.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 23-03-2022 Csaba Balazs - Original version
//----------------------------------------------------------------------------

include "..\\Types\\CommonTypes.thrift"
include "SkinConductanceSampleData.thrift"

namespace * Noldus.NLinx.Contracts.Public.Entities

/** Represents one EDA processed sample. An example of an EDA processed sample is skin conductance average value (baseline) or average peak number. */
struct SkinConductanceSample
{
    /** The date and time that the sample took place, in Unix time. */
    1: required CommonTypes.UnixTime timeStamp,

    /** A list of collected skin conductance sample data. */
    2: list<SkinConductanceSampleData.SkinConductanceSampleData> skinConductanceSampleData
}
