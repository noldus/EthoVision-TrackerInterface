//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Common Contracts
// File       :   ProgramService.thrift
//----------------------------------------------------------------------------
// Revisions  :
//----------------------------------------------------------------------------
include "..\\Types\\CommonTypes.thrift"
include "..\\Entities\\Computer.thrift"
include "..\\Entities\\Program.thrift"
include "CommonService.thrift"

namespace * Noldus.NLinx.Contracts.Common


// Settings for this service

/** Version of the interface.*/
const i32         interfaceVersion          = 1;
/** The name of the RabbitMQ exchange on which the communication of this service runs.*/
const string      exchange                  = "Noldus.NLinx.Common.ProgramService"
/** The first routing key that all running processes should be listening on.*/
const string      mainRoutingKey            = "All"
/** This service runs on a topic exchange that supports multiple routing keys. For this service two routing keys are used:
 *  1. The mainRoutingKey as defined above.
 *  2. The GUID of a process when you want to target a specific process, e.g. used in the StartRecording method.
*/
const CommonTypes.ExchangeType exchangeType = CommonTypes.ExchangeType.TOPIC


/** 
*   The program service is responsible for querying a list of programs on computers
*   in a N-Linx connected network. This server site of the service is implemented by the
*   N-Linx Agent. The N-Linx Agent must be running on a computer in order to get a listing
*   of the programs for that computer.
*/
service ProgramService extends CommonService.CommonService
{
    /** Send a request to all N-Linx Agents to return the programs that can be launched on their computer.*/
    oneway void			    RequestProgramListing   ();

    /** Listen to changes in computer information.*/
    oneway void             UpdateComputer          (   /** Updated information about a computer c.g. N-Linx Agent.*/
                                                        1: Computer.Computer computer
                                                    );

    /** Listen to newly added or changes in programs.*/
    oneway void 		    UpdatePrograms          (   /** The computer c.g. N-Linx Agent where the programs have changed.*/
                                                        1: Computer.Computer computer, 
                                                        /** List of added, changed programs.*/
                                                        2: list<Program.Program> updatedPrograms
                                                    );

    /** Launch a N-Linx enabled program on a given computer.*/
    void                    Run                     (   /** The computer on which you want to start the program. Select one of the computers you retrieved from UpdatePrograms.*/
                                                        1: Computer.Computer computer,
                                                        /** The program that you want to launch.*/
                                                        2: Program.Program program
                                                    ) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);

}
    