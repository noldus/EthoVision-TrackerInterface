//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public contracts
// File       :   Project.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 08-10-2019 Tijmen van Voorthuijsen   - Original version
//----------------------------------------------------------------------------

include "..\\..\\Common\\Types\\CommonTypes.thrift"

namespace * Noldus.NLinx.Contracts.Public.Entities


/** 
 *  A project holds information about one experiment or study in which live data is collected.
 *  It is a very general purpose container that holds meta data on the study and relationships to
 *  collected data and (future) analysis.
 */
struct Project
{
    /** Identifier of a project. This identifier is guaranteed to be unique within the platform. If the identifier is not filled in, it indicates a new project. */
    1: optional CommonTypes.GUID id,

    /** The friendly name of the project. This name can be seen for example in the user interface. */
    2: optional string name,   

    /** The local date and time when the project was created. This creation date is set in the project service. */
    3: optional CommonTypes.IsoDateTime CreationDateTime,

    /** The list of sessions contained in the project. */
    4: optional list<CommonTypes.GUID> SessionList,

    /** Id of the marker definition list which is assigned to this project. */
    5: optional CommonTypes.GUID MarkerDefinitionListId,

    /** The local date and time when the project was last modified. */
    6: optional CommonTypes.IsoDateTime LastModifiedDateTime
}
