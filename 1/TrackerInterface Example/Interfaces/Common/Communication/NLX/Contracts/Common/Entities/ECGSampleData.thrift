//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Entities Contracts
// File       :   ECGSampleData.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 14-01-2021 Cecilia Herrera - Original version
//----------------------------------------------------------------------------

include "..\\Types\\CommonTypes.thrift"
include "..\\Types\\ECGTypes.thrift"

namespace * Noldus.NLinx.Contracts.Public.Entities


/** The data associated for one type of ECG sample. */
struct ECGSampleData
{
    /** ECG output type.*/
    1: ECGTypes.EEcgSignalType ecgSignalType,

    /** The value for the ECG sample data type */
    2: optional double leadChannelmV,

    /** The validity of the data based on signal data status. */
    3: optional CommonTypes.EValidity validity,
}
