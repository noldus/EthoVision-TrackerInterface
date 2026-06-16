//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Entities Contracts
// File       :   FacialExpressionSample.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 16-07-2020 Tijmen van Voorthuijsen   - Original version
//----------------------------------------------------------------------------

include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "..\\Entities\\FacialExpression.thrift"

namespace * Noldus.NLinx.Contracts.Public.Entities

/** Defines the facial state at one point in time.*/
struct FacialExpressionSample
{
    /** The sample time stamp of the live image from which the facial state is computed, in Unix UTC time. */
    1: required CommonTypes.UnixTime timeStamp,

    /** Tells if the analyzed face resulted in a valid or invalid outcome. If the validity is valid, face was analyzed successfully. When the validity is invalid, 
    *   face analysis failed.*/
    2: optional CommonTypes.EValidity validity,

    /** The state of the face as a list of facial expressions with their valence values.*/
    3: optional list<FacialExpression.FacialExpression> facialExpressions,

    /** Quality value indicating how sure the system is of it's classifications. It is a double value, with values from 0 to 1. 0 is bad, 1 is good. */
    4: optional double modelQuality,
}
