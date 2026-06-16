//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   Dsa
// Module     :   Noldus.Dsa.Communication.Contracts
// File       :   ProjectService.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 13-11-2017 Tijmen van Voorthuijsen   - Original version
//----------------------------------------------------------------------------

include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "..\\Entities\\Project.thrift"
include "..\\Types\\DataLabTypes.thrift"

namespace * Noldus.NLinx.Contracts.DataLab.Services


/** Major version of the interface.*/
const i32         interfaceVersion          = 1;

/** The name of the RabbitMQ exchange on which the communication of this service runs.*/
const string      exchange                  = "Noldus.NLinx.DataLab.ProjectService"

/** This service runs on a Direct exchange that supports one routing key. */
const string      routingKey                = "3557d915-c258-49cd-8670-f1f3704783c9"

/** The type of RabbitMQ exchange on which the communication of this service runs.*/
const CommonTypes.ExchangeType exchangeType = CommonTypes.ExchangeType.DIRECT


/** 
 *  The project service is responsible for the CRUD operation of DataLab projects.
 */
service ProjectService
{
    /**
     *  Creates a new project.
     *  @return The newly created project.
     *  @Exception: (1) throws application exception when the index of the project argument is non-zero.
     */
    Project.Project   NewProject(
    /** Data about the new project to be created. The id of this project must be zero to indicate that it is not an existing project but a new to be created project.*/
    1: Project.Project project
    ) throws(1: DataLabTypes.SystemException sysEx, 2 : DataLabTypes.ApplicationException appEx);


    /**
     *  Get a list of all existing experiments 
     *  @return A list of all existing experiments.
     *  @Exception: None.
     */
    list<Project.Project>   GetProjects() throws(1: DataLabTypes.SystemException sysEx, 2 : DataLabTypes.ApplicationException appEx);
}
