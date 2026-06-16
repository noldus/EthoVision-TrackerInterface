//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Common Contracts
// File       :   Program.thrift
//----------------------------------------------------------------------------
// Revisions  :
//----------------------------------------------------------------------------
include "..\\Types\\CommonTypes.thrift"
include "..\\Types\\ProgramTypes.thrift"
include "Computer.thrift"
include "DeviceInfo.thrift"

namespace * Noldus.NLinx.Contracts.Common

/** A software program that can be controled by N-Linx.*/
struct Program
{
    /** A identifier of the installed software, for example the GUID that the MSI installer uses. An identifier 
     *  is optional but can help in uniquely identifying the same programs in the network.*/
    1: required CommonTypes.GUID programId,

    /** The name of the program, normally the name you see in the list of installed software.*/
    2: optional string programName,

    /** The name of the computer on which the progrom is installed, ussually the name you can see for example in Programs and Features.*/
    3: optional string computerName,

    /** A unique guid of the computer, for example the guid found in the Windows registry at SOFTWARE Microsoft Cryptography.*/
    4: optional CommonTypes.GUID computerId,

    /** Defines the role of the N-Linx program. It is important to fill in this field because it allows recipients to take specific actions based on the role.*/
    5: optional ProgramTypes.ERole role = ProgramTypes.OTHER,

    /** The device info is an optional field that is only available for processes with ERole.PRODUCER. It provides additional information on
    *   the physical or software device that collects the data.*/
    6: optional DeviceInfo.DeviceInfo deviceInfo,
}
