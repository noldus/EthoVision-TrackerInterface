//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Viso Contracts
// File       :   SessionService.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 07-11-2014 Tijmen van Voorthuijsen   - Original version
//----------------------------------------------------------------------------
include "..\\Entities\\Session.thrift"
include "..\\Entities\\SessionInvite.thrift"
include "..\\Entities\\EventLog.thrift"
include "..\\Entities\\Event.thrift"
include "..\\Entities\\CodesList.thrift"
include "..\\Entities\\Stream.thrift"
include "..\\Entities\\Media.thrift"
include "..\\Entities\\RemoteCommand.thrift"
include "..\\Entities\\SessionRoomMedia.thrift"
include "..\\Types\\VisoTypes.thrift"
include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "..\\..\\Common\\Interfaces\\CommonService.thrift"

namespace csharp Noldus.NLinx.Contracts.Viso.Services
namespace * Noldus.NLinx.Contracts.Viso

// Settings for this service
const i32         interfaceVersion  = 2;
const string      exchange          = "Noldus.NLinx.Viso.SessionService"
const string      routingKey        = "EAF6A7F6-6787-40B0-918B-17FBA58919DB"


/**
 *  The result of open session
 */
enum EOpenSessionResult
{
    /** Unknown result */
    Unknown = 0,

    /** Opened succesfully */
    Success = 1,

    /** Open failed */
    Failed = 2,

    /** Start partially succesfull (some streams failed but streaming is ongoing) */
    PartialSuccess = 3
}


/**
 *  Small return class for TryOpenSession
 */
struct OpenSessionResult
{
    /** The result of opening the session */
    1:  optional EOpenSessionResult result,

    /** The viedeo streams created for the session */
    2:  optional list<Stream.Stream> streams,
}


/**
 *  The result of start session
 */
enum EStartSessionResult
{
    /** Unknown result */
    Unknown = 0,

    /** Session started succesfully */
    Success = 1,

    /** Session failed to start, no reason give */
    Failed = 2,

    /** Session failed to start, not enough disk space */
    NotEnoughFreeSpace = 3,

    /** Starting the recorder timed out because the recorder seems unresponsive.*/
    StartRecorderTimedOut = 4
}


/**
 *  Small return class for TryStartSession
 */
struct StartSessionResult
{
    /** The result of starting the session */
    1:  optional EStartSessionResult result,

    /** The session object for the started session */
    2: optional Session.Session session,
}

/**
 *  Small return class for TryImportSession
 */
struct ImportSessionResult
{
    /** The result of importing the session */
    1:  optional EStartSessionResult result,

    /** The session object for the imported session */
    2: optional Session.Session session,
}


/**
 *  Small return class entering TryStartSession
 */
struct StartSessionArgs
{
    /** A valid and existing list of rooms must be supplied. */
    1:  list<i32> roomIds,
    /** A valid and existing user id must be supplied. */
    2:  i32 sessionCreatorId,
    /** A list of session invite id's must be supplied. */
    3:  list<i32> inviteIds,
    /** A name for the session. */
    4:  string sessionName,
    /** An optional id of an appointment when this is triggered by one */
    5:  i32 appointmentId,
    /** A session starting type */
    6:  VisoTypes.ESessionStartingType startingType  
}

/**
 *  The result of stopping a session
 */
enum EStopSessionResult
{
    /** Unknown result.*/
    Unknown = 0,

    /** Stopping successful.*/
    Success = 1,

    /** General failure while stopping the session.*/
    Failed = 2,

    /** Stopping the recorder timed out because the recorder seems unresponsive.*/
    StopRecorderTimedOut = 3
}


/**
 *  Small return class for TryStopSession
 */
struct StopSessionResult
{
    /** Result of stopping the session */
    1:  optional EStopSessionResult result,

    /** The session that was stoppend */
    2:  optional Session.Session session,
}


/**
 *  Small return class for GetActiveSession
 */
struct ActiveSessionResult
{
    /** When there is an active session this value is ! null */
    1:  optional Session.Session session,
}


/**
 *  Small return class for TryRemoveSession
 */
struct RemoveSessionResult
{
    /** Result of try remove */
    1:  optional VisoTypes.ERemoveSessionResult result,

    /** files that could not be removed */
    2: optional list<string> failedFiles,

    /** The Id of the session that was tried to be removed*/
    3: optional i32 sessionId
}


/**
 *  Small return class for GetLastSessionForRoom
 */
struct LastSessionResult
{
    /** When there is a last session for room this value is ! null */
    1:  optional Session.Session session,
}

struct SessionNameResult
{
    /** When there is an active session this value is ! null */
    1:  optional string DefaultName,
    2:  optional bool   EditOnSave,
    3:  optional bool   UseDefaultName,

}


/**
 *  The result of locking a session
 */
enum ELockSessionResult
{
    /** Result unknown */
    Unknown = 0,

    /** Successfully locked */
    Success = 1,

    /** Already locked by the same user */
    LockedBySameUser = 2,

    /** Locking failed, locked by another user */
    LockedByOtherUser = 3, 

    /** Locking failed, user has no permission to lock session */
    NoPremissionToLock = 4
}


/**
 *  Small return class for GetSessionInvitesFromAppointments
 */
struct SessionInviteFromApptResult
{
    /** Session invite ids that should be updated */
    1:  optional SessionInvite.SessionInvite sessionInvite,

    /** The Ids of the appointments where the invites were found */
    2: optional i32 appointmentId,

    /** The subjects of the appointments where the invites were found */
    3: optional string subject,

    /** List of location ids in the appointment */
    4: optional list<i32> locationIds,

    /** List of location names in the appointment */
    5: optional list<string> locationNames,

    /** The status of appointment. */
    6: optional VisoTypes.ECombinedStatus appointmentStatus,

    /** The start date and time in the appointment is in the future. */
    7: optional bool IsStartTimeLater
}


/**
 * Enum for destination location for imported videos
 */
enum EDestinationLocationForImportedVideos
{
    /** Unknown result */
    Unknown = 0,

    /** Found */
    Found = 1,

    /** Not found */
    NotFound = 2,

    /** Not enough space */
    NotEnoughSpace = 3,

    /** Locations are not reachable */
    NotReachable = 4
}


/**
 *  Small return class for GetDestinationLocationForImportedVideos
 */
struct DestinationLocationForImportedVideosResult
{
    /** Result of destination location for imported videos */
    1:  optional EDestinationLocationForImportedVideos result,

    /** The destination location */
    2:  optional string location,
}


/** 
 *  The session service is responsible for creating new live recordings and for retrieving recorded sessions.
 */
service SessionService extends CommonService.CommonService
{
   /** 
     *  Get all the sessions from all rooms regardless of their state.
     *  This function can be called only by the manager classes.
     *  @return List<Session> - The list of all sessions
     */
    list<Session.Session> GetAllSessions() throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

    /** 
     *  Get a list of unfinished sessions from all rooms. A session is considered as unfinished if it does not have a valid stop time. 
     *  Only the sessions are returned that the current user is allowed to see.
     *  @return List<Session> - The list of all unfinished sessions
     */
    list<Session.Session> GetUnfinishedSessions() throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

    /** 
     *  Get a list of finished sessions from all rooms. A session is considered as finished if it has a valid stop time. 
     *  Only the sessions are returned that the current user is allowed to see.
     *  @return List<Session> - The list of all finished sessions
     */
    list<Session.Session> GetSessions() throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


     /** 
     *  Get a list of unfinished sessions for the current user. 
     *  Only the sessions are returned that the current user is allowed to see.
     *  @return List<Session> - The list of all unfinished sessions
     */
    list<Session.Session> GetUnfinishedSessionsForUser() throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

    
    /**
     *  Get the Media for the specified Id.
     *  @return Media - The requested Media object
     */
    Media.Media GetMedia(
            /** A valid one-based index. */
            1: i32 mediaId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Get the event log for the specified Id.
     *  @return Eventlog - The requested event log
     */
    EventLog.EventLog GetEventLog(
            /** A valid one-based index. */
            1: i32 eventLogId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Opens a new session of a room and puts the associated MRR Recorder in streaming mode.
     *  @return OpenSessionResult - An object that contains the open session result
     */
    OpenSessionResult TryOpenSession(
            /** A valid and existing room must be supplied. */
            1:  i32 roomId, 
            /** Refresh UMR videos, if this variable is true and if this refresh doesn't break another stream or recording. */
            2:  bool forceRefresh
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


   /**
    *  Starts recording a new session for the specified room and adds a new session to the system.
    *  @return StartSessionResult - An object that contains the start session result
    */
    StartSessionResult TryStartSession(
            /** A valid and existing room must be supplied. */
            1:  i32 roomId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

   /**
    *  Starts recording a new session for the specified room and adds a new session to the system.
    *  @return StartSessionResult - An object that contains the start session result
    */
    StartSessionResult TryStartSessionWithArgs(
            /** A valid and existing room must be supplied. */
            1:  StartSessionArgs sessionArgs
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

    /**
     *  Stops a recording session for the specified room and updates the session. It also stops the MRR Recorder
     *  associated with the room except when a stop time has been specified. When a stop time has been specified
     *  it assumes that the recording was stopped otherwise.
     *  @result StopSessionResult - the result of stopping the session
     */
    StopSessionResult TryStopSession(
            /** Must specify a valid and existing room. */
            1: i32  roomId,
            /** optinally the new session name can be set */
            2:  string sessionName

        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

    /**
    *  Starts recording a new session for the specified rooms and adds a new session to the system.
    *  @return StartSessionResult - An object that contains the start session result
    */
    StartSessionResult TryStartCompositeSession(
            /** A list of valid and existing rooms must be supplied. */
            1:  list<i32> roomId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

     /**
     *  Stops a recording session for the specified rooms and updates the session. It also stops the MRR Recorders
     *  associated with the rooms except when a stop time has been specified. When a stop time has been specified
     *  it assumes that the recording was stopped otherwise.
     *  @result StopSessionResult - the result of stopping the session
     */
    StopSessionResult TryStopCompositeSession(
            /** Must specify a list of valid and existing rooms. */
            1: list<i32>  sessionRooms
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


     /**
     *  Stops a recording session for the specified rooms from one machine and updates the session. It also stops the MRR Recorders
     *  associated with the rooms except when a stop time has been specified. When a stop time has been specified
     *  it assumes that the recording was stopped otherwise.
     *  @result StopSessionResult - the result of stopping the session
     */
    StopSessionResult TryStopCompositeSessionOneMachine(
            /** Must specify a list of valid and existing rooms. */
            1: list<i32>  sessionRooms
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    *  Starts recording separate sessions for the specified rooms
    *  @return list<StartSessionResult> - the results of starting the sessions
    */
    list<StartSessionResult> TryStartSeparateSessions(
            /** A list of valid and existing rooms must be supplied. */
            1:  list<i32> roomId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Stops a recording separate sessions for the specified rooms. It also stops the MRR Recorder
     *  associated with the room except when a stop time has been specified. When a stop time has been specified
     *  it assumes that the recording was stopped otherwise.
     *  @result list<StopSessionResult> - the results of stopping the sessions
     */
    list<StopSessionResult> TryStopSeparateSessions(
            /** A list of valid and existing rooms must be supplied. */
            1:  list<i32> roomId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Import a session based on a list of video names.
     *  @return ImportSessionResult - An object that contains the import session result
     */
    ImportSessionResult TryImportSession(
			/** The id of the session creator, if empty, the current user will be the creator */  
			1: i32 sessionCreatorId,
            /** A list of video file names to be added to the session. */
		    2:  list<string> videos,
			/** the session name to be imported. If not specified, it'll just use a default name */
			3: string sessionName,
			/** The id of the room which is used for the import */  
			4: i32 roomId,
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Get the active session for the given room. The active session is the session that is currently been recording in the room.
     *  When there is no session recording going on the active session is null.
     *  @return ActiveSessionResult - The result on the active session, when no session is being recorder the session is null.
     */
    ActiveSessionResult GetActiveSession(
            /** A valid room id */
            1:  i32 roomId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Get the last session for the given room. The last session could be recording or not, although this function is normally called for stop recording
     *  If no sessions are found then it returns default (null)
     *  @return NMCBusEntSession - The result on the last session for the room.
     */
    LastSessionResult GetLastSessionForRoom(
            /** A valid room id */
            1:  i32 roomId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Get the matching unfinished session for the given room
     *  If no sessions are found then it returns default (null)
     *  @return NMCBusEntSession - The result on the matching unfinished session for the room.
     */
    Session.Session GetUnfinishedSessionForRoom(
            /** A valid existing room must be supplied. */
            1:  i32 roomId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Get the session for the specified Id.
     *  @return Session - The requested session
     */
    Session.Session GetSession(
            /** Unique identifier of a session. The Id must be valid. */
            1: i32 sessionId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Get the session for the specified Id to open in playback window (new way for additional audit log steps).
     *  @return Session - The requested session
     */
    Session.Session GetSessionToView(
            /** Unique identifier of a session. The Id must be valid. */
            1: i32 sessionId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


     /**
     *  Generates a new session name
     *  @return SessionNameResult - The new session name with config parameters
     */
    SessionNameResult GetNewSessionName(
    )throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Updates a session with new properties. The session must exist otherwise an exception is thrown.
     *  @return Session - The same session with updated information.
     */
    Session.Session UpdateSession(
            /** Must be a valid and existing session. */
            1:  Session.Session session
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Updates a sessions name. The session must exist otherwise an exception is thrown.
     *  @return Session - The same session with updated information.
     */
    bool UpdateSessionName(
            /** session Id */
            1: i32 sessionId
            /** New session name */
            2: string sessionName
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Unlocks session opened by user
     */
    void UnlockOpenSession(
            /** The user id */
            1: i32 userId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Removes a session from the system.
     *  @return RemoveSessionResult - The result of the remove action, in not succeded contains error information, for instance if the files are inaccesable and which files
     */
    RemoveSessionResult TryRemoveSession(
            /** Must be a valid and existing session. */
            1:  i32 sessionId, 
            /** If file errors must be ignored while deleting */
            2:  bool ignoreFileError
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Removes the given sessions from the system.
     *  @return list<RemoveSessionResult> - The list of the result with details
     */
    list<RemoveSessionResult> TryRemoveSessions(
            /** Must be valid and existing sessions. */
            1:  list<i32> sessionIds, 
            /** If file errors must be ignored while deleting */
            2:  bool ignoreFileError
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


     /**
     *  Toggle the secured flag for the sessions, protecting them from automatic delete
     */
    void ToggleSecure(
            /** Must be valid and existing sessions. */
            1:  list<i32> sessionIds, 
    ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    *  Get elapsed recorded time, if recording is started, otherwise returns negative
    *  @return long - elapsed recoded time in micro seconds
    */
    i64 GetSessionTimeInfo(
            /**A valid and existing room must be supplied. */
            1:  i32 roomId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Add an event log to a session.
     *  (an event log can be added if the session does not have an event log already)
     *  @return EventLog - the added event log
     */
    EventLog.EventLog AddEventLog(
            /** the session id */
            1:  i32 sessionId,
            /** the event log object */
            2:  EventLog.EventLog eventlog
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Set the codes list of an event log when it has none, or when no markers are scored yet
     *  @return EventLog - the modified event log
     */
    EventLog.EventLog ChangeCodesList(
            /** the event log id */
            1:  i32 evenlogId,
            /** the codes list id */
            2:  i32 codesListId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Set the codes list reference in the event log to the extended codes list
     *  @return EventLog - the modified event log
     */
    EventLog.EventLog ChangeToExtendedCodesList(
            /** the event log id */
            1:  i32 evenlogId,
            /** the codeslist id */
            2:  i32 codesListId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Add one event to an existing event log
     */
    void AddEvents(
            /** the event log id */
            1:  i32 evenlogId,
            /** the new events */
            2:  list<Event.Event> events
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Update an event in database
     *  @return Event - the modified event
     */
    Event.Event UpdateEvent(
            /** The event to update */
            1:  Event.Event eventUpdated
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Remove an event from database
     */
    void RemoveEvent(
            /** the event id */
            1:  i32 eventId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Get an event from database
     *  @return Event - The requested event
     */
    Event.Event GetEvent(
            /** the event id */
            1: i32 eventId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Try to lock a session for the current user
     *  @return ELockSessionResult - The result of locking the session
     */
    ELockSessionResult TryLockSession(
            /** Session to be locked */
            1:  i32 sessionId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Unlock the session when the current user locked it
     */
    void UnlockSession(
            /** Session to be unlocked */
            1:  i32 sessionId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Adds a new session invite to the data base
     */
    SessionInvite.SessionInvite AddSessionInvite(
            /** The session invite object */
            1:  SessionInvite.SessionInvite sessionInvite
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

    /**
     *  Updates a session invite in the data base
     */
    SessionInvite.SessionInvite UpdateSessionInvite(
            /** The session invite object */
            1:  SessionInvite.SessionInvite sessionInvite
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Loads the specified session invite from the data base
     */
    SessionInvite.SessionInvite GetSessionInvite(
            /** The session invite id */
            1:  i32 sessionInviteId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Removes the session invite from the data base
     */
    void RemoveSessionInvite(
            /** The session invite id */
            1:  i32 sessionInviteId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

        
    /**
     *  Removes the session invites for one user
     */
    void RemoveSessionInvitesForUser(
            /** The user id */
            1:  i32 userId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);



    /**
     *  Gives back all the invitations set for the specified session, only for non-removed users.
     */
    list<SessionInvite.SessionInvite> GetSessionInvitesBySession(
            /** The session id */
            1: i32 sessionId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Gives back the session invite objects defined for the given session, for all users, including the removed ones.
     */
    list<SessionInvite.SessionInvite> GetAllSessionInvitesBySession(
            /** The session id */
            1: i32 sessionId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Gives back all the invitations set for the given user (where the user is invited to)
     */
    list<SessionInvite.SessionInvite> GetSessionInvitesByUser(
            /** The user id */
            1: i32 userId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

            
    /**
     *  Return all the invitations defined by the given user
     */
    list<SessionInvite.SessionInvite> GetSessionInvitesOfUser(
            /** The user id */
            1: i32 userId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Return all the invitations defined for a given group
     */
    list<SessionInvite.SessionInvite> GetSessionInvitesOfGroup(
            /** The group id */
            1: i32 groupId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /** DEPRECATED since R11. Use GetActiveSessionInvitesByLocationUser instead. */
    /**
     * Gives back the active session invite objects defined for the given location, only for non-removed users.
     * It excludes invites for scheduled sessions in future. 
     * These are the invites where the session is still not started or still not stopped,
     * so there is still no finished session to open.
     */
    list<SessionInvite.SessionInvite> GetActiveSessionInvitesByLocation(
            /** The room id */
            1: i32 roomId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

    /**
     * Gives back the active session invite objects defined for the given location and user.
     * It excludes invites for scheduled sessions in future. 
     * These are the invites where the session is still not started or still not stopped,
     * so there is still no finished session to open.
     */
    list<SessionInvite.SessionInvite> GetActiveSessionInvitesByLocationUser(
            /** The room id */
            1: i32 roomId,
            2: i32 userId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     * Gives back the active session invite objects defined for the given location, for all users, including the removed ones. 
     * It excludes invites for scheduled sessions in future. 
     * These are the invites where the session is still not started or still not stopped,
     * so there is still no finished session to open.
     */
    list<SessionInvite.SessionInvite> GetAllActiveSessionInvitesByLocation(
            /** The room id */
            1: i32 roomId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

  
     /**
     *  Gives back true if the given user is invited to the appointment
     */
     bool HasUserAppointmentInvite(
            /** The appointment id */
            1: i32 appointmentId
            /** The user id */
            2: i32 userId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


     /**
     *  Gives back true if the given user is invited to the session
     */
     bool HasUserSessionInvite(
            /** The session id */
            1: i32 sessionId
            /** The user id */
            2: i32 userId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

     /**
     * Gives back the active session invite objects defined for the given session and user.
     */
    list<SessionInvite.SessionInvite> GetUserSessionInvites(
            /** The session id */
            1: i32 sessionId
            /** The user id */
            2: i32 userId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


     /**
     *  Gives back true if the given invite applies to the user
     */
     bool IsInviteForUser(
            /** The invite id */
            1: i32 inviteId
            /** The user id */
            2: i32 userId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

     /**
     *  Set all the invitations set for the specified session, only for non-removed users.
     */
    list<SessionInvite.SessionInvite> AddAndRemoveInvites(
            /** The session invite objects to add */
            1: list<SessionInvite.SessionInvite> invitesToAdd,
            /** The session invite ids to remove */
            2: list<i32> invitesToRemove
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Stops a recording of a session whose owner is another user. When UM is used Technician has rights to stop
     *  recording, when UM is not used Setup user can stop recording.
     *  Stops a recording session for the specified room and updates the session. It also stops the MRR Recorder
     *  associated with the room except when a stop time has been specified. When a stop time has been specified
     *  it assumes that the recording was stopped otherwise.
     *  @result StopSessionResult - the result of stopping the session
     */
    StopSessionResult TryForceStopSession(
            /** Must specify a valid and existing room. */
            1: i32  roomId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


     /**
     *  Stops a recording of a session whose owner is another user. When UM is used Technician has rights to stop
     *  recording, when UM is not used Setup user can stop recording.
     *  Stops a recording session for the specified rooms and updates the session. It also stops the MRR Recorder
     *  associated with the rooms except when a stop time has been specified. When a stop time has been specified
     *  it assumes that the recording was stopped otherwise.
     *  @result StopSessionResult - the result of stopping the session
     */
    StopSessionResult TryForceStopCompositeSession(
            /** Must specify a list of valid and existing rooms. */
            1: list<i32>  roomId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


     /**
     *  Stops a recording of a separate session whose owner is another user. When UM is used Technician has rights to stop
     *  recording, when UM is not used Setup user can stop recording.
     *  Stops a recording session for the specified rooms and updates the session. It also stops the MRR Recorder
     *  associated with the rooms except when a stop time has been specified. When a stop time has been specified
     *  it assumes that the recording was stopped otherwise.
     *  @result StopSessionResult - the result of stopping the session
     */
    list<StopSessionResult> TryForceStopSeparateSession(
            /** Must specify a list of valid and existing rooms. */
            1: list<i32>  roomId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Stops a recording of a session when all recorders in session stopped
     *  @result StopSessionResult - the result of stopping the session
     */
    StopSessionResult TryForceStopSessionRecordersCrashed(
            /** Must specify a valid and existing rooms. */
            1: list<i32>  roomId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Stops the ongoing session which is recording in the room in which scheduled session is about to start.
     *  @result StopSessionResult - the result of stopping the session.
     */
    StopSessionResult TryForceStopByScheduledSession(
            /** Must specify a list of valid and existing rooms. */
            1: list<i32>  roomId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /** 
     *  Get the updated session invites from planned appointmens containing session invites with user.
     *  @return list<SessionInviteFromApptResult> - a list of struct with invite and appointment id.
     */
    list<SessionInviteFromApptResult> GetSessionInvitesFromAppointments(
            /** Must specify a valid and existing user id. */
            1: i32  userId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /** 
     *  Get the updated session invites from planned appointmen containing session invites with user and id
     *  @return SessionInviteFromApptResult - a with invite and appointment id.
     */
    SessionInviteFromApptResult GetSessionInviteFromAppointment(
            /** Must specify a valid and existing user id. */
            1: i32  userId,
            /** Must specify a valid and existing session invite id. */
            2: i32  sessionInviteId,
            /** Must specify an appointment id. */
            3: i32  appointmentId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /** 
     *  Check if the session invites exist in the database
     *  @return bool - true if exists.
     */
    bool IsSessionInviteExisting(
            /** Must specify an id. */
            1: i32  sessionInviteId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


   /**
    *  Update the file names only in database, files won't moved, this functions is used for fixing database
    *  @return bool - true if update was done successfully
    */
   bool UpdateSessionVideoFiles(
            /** Must be a valid and existing session. */
            1:  Session.Session session
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


   /**
    *  Get the destination location for imported videos
    *  @return DestinationLocationForImportedVideosResult - the destination location for imported videos.
    */
   DestinationLocationForImportedVideosResult GetDestinationLocationForImportedVideos(
            /** Must specify the needed free bytes. */
            1: i64  neededFreeBytes
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


   /**
    *  Check if the input video file is already in the databse
    *  @return bool - true if video file is already in the database
    */    
    bool IsVideoExistInDB(
            /** Video file to check. */
            1: string videoFile
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


   /**
    *  Adds a new remote command for the specified user to the specified room.
    * if there is already a token, just returns that one
    *  @return RemoteCommand - the newly added remote command that contains the unique token.
    */
    RemoteCommand.RemoteCommand AddRemoteCommand(
            /** The identifier of the user. */
            1: i32 userId,
            /** The identifier of the room. */
            2: i32 roomId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

   /**
    *  Adds a new remote command for the specified user to the specified room with the specified token
    *  the token should not be used yet
    *  @return RemoteCommand - the newly added remote command that contains the unique token.
    */  
   RemoteCommand.RemoteCommand AddRemoteCommandWithToken(
            /** The identifier of the user. */
            1: i32 userId,
            /** The identifier of the room. */
            2: i32 roomId,
            /** The new remote token */
            3: CommonTypes.GUID token
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

    /**
    *  Removes the remote command specified by the given user and room identifiers.
    */
    void RemoveRemoteCommand(
            /** The identifier of the user. */
            1: i32 userId,
            /** The identifier of the room. */
            2: i32 roomId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    *  Removes the remote commands specified by the given rooms.
    */
    void RemoveRemoteCommandsOfRoom(
            /** The identifier of the room. */
            2: i32 roomId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


   /**
    *  Generates a new unique token for the remote command specified by the given user and room identifiers.
    *  @return RemoteCommand - the updated remote command that contains the refreshed token.
    */
    RemoteCommand.RemoteCommand RenewRemoteCommand(
            /** The identifier of the user. */
            1: i32 userId,
            /** The identifier of the room. */
            2: i32 roomId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


   /**
    *  Returns back the remote command specified by the given user and room combination.
    *  @return RemoteCommand
    */
    RemoteCommand.RemoteCommand GetRemoteCommand(
            /** The identifier of the user. */
            1: i32 userId,
            /** The identifier of the room. */
            2: i32 roomId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


   /**
    *  Returns back the remote command specified by the given token.
    *  @return RemoteCommand
    */
    RemoteCommand.RemoteCommand GetRemoteCommandByToken(
            /** The token of the remote command. */
            1: CommonTypes.GUID token
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


   /**
    *  Returns back the remote command specified by the given token.
    *  @return RemoteCommand
    */
    list<RemoteCommand.RemoteCommand> GetRemoteCommandsOfRoom(
            /** The identifier of the room. */
            1: i32 roomId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


   /**
    *  Returns the list of remote commands stored in the database.
    *  @return list<RemoteCommand>
    */
    list<RemoteCommand.RemoteCommand> GetRemoteCommands() throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


   /**
    *  Starts recording a new session remotely for the specified token (identifying room and user) and adds a new session to the system.
    *  @return StartSessionResult - An object that contains the start session result
    */
    StartSessionResult TryStartRemote(
            /** a valid remote Token needs to be supplied which will identify the user and the room */
            1:  string remoteToken
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

    /**
     *  Stops a recording session remotely for the specified token (identifying room and user)
     *  @result StopSessionResult - the result of stopping the session
     */
    StopSessionResult TryStopRemote(
            /** a valid remote Token needs to be supplied which will identify the user and the room */
            1:  string remoteToken
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /******************* OBSOLETE FUNCTIONS REGION STARTS HERE *******************/
    
    /** OBSOLETE since R5, use GetCodesList function from the codes service instead! */
    CodesList.CodesList GetMarkerList(1: i32 markerListId) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

    /** OBSOLETE since R5, use ChangeCodesList function instead! */
    EventLog.EventLog ChangeMarkerList(1:  i32 evenlogId, 2:  i32 markerListId) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);
    
    /** OBSOLETE since R5, use this function from the room service! */
    void PTZCommand(1:  i32 roomId, 2:  i32 ptzSettingsId, 3:  VisoTypes.PtzCommandData command) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

    /** OBSOLETE since R7, Don't use this function! Only the services can set the separate sessions batch Id */
    bool SetSeparateSessionsBatchId(1: SeparateSessionsBatchArgs separateSessionsBatchArgs) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);
    
    /** OBSOLETE since R7, check the scheduler entry's SeparateBatchId property instead! */
    bool GetSessionIsSeparateSessions(1: i32 sessionId) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

    /******************* OBSOLETE FUNCTIONS REGION  ENDS  HERE *******************/
}


    /******************* OBSOLETE STRUCTS REGION STARTS HERE *******************/

    /** OBSOLETE since R7 */
    struct SeparateSessionsBatchArgs { 1: optional i32 sessionId, 2: optional CommonTypes.GUID separateSessionsBatchId }

    /******************* OBSOLETE STRUCTS REGION  ENDS  HERE *******************/