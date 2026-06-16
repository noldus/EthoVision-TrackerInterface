//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Common Entities Contracts
// File       :   CognitiveLoadData.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 11-03-2023 Rogier Giesen   - Original version
//----------------------------------------------------------------------------

include "..\\Types\\CommonTypes.thrift"
include "CognitiveLoadSample.thrift"

namespace * Noldus.NLinx.Contracts.Common

/** These samples contain information about the cognitive load. 
* There is usually one cognitive load sample generated for each received [eye sample](#eye-sample),
* which means the cognitive load sample rate matches the eye sample rate.
* If there are eye samples for both the left and right eye (two samples at each point in time), there is only one cognitive load response message. */
struct CognitiveLoadData
{
    /** A unique identifier to identify the source of the cognitive workload. Usually the name of the computer that collects gaze and (video)images. 
    *   it can be used to identify the collected data. */
    1: optional string computerName,

    /** A list of collected heart samples. */
    2: list<CognitiveLoadSample.CognitiveLoadSample> cognitiveLoadSamples
}
