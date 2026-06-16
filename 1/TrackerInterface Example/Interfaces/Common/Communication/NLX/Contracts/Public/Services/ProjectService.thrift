//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   ProjectService.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 08-10-2019 Tijmen van Voorthuijsen   - Original version
//----------------------------------------------------------------------------

include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "..\\Entities\\Project.thrift"
include "..\\..\\Common\\Interfaces\\CommonService.thrift"


namespace * Noldus.NLinx.Contracts.Public.Services


/** Major version of the interface.*/
const i32         interfaceVersion          = 1;

/** The name of the RabbitMQ exchange on which the communication of this service runs.*/
const string      exchange                  = "Noldus.NLinx.Public.ProjectService"

/** This service runs on a Direct exchange that supports one routing key. */
const string      routingKey                = "364bf3be-fb4f-44ce-87f8-4c7061e11b59"

/** The type of RabbitMQ exchange on which the communication of this service runs.*/
const CommonTypes.ExchangeType exchangeType = CommonTypes.ExchangeType.DIRECT


/** 
 *  The project service is responsible for (1) CRUD operation of projects, (2) managing the relationships to collected data, e.g. sessions.
 */
service ProjectService extends CommonService.CommonService
{
    /**
     *  Creates a new project.
     *  @return The newly created project.
     *  @Exception: (1) throws application exception when the index of the project argument is non-zero.
     */
    Project.Project CreateProject(
            /** Data about the new project to be created. The id of this project must be zero, as to indicate that it is not an existing project that is already registered in storage.*/
            1: Project.Project project
        ) throws(1: CommonTypes.SystemException sysEx, 2: CommonTypes.ApplicationException appEx);

    /**
     *  Deletes a project and all its related resources, for example related sessions. These related resources are most of the times located in
     *  other services. The delete project method calls the deletion of related resources in other services but doesn't actual implement the 
     *  actual deletion, that is a responsibility of the other services.
     *  @return void.
     *  @Exception: (1) throws application exception when the index of the project argument is a zero guid.
     */
    void DeleteProject(
            /** Information about the project to be deleted, basically only the entity ID is enough.*/
            1: CommonTypes.GUID projectId
        ) throws(1: CommonTypes.SystemException sysEx, 2: CommonTypes.ApplicationException appEx);

    /**
     *  Get a list of all existing projects. Included per project a list of Ids of valid sessions only!
     *  @return A list of all existing projects, unordered, i.e. in the same order as is stored in persistent storage.
     *  @Exception: None.
     */
    list<Project.Project> GetProjects() throws(1: CommonTypes.SystemException sysEx, 2: CommonTypes.ApplicationException appEx);


    /**
     *  Updates a project with new properties. The project must exist otherwise an exception is thrown.
     *  @return Project - The same project with updated information.
     */
    Project.Project AddSession(
            /** Identifier of an existing project. This identifier is guaranteed to be unique within the platform.*/
            1:  CommonTypes.GUID projectId,
            /** Identifier of a session. This identifier is guaranteed to be unique within the platform. If the identifier is not filled in, it indicates a new session.*/
            2:  CommonTypes.GUID sessionId
        ) throws(1: CommonTypes.SystemException sysEx, 2: CommonTypes.ApplicationException appEx);


    /**
    *  Get a list of only the valid sessions for the specified project.
    *  @return A list of valid sessions in the session service, for specified project.
    */
    list<CommonTypes.GUID> GetSessions(
            /** Identifier of an existing project. This identifier is guaranteed to be unique within the platform.*/
            1:  CommonTypes.GUID projectId
        ) throws(1: CommonTypes.SystemException sysEx, 2: CommonTypes.ApplicationException appEx);


    /**
    *  Get a list of only the completed sessions for the specified project.
    *  @return A list of completed sessions in the session service, for specified project.
    */
    list<CommonTypes.GUID> GetCompletedSessions(
            /** Identifier of an existing project. This identifier is guaranteed to be unique within the platform.*/
            1:  CommonTypes.GUID projectId
        ) throws(1: CommonTypes.SystemException sysEx, 2: CommonTypes.ApplicationException appEx);


    /**
     *  Removes the reference to a session from the project's session list. The project must exist otherwise an exception is thrown.
     *  @return void.
     */
    void RemoveSession(
            /** Identifier of an existing project. This identifier is guaranteed to be unique within the platform.*/
            1:  CommonTypes.GUID projectId,
            /** Identifier of a session. This identifier is guaranteed to be unique within the platform. If the identifier is not filled in, it indicates a new session.*/
            2:  CommonTypes.GUID sessionId
        ) throws(1: CommonTypes.SystemException sysEx, 2: CommonTypes.ApplicationException appEx);

    /**
    *  Get project based on specified id of the project, including a list of Ids of valid sessions only!
    *  @return A project with specified id.
    */
    Project.Project GetProject(
            /** Identifier of an existing project. This identifier is guaranteed to be unique within the platform.*/
            1:  CommonTypes.GUID projectId
        ) throws(1: CommonTypes.SystemException sysEx, 2: CommonTypes.ApplicationException appEx);

    /**
    * Checks if supplied project name is unique for the specified existing project or for a new project (projectId == null).
    * @return true if (re)naming to proposed name is allowed based on uniqueness. It does NOT consider other validity factors!
    */
    bool IsProjectNameUnique(
            /** Must be a valid and existing project. */
            1: CommonTypes.GUID projectId, 
            /** Proposed new name for project. */
            2: string projectName
        ) throws(1: CommonTypes.SystemException sysEx, 2: CommonTypes.ApplicationException appEx);

    /**
    *  Updates a project with a new name. The project must exist otherwise an exception is thrown.
    *  @return Project - The same project with updated information.
    */
    Project.Project UpdateProjectName(
            /** Identifier of an existing project. This identifier is guaranteed to be unique within the platform.*/
            1:  CommonTypes.GUID projectId,
            /** New name for the project. */
            2:  string newProjectName
        ) throws(1: CommonTypes.SystemException sysEx, 2: CommonTypes.ApplicationException appEx);

    /**
    *  Updates the LastModified DateTime of the specified project. The project must exist otherwise an exception is thrown.
    *  @return Project - The same project with updated lastModifiedDateTime.
    */
    Project.Project UpdateProjectLastModifiedDateTime(
            /** Identifier of an existing project. This identifier is guaranteed to be unique within the platform.*/
            1:  CommonTypes.GUID projectId
        ) throws(1: CommonTypes.SystemException sysEx, 2: CommonTypes.ApplicationException appEx);

}
