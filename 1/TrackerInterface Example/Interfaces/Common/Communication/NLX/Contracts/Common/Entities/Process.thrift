//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Common Contracts
// File       :   Process.thrift
//----------------------------------------------------------------------------
// Revisions  :
//----------------------------------------------------------------------------
include "..\\Types\\CommonTypes.thrift"
include "..\\Types\\ProgramTypes.thrift"
include "MasterSlave.thrift"
include "Recording.thrift"
include "Configuration.thrift"
include "DeviceInfo.thrift"
include "ProcessorInfo.thrift"

namespace * Noldus.NLinx.Contracts.Common

/** A process is a running instance of a software program that can be controled by N-Linx.*/
struct Process
{
    /** Unique identifier of the running process. Each time an application starts a new GUID is created.*/
    1: required CommonTypes.GUID processId,
    
    /** The name of the running process. This can be the name of the installed application but better is to supply a unique
     *  name so that it is more easily to distinguish the name in a list of all processes.*/
    2: optional string processName,

    /** The status of the process.*/
    3: optional ProgramTypes.EProcessStatus processStatus,

    /** Information about the installed program.*/
    4: optional string programName,

    /** The name of the computer on which this process runs. This name is normally the name you find in for example Windows Program and Features.*/
    5: optional string computerName,

    /** The unique ID of the computer on which the process runs, for example the guid found in the Windows registry at SOFTWARE Microsoft Cryptography.*/
    6: optional CommonTypes.GUID computerId,

    /** Defines the recording settings like the status and if the recording has been enabled for remote control.*/
    7: optional Recording.Recording recording,

    /** A identifier of the installed software, for example the GUID that the MSI installer uses. An identifier 
     *  is optional but can help in uniquely identifying the same programs in the network.*/
    8: optional CommonTypes.GUID programId,

    /** Defines the role of the N-Linx process. It is important to fill in this field because it allows recipients to take specific actions based on the role.*/
    9: optional ProgramTypes.ERole role = ProgramTypes.OTHER,

    /** Defines the role of the N-Linx process.*/
    10: optional ProgramTypes.EProcessType processType = ProgramTypes.OTHER,

    /** The device info is an optional field that is only available for processes with ERole.PRODUCER. It provides additional information on
    *   the physical or software device that collects the data.*/
    11: optional DeviceInfo.DeviceInfo deviceInfo,

    /** The current log level of the process.*/
    12: optional CommonTypes.ELogLevel logLevel,

    /** The processor info is an optional field that is only available for processes with ERole.PROCESSOR. It provides additional information on
    *   the software process that processes input data into output data.*/
    13: optional ProcessorInfo.ProcessorInfo processorInfo
}

