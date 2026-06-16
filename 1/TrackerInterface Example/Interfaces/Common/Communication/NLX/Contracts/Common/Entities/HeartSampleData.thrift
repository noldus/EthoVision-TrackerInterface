//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Entities Contracts
// File       :   HeartSampleData.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 14-01-2021 Cecilia Herrera - Original version
//----------------------------------------------------------------------------

include "..\\Types\\CommonTypes.thrift"
include "..\\Types\\PhysiologyTypes.thrift"

namespace * Noldus.NLinx.Contracts.Public.Entities

/** Represents one ECG/PPG processed sample that describes which ECG/PPG processed type. An example of an ECG/PPG sample data is HR. */
struct HeartSampleData
{
    /** It defines the type of ECG/PPG processor (e.g. HV, IBI, etc). */
    1: optional PhysiologyTypes.EHeartSampleDataType heartSampleDataType,

    /** The value for the heart sample data. */
    2: optional double value,

    /** The validity of the heart sample data. */
    3: optional CommonTypes.EValidity validity,
}
    
