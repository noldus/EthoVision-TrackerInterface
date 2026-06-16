//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   MRR
// Module     :   Noldus.Mrr.Contracts
// File       :   Machine.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 28-04-2015 Jeroen Diederix           - Original version
//----------------------------------------------------------------------------
include "..\\Types\\VisoTypes.thrift"
include "..\\..\\Common\\Types\\CommonTypes.thrift"


namespace csharp Noldus.NLinx.Contracts.Viso.Entities
namespace * Noldus.NLinx.Contracts.Viso



/**
 *  Represents a physical (or virtual) computer machine.
 */
struct Machine
{
    /**  A unique identifier of the file. */
    1: optional i32 id,

    /** A unique guid to identify the machine */
    2: optional CommonTypes.GUID machineId,

    /** The name of the machine. */
    3: optional string name,

    /** A description of this machine. */
    4: optional string description,

    /** The recording folder path */
    5: optional string recordingFolder,

    /** A flag that indicates that the machine is online or not. */
    6: optional VisoTypes.EMachineStatus status,

    /** The creation date and time of this machine entity. */
    7: optional CommonTypes.IsoDateTime creationDateTime,

    /** User presistancy setting which specifies if the machine is expanded in the user's view. */
    8: optional bool IsExpanded
}

