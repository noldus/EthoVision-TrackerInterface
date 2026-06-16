//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Viso Contracts
// File       :   SubjectDefinition.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 22-08-2014 Dragana Verpoort Petric          - Original version
//----------------------------------------------------------------------------

namespace csharp Noldus.NLinx.Contracts.Viso.Entities
namespace * Noldus.NLinx.Contracts.Viso

/**
 *  Holds unique information of a subject, like the name of a subject.
 *  This information is shared among subjects in different codes lists.
 *  Eg.: subject definition A can be used in codes list C and B with different key codes.
 */
struct SubjectDefinition
{
    /**  A unique identifier of the subject definition. */
    1: optional i32 id,

    /** The name of the subject definition. */
    2: optional string name,

    /** The flag for marking subject definition used only for one session. */
    3: optional bool isPrivate
}