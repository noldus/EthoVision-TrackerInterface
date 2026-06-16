//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   MRR
// Module     :   Noldus.Mrr.Contracts
// File       :   UserCodesSetting.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 26-04-2017 Dragana Verpoort Petric           - Original version
//----------------------------------------------------------------------------

namespace csharp Noldus.NLinx.Contracts.Viso.Entities
namespace * Noldus.NLinx.Contracts.Viso

/**
 *  The user codes list persistency settings. 
 */
struct UserCodesSetting
{
    /**  A unique identifier of the file. */
    1: optional i32 id,

    /** The codes list id. Id is used instead of the entity, due to the recursive reference
     * (User -> UserSettings -> UserCodesSettings -> CodesList -> User!. In this case thrift compiler will give error. ). */
    2: optional i32  codesListId,

    /** True if codes list is expanded per user, false otherwise. */
    3: optional bool isExpanded
}