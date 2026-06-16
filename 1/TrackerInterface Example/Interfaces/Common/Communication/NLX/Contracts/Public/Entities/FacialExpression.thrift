//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Entities Contracts
// File       :   FacialExpression.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 16-07-2020 Tijmen van Voorthuijsen   - Original version
//----------------------------------------------------------------------------

include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "..\\Types\\FacialAnalysisTypes.thrift"

namespace * Noldus.NLinx.Contracts.Public.Entities

/** Defines the type and value of a facial expression.*/
struct FacialExpression
{
    /** It defines the type of facial expression.*/
    1: optional FacialAnalysisTypes.EFacialExpression facialExpressionType,

    /** An intensity value between 0 and 1 for the facial expression */
    2: optional double value,
}
