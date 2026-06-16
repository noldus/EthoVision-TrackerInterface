//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Entities Contracts
// File       :   StreamingOptions.thrift
//----------------------------------------------------------------------------
// Revisions  :
//----------------------------------------------------------------------------

include "..\\Types\\CommonTypes.thrift"

namespace * Noldus.NLinx.Contracts.Public.Entities

/** Properties that define how data should be streamed to the receiver.*/
struct StreamingOptions
{
    /** The identifier that makes the request for a streaming job. This ID will become part of the routing key that defines the address to whom the data should be send. This is 
    /*  can be the same as the N-Linx my process ID, but it may also be a newly generated guid when a process wants to listen to multiple queues of incoming data.*/
    1: required CommonTypes.GUID requestorId,

    /** For each new streaming request, the request ID must be newly generated, it is used to distinguish receiving data from multiple requests.*/
    2: required CommonTypes.GUID requestId,

    /** Specify how the data should be returned, for example as one data chunk or split in time bins. Default is to return the data as one chunk.*/
    3: optional CommonTypes.EDeliveryOption deliveryOption = CommonTypes.OneChunk,

    /** Applies when the data is returned in chunks. The chunks can be delivered ordered or unordered. Default is to return the data ordered.*/
    4: optional CommonTypes.EOrder order = CommonTypes.Ordered,
}
