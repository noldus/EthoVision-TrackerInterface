//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx Cpp
// Module     :   NlxThriftTest
// File       :   TestPerformance.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 19-04-2016 Tijmen van Voorthuijsen   - Original version
//----------------------------------------------------------------------------
include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "..\\..\\Common\\Entities\\Header.thrift"

namespace * Noldus.NLinx.Contracts.Test


struct DataSetB
{
    1: bool     boolValue,
    2: byte     byteValue,
    3: i16      int16Value,
    4: i32      int32Value,
    5: i64      int64Value,
    6: double   doubleValue,
    7: string   stringValue
}

struct DataSetC
{
    1:  CommonTypes.UnixTime time,
    2:  double               doubleValue0,
    3:  double               doubleValue1,
    4:  double               doubleValue2,
    5:  double               doubleValue3,
    6:  double               doubleValue4,
    7:  double               doubleValue5,
    8:  double               doubleValue6,
    9:  double               doubleValue7,
    10: double               doubleValue8,
    11: double               doubleValue9
}

struct DataSetD
{
    1:  CommonTypes.UnixTime time,
    2:  double               x,
    3:  double               y,
    4:  double               z,
    5:  string				 tag1,
    6:  string				 tag2,
    7:  string				 tag3,
    8:  string               tag4
}

/** Return result for test where the server side constructs a list of string values.*/
struct BulkStringResult
{
    /** The time in microseconds it took to create the bulk list of string values. This time is needed at the requestor side to correct for the time it took the server to create the list of string values. */
    1:  CommonTypes.Duration serverWorkMicroseconds,
    /** The bulk data as a list of strings. */
    2:  list<string> bulkData
}

/** Return result for test where the server side constructs a list of mixed struct values.*/
struct BulkMixedStructResult
{
    /** The time in microseconds it took to create the bulk list of mixed structs. This value is needed at the requestor side to correct for the time it took the server to create the list of mixed structs. */
    1:  CommonTypes.Duration serverWorkMicroseconds,
    /** The bulk data as a list of mixed structs. */
    2:  list<DataSetB> bulkData
}

/** Return result for test where the server side constructs a list of sample values.*/
struct BulkSampleResult
{
    /** The time in microseconds it took to create the bulk list of samples. This value is needed at the requestor side to correct for the time it took the server to create the list of samples. */
    1:  CommonTypes.Duration serverWorkMicroseconds,
    /** The bulk data as a list of samples. */
    2:  list<DataSetC> bulkData
}


/** A test service for making performance measurements for produce-consume calls of N-Linx Thrift. */
service TestPerformanceProduceConsumeService
{
    /** Test for a simple fire-and-forget routine. */
    oneway void SendString(1: string message);

    /** Test for a struct fire-and-forget routinge. */
    oneway void SendMixedStruct(1: DataSetB message);

    /** Test for a struct fire-and-forget routinge. */
    oneway void SendSamplesStruct(1: DataSetC message);
}


    /** A test service for making performance measurements for request-reply calls of N-Linx Thrift. */
service TestPerformanceRequestReplyService
{
    /** Test for a request with a string.*/
    i32 RequestString(1: string message);

    /** Test for request with a mixed struct.*/
    i32 RequestMixedStruct(1: DataSetB message);

    /** Test for request with a samples.*/
    i32 RequestSamplesStruct(1: DataSetC message);

    /** Test for request with a struct used in time series communication.*/
    i32 RequestTimeSeriesStruct(1: DataSetD message);

    /** Test for a request with a list of string values.*/
    BulkStringResult RequestStringList(1: i32 numberOfSamples);

    /** Test for a request with a list of mixed struct values.*/
    BulkMixedStructResult RequestMixedStructList(1: i32 numberOfSamples);

    /** Test for a request with a list of sample values.*/
    BulkSampleResult RequestSampleList(1: i32 numberOfSamples);

    /** Test for request with a list of time series like data.*/
    i32 RequestTimeSeriesList(1: list<DataSetD> message);
}
