//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   Dsa
// Module     :   Noldus.Dsa.Communication.Contracts
// File       :   Project.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 13-11-2017 Tijmen van Voorthuijsen   - Original version
//----------------------------------------------------------------------------

include "..\\..\\Common\\Types\\CommonTypes.thrift"

namespace * Noldus.NLinx.Contracts.DataLab.Entities


/** 
 *  A DataLab project holds information about one observational study.
 */
struct Project
{
    /** A unique identifier of the project. */
    1: required CommonTypes.GUID id,

    /** The user-friendly name of the project. */
    2: required string name,   

    /** The local date and time when the project was created on the server. */
    3: optional CommonTypes.IsoDateTime CreationDate,
}

