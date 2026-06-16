//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   SignalDefinitionStorage.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 14-03-2023 Rogier Giesen - Original version
//----------------------------------------------------------------------------

include "..\\..\\Common\\Types\\CommonTypes.thrift"

namespace * Noldus.NLinx.Contracts.Public.Entities

/** The SignalDefinitionStorage contains information on where the signal is stored. 
*/
struct SignalDefinitionStorage
{
    /** The bucket in InfluxDB.*/
    1: optional string bucket,

    /** The measurement in InfluxDB.*/
    2: optional string measurement,

    /** The FilterTag in InfluxDB.*/
    3: optional string filterTag,

    /** The FilterValue in InfluxDB.*/
    4: optional string filterValue,

    /** The ValueField in InfluxDB. Should be 'Value' by default.*/
    5: optional string ValueField
}
