//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Common Contracts
// File       :   TimeSeriesPoint.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 25-09-2019 Rogier Giesen - Refactor
//----------------------------------------------------------------------------

include "..\\Types\\CommonTypes.thrift"

namespace * Noldus.NLinx.Contracts.Common


/** A set of time series values that belong to one time stamp.*/
struct TimeSeriesPoint
{
    /** The timestamp of the points, in UTC time. Because time series much represent true continuous flow of time, without unpredictable
    /*  jump in time because of time zone changes, daylight changes and others, the time series are represented in UTC. It is up to the
    /*  client to store local time information in relation to the time series.*/
    1: required CommonTypes.UnixTime timeStamp,

    /** A list of field keys and field values, for example temperature, 26. At least one field is required per TimeSeriesPoint.*/
    2: optional map<string, CommonTypes.PropertyValue> fields,

    /** Tags are optional. You don’t need to have tags in your data structure, but it’s generally a good idea to make use of them 
    /*  because, unlike fields, tags are indexed. This means that queries on tags are faster and that tags are ideal for storing
    /*  commonly-queried metadata. Specify tags as [key, value] pairs, both of type string. In InfluxDb the combination of the TimeStamp and Tags is the unique key*/
    3: optional map<string, string> tags
}


/** Timeprecision for timeseries data */
enum ETimeSeriesPrecision
{
        /** 0.000001 s */
        Microsecond = 0,
        /** 0.001 s */
        Millisecond = 1,
        /** 1 s */
        Second = 2
}

