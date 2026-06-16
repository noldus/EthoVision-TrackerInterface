//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   SessionService.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 04-02-2019 Dragana Verpoort Petric   - Original version
//----------------------------------------------------------------------------

include "..\\Types\\CommonTypes.thrift"
include "..\\Entities\\Session.thrift"
include "..\\Entities\\AcquisitionSettings.thrift"
include "..\\..\\Public\\Entities\\Video.thrift"
include "CommonService.thrift"

namespace * Noldus.NLinx.Contracts.Public

/** Version of the interface.*/
const i32         interfaceVersion          = 1;
/** The name of the RabbitMQ exchange on which the communication of this service runs.*/
const string      exchange                  = "Noldus.NLinx.Public.SessionService"
/** The session service runs on a direct exchange.*/
const CommonTypes.ExchangeType exchangeType = CommonTypes.ExchangeType.DIRECT

const string      routingKey                = "216c3177-424e-4578-838a-0b53349b9e5c"

/** 
* The command interface to operate the session service. The session service is responsible for 1) orchestration of a live recording of a session, and 2) the CRUD
* operations of a session.
*/
service SessionService extends CommonService.CommonService
{
    /**
    *  Creates a new session in preparation for live data recording. 
    *  @return Session - The created session.
    */
    Session.Session NewSession(
        ) throws(1: CommonTypes.SystemException appEx, 2: CommonTypes.ApplicationException sysEx);

    /**
    *  Updates a session with new properties. The session must exist otherwise an exception is thrown.
    *  @return Session - The same session with updated information.
    */
    Session.Session UpdateSession(
            /** Must be a valid and existing session. */
            1: Session.Session session
        ) throws(1: CommonTypes.SystemException sysEx, 2: CommonTypes.ApplicationException appEx);

    /**
    *  Checks if renaming of a session to the proposed name is allowed. The session must exist otherwise an exception is thrown.
    *  @return true if renaming to proposed name is allowed.
    */
    bool IsSessionNameUnique(
            /** Must be a valid and existing session. */
            1: CommonTypes.GUID sessionId, 
            /** Proposed new name for session. */
            2: string sessionName,
            /** Associated project. Must be a valid and existing project. */
            3: CommonTypes.GUID projectId
        ) throws(1: CommonTypes.SystemException sysEx, 2: CommonTypes.ApplicationException appEx);

    /**
    *  Updates a finsihed session with new name. The session must exist otherwise an exception is thrown.
    *  @return Session - The same session with updated information.
    */
    Session.Session UpdateFinishedSessionName(
            /** Must be a valid and existing session. */
            1: CommonTypes.GUID sessionId,
            /** New name for the session. */
            2: string newSessionName,
            /** Associated project. Must be a valid and existing project. */
            3: CommonTypes.GUID projectId
        ) throws(1: CommonTypes.SystemException sysEx, 2: CommonTypes.ApplicationException appEx);

    /**
    *  Updates a session with information from externally recorded videos.
    *  @return Session - The same session, updated as in storage.
    */
    Session.Session AddVideosToSession(
            /** Must be a valid and existing session. */
            1: CommonTypes.GUID sessionId,
            /** A list of videos that were recorded for this session and should be associated with this session.*/
            2: list<CommonTypes.GUID> recordedVideos
        ) throws(1: CommonTypes.SystemException sysEx, 2: CommonTypes.ApplicationException appEx);

    /**
    *  Get session based on specified id of the session.
    *  @return A session with specified id.
    */
    Session.Session GetSession(
            /** Unique identifier of a session. The Id must be valid. */
            1: CommonTypes.GUID id,
        ) throws(1: CommonTypes.ApplicationException appEx, 2: CommonTypes.SystemException sysEx);

    /**
    *  Get a list of all sessions. All sessions include sessions in the process of recording and sessions that are finished recording.
    *  @return A list of all sessions in the session service.
    */
    list<Session.Session> GetAllSessions(
        ) throws(1: CommonTypes.SystemException appEx, 2: CommonTypes.ApplicationException sysEx);

    /**
    *  Get a list of sessions for all the supplied sessionIds. 
    *  @return A list of sessions for the supplied sessionIds
    */
    list<Session.Session> GetSessions(
            /** List of sessionIds. The Ids must be valid. */
            1: list<CommonTypes.GUID> sessionIds,
        ) throws(1: CommonTypes.SystemException appEx, 2: CommonTypes.ApplicationException sysEx);

    /**
    *  Reduce the list of supplied sessionIds to only the Ids representing valid sessions. 
    *  @return A list of Ids of valid sessions only
    */
    list<CommonTypes.GUID> FilterSessionIds(
            /** List of sessionIds. */
            1: list<CommonTypes.GUID> sessionIds,
        ) throws(1: CommonTypes.SystemException appEx, 2: CommonTypes.ApplicationException sysEx);

    /**
    *  Deletes a list of sessions and all its related resources, for example related gaze data.
    *  And deletes the reference of specified project to the deleted sessions.
    *  @return void.
    *  @Exception: (1) throws application exception when one of the indices of the sessions is a zero guid.
    */
    void   DeleteSessions(
            /** Unique identifiers of the sessions to be deleted. All must be part of specified project.*/
            1: list<CommonTypes.GUID> sessionIds,
            /** Associated project. Must be a valid and existing project or Guid.Empty is no project associated to the sessions. */
            2: CommonTypes.GUID projectId
        ) throws(1: CommonTypes.SystemException appEx, 2: CommonTypes.ApplicationException sysEx);
}


/**
 *  Information on a started session recording.
 */
struct StartSessionResult
{
    /** The new session that has been created and is in recording state. The session contains information about the start date and time of the recording.*/
    1: optional Session.Session session,
}

/**
 *  Information on a stopped session recording.
 */
struct StopSessionResult
{
    /** The session which was stopped and updated.*/
    1: optional Session.Session session,
}

/**
 *  Information on result of import session action.
 */
struct ImportSessionResult
{
    /** The new session(s) that were created.*/
    1: optional list<Session.Session> sessions,
}
