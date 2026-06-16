//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Viso Contracts
// File       :   Subject.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 22-08-2016 Dragana Verpoort Petric      - Original version
//----------------------------------------------------------------------------
include "..\\Entities\\SubjectDefinition.thrift"
include "..\\..\\Common\\Types\\CommonTypes.thrift"

namespace csharp Noldus.NLinx.Contracts.Viso.Entities
namespace * Noldus.NLinx.Contracts.Viso

/**
 *  Holds the information and data of one subject.
 */
struct Subject
{
    /**  A unique identifier of the subject. */
    1: optional i32 id,

    /** The subject definition of the subject, extended information about the subject. */
    2: optional SubjectDefinition.SubjectDefinition subjectDefinition,

    /**  A key code to score the subject. */
    3: optional string key,

    /**  The order index, to maintain the ordering of the subjects in the codes list. */
    4: optional i32 orderIndex
}