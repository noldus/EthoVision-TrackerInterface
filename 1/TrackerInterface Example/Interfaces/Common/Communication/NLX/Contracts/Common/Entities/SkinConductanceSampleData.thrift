//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Entities Contracts
// File       :   SkinConductanceSampleData.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 23-03-2022 Csaba Balazs - Original version
//----------------------------------------------------------------------------

include "..\\Types\\CommonTypes.thrift"
include "..\\Types\\PhysiologyTypes.thrift"

namespace * Noldus.NLinx.Contracts.Public.Entities

/** Represents one EDA processed sample that describes which EDA processed type. An example of an EDA processed sample is baseline of skin condictance or average peaks. */
struct SkinConductanceSampleData
{
    /** It defines the type of EDA processed data type (e.g. Baseline, AveragePeaks, etc). */
    1: optional PhysiologyTypes.ESkinConductanceSampleDataType skinConductanceSampleDataType,

    /** The value for the skin conductance sample data. */
    2: optional double value,

    /** The validity of the skin conductance sample data. */
    3: optional CommonTypes.EValidity validity,
}
