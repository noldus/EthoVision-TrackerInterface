//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Viso Contracts
// File       :   CodesList.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 15-12-2014 Gabriela Ignacio          - Original version
//----------------------------------------------------------------------------
include "..\\Entities\\Department.thrift"
include "..\\Entities\\Marker.thrift"
include "..\\Entities\\Subject.thrift"
include "..\\Entities\\User.thrift"
include "..\\..\\Common\\Types\\CommonTypes.thrift"


namespace csharp Noldus.NLinx.Contracts.Viso.Entities
namespace * Noldus.NLinx.Contracts.Viso


/**
 *  Holds the information and data of one codes list.
 */
struct CodesList
{
    /**  A unique identifier of the codes list. */
    1: optional i32 id,

    /** A friendly name of the codes list as seen in the user interface. */
    2: optional string name,

    /** The list of markers. */
    3: optional list<Marker.Marker> markers,

    /** The list of subjects. */
    4: optional list<Subject.Subject> subjects,

    /** A description of the codes list. */
    5: optional string description,

    /** The user who created the codes list. */
    6: optional User.User creator,

    /** This codes list is marked as deleted */
    7: optional bool deleted,

    /** The creation date of the codes list */
    8: optional CommonTypes.IsoDateTime creationDate,

    /** The flag for marking codes lists used only for one session. */
    9: optional bool isPrivate,

    /** User presistancy setting which specifies if the codes list is expanded in the user's view. */
    10: optional bool IsExpanded,

    /** The department this codes list belongs to / is visible. */
    11: optional Department.Department department
}
