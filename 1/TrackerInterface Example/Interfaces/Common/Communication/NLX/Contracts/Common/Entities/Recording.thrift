//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Common Contracts
// File       :   Recording.thrift
//----------------------------------------------------------------------------
// Revisions  :
//----------------------------------------------------------------------------
include "..\\Types\\CommonTypes.thrift"
include "..\\Types\\ProgramTypes.thrift"
include "Configuration.thrift"
include "MasterSlave.thrift"

namespace * Noldus.NLinx.Contracts.Common

/** The Recording entity defines a live recording or acquisition in a process. A recording can be controlled for start-stop
 *  by a master process which is specified by the MasterSlave property. Application-specific settings for a next recording 
 *  can be specified by the configuration property.
 */
struct Recording
{
    /** The status of the start-stop recording cycle.*/
    1: optional ProgramTypes.ERecordingStatus recordingStatus,

    /** A configuration used in the next recording.*/
    2: optional Configuration.Configuration configuration,

    /** Information about the master that is controlling a slave.*/
    3: optional MasterSlave.MasterSlave masterSlave,
}

