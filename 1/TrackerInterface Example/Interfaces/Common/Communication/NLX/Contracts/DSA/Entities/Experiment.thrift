//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   Dsa
// Module     :   Noldus.Dsa.Communication.Contracts
// File       :   Experiment.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 31-10-2017 Tijmen van Voorthuijsen   - Original version
//----------------------------------------------------------------------------

include "..\\..\\Common\\Types\\CommonTypes.thrift"

namespace * Noldus.NLinx.Contracts.DataLab.Entities


/** 
 *  An experiment.
 */
struct Experiment
{
    /** A unique identifier of the experiment. */
    1: required i32 id,

    /** The user-friendly name of the experiment. */
    2: required string name,   

    /** The local date and time when the experiment was created on the server. */
    3: optional CommonTypes.IsoDateTime CreationDate,
}

