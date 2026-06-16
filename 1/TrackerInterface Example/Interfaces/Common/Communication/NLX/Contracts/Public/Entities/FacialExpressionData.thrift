//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Entities Contracts
// File       :   FacialExpressionData.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 16-07-2020 Tijmen van Voorthuijsen - Original version
//----------------------------------------------------------------------------

include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "FacialExpressionSample.thrift"

namespace * Noldus.NLinx.Contracts.Public.Entities

/** Data on calculated facial analysis data, like facial expressions. */
struct FacialExpressionData
{
    /** Identifier of the source process that produces the image data, from which the facial expression data is calculated. This ID should be used to identify to which
    *   source the facial expression data belongs, for example in storage.*/
    1: optional CommonTypes.GUID sourceId,
    
    /** A list of facial expression samples that describes at each sample point the facial expression value (e.g. probability happy or sad).*/
    2: list<FacialExpressionSample.FacialExpressionSample> facialExpressionSamples,
}
