//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   Query.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 31-10-2019 Tijmen van Voorthuijsen
//----------------------------------------------------------------------------

include "..\\Types\\CommonTypes.thrift"
include "QueryFilter.thrift"
include "QueryFormat.thrift"
include "QueryOptions.thrift"

namespace * Noldus.NLinx.Contracts.Common


/** A query holds all settings for retrieving time series data out of N-Linx Storage.*/
struct Query
{
    /** The database instance to which the time series points belongs.*/
    1: required string databaseName,
    
    /** The measurement acts as a container for tags, fields, and the time column. It is conceptually similar to a table in RDBMS.*/
    2: required string measurementName,
    
    /**  */
    3: required QueryFilter.QueryFilter QueryFilter,

    /**  */
    4: optional QueryFormat.QueryFormat QueryFormat,

    /**  */
    5: optional QueryOptions.QueryOptions QueryOptions,
}
