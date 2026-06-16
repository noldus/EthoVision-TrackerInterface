//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Common Contracts
// File       :   Control.thrift
//----------------------------------------------------------------------------
// Revisions  :
//----------------------------------------------------------------------------
include "..\\Types\\CommonTypes.thrift"
include "..\\Types\\ProgramTypes.thrift"

namespace * Noldus.NLinx.Contracts.Common

/** Information about Master-Slave relationships in N-Linx. Normally you set a process as a slave of a master process.*/
struct MasterSlave
{
    /** Indicates if the process is enabled for remote control of start-stop. If the process is disabled it should not respond to start
     *  and stop recording commands.*/
    1: optional bool enabled,

    /** Specify true if this process controls another process and if that other process has the slaveOf set the this master.*/
    2: optional bool amIMaster,

    /** Specifies the process ID of the master that controls this process. If not specified or zero it means that this process
     *  is not cntrolled by a master for start-stop recording. Check in the recording command that the slaveOf is indeed equal to
     *  the sender/master ID.*/
    3: optional CommonTypes.GUID slaveOf,
}
