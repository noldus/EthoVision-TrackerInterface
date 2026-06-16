//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Common Contracts
// File       :   Process.thrift
//----------------------------------------------------------------------------
// Revisions  :
//----------------------------------------------------------------------------
include "..\\Types\\CommonTypes.thrift"

namespace * Noldus.NLinx.Contracts.Common

/** The sample point of one sample stream. The corresponding time is specified as a separate parameter on the data transfer interface. Use this if you send several samples of different streams with the same timestamp.*/
struct Sample
{
    /** The name of the stream to which this sample belongs.*/
    1: string streamName,

    /** The value of the sample.*/
    2: double value
}

/** The sample stream */
struct SampleStream
{
    /** The name of the stream. When specifying sample points, the stream Name should correspond to this entry*/
    1: string streamName,

    /** The absolutestart time of the stream*/
    2: CommonTypes.UnixTime time,

   /** sample number per second*/
    3: double sampleRate,

   /** sample type, may be empty*/
    4: string  type, 

   /** sample unit*/
    5: string  unit   
}

/** The sample point of one sample stream. The corresponding stream name specified as a separate parameter on the data transfer interface. Use this if you send several samples of the same stream stream with increasing timestamps.*/
struct SampleWithTime
{
    /** The data and time of the samples in Unix time.*/
    1: CommonTypes.UnixTime sampleTime, 

    /** The value of the sample.*/
    2: double value
}


