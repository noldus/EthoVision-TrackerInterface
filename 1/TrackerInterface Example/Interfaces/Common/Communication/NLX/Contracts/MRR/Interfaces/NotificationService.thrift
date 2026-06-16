//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Viso Contracts
// File       :   NotificationService.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 18-02-2015 Jeroen Diederix           - Original version
//----------------------------------------------------------------------------

namespace csharp Noldus.NLinx.Contracts.Viso.Services
namespace * Noldus.NLinx.Contracts.Viso

// Settings for this service
const i32         interfaceVersion  = 2;
const string      exchange          = "Noldus.NLinx.Viso.NotificationService"
const string      routingKey        = "00000000-0000-0000-0000-000000000000"

/**
 *  All Ids for sending change notifications from MRR Services to MRR Clients.
 */
enum EServiceNotifyId
{

    /** entityId = room id */
    RoomChanged                 = 100,
    /** entityId = room id */
    RoomAdded                   = 101,
    /** entityId = room id */
    RoomRemoved                 = 102,
    /** entityId = room id */
    RoomLockedStateChanged      = 103,
    /** entityId = room id */
    RoomUnlockedForScheduledSession      = 104,
    /** entityId = room id */
    RoomUnlockedForRemoteSession         = 105,
    /** entityId = room id */
    RecordingStoppedByRecorder  = 111,
    /** entityId = room id */
    RecordingStoppedByRecorderLowDiskSpace  = 112,
    /** entityId = recorder id */
    RecordingStoppedByTechnician  = 113,
    /** entityId = recorder id */
    RecordingStoppedForScheduledSession     = 114,
    /** entityId = recorder id */
    RemoteSessionRecordingStopped     = 115,
    /** entityId = recorder id */
    RecorderChanged             = 121,
    /** entityId = recorder id */
    RecorderExited                = 122,
    /** entityId = recorder id */
    RecorderMaxNumReached       = 123,
    /** entityId = recorder id */
    RecorderPerCompReached      = 124,
    /** entityId = room id */
    RecorderManagerExitedUnexpectedly      = 125,
    /** entityId = machine id */
    RecorderManagerExited        = 126,

    /** entityId = session id */
    SessionChanged              = 201,
    /** entityId = session id */
    SessionAdded                = 202,
    /** entityId = session id */
    SessionRemoved              = 203,
    /** entityId = schedule entry id */
    SessionStopped              = 204,

    /** entity id = session invite id */
    SessionInviteAdded          = 220,
    /** entity id = session invite id */
    SessionInviteUpdated        = 221,
    /** entity id = session invite id */
    SessionInviteRemoved        = 222,
    /** entity id = session invite id */
    SessionInviteAlert          = 223,

    /** entityId = marker id */
    MarkerChanged               = 301,
    /** entityId = marker id */
    MarkerAdded                 = 302,
    /** entityId = marker id */
    MarkerRemoved               = 303,
    /** entityId = subject id */
    SubjectChanged              = 304,
    /** entityId = subject id */
    SubjectAdded                = 305,
    /** entityId = subject id */
    SubjectRemoved              = 306,
    /** entityId = codes list id */
    CodesListExtended           = 307,

    /** entityId = event log id */
    EventLogChanged             = 401,
    /** entityId = event log id */
    EventLogAdded               = 402,
    /** entityId = event log id */
    EventLogRemoved             = 403,
    /** entityId = event log id; Special case of event log changed, used instead of EventAdded */
    EventLogChangedEventAdded   = 411,

    /** entityId = event id */
    EventChanged                = 501,
    /** entityId = event id */
    EventRemoved                = 503,

    /** entityId = user id */
    UserChanged                 = 601,
    /** entityId = user id */
    UserAdded                   = 602,
    /** entityId = user id */
    UserRemoved                 = 603,
    /** entityId = user id */
    UserLoggedInOnAnotherDevice = 620,
    /** entityId = user id */
    UserToEditLoggedOut         = 621,
    /** entityId = user id */
    UserLoginStatusChanged      = 622,
    /** entityId = user id */
    UserLoginExpired            = 623,
    /** entityId = user id */
    UsersSettingsChanged        = 624,

    /** entityId = machine id */
    MachineChanged              = 701,
    /** entityId = machine id */
    MachineAdded                = 702,
    /** entityId = machine id */
    MachineRemoved              = 703,
    /** entityId = machine id */
    MachineStatusChanged        = 704,

    /** entityId = appointment id */
    AppointmentChanged          = 801,
    /** entityId = appointment id */
    AppointmentAdded            = 802,
    /** entityId = appointment id */
    AppointmentRemoved          = 803,
    /** entityId = appointment id */
    AppointmentReminded         = 804,
    /** entityId = appointment id */
    AppointmentStarted          = 805,
    /** entityId = appointment id */
    AppointmentStopped          = 806,
    /** entityId = appointment id */
    AppointmentFailed           = 807,
    /** entityId = appointment id */
    AppointmentStarting         = 808,
    /** entityId = session id. The files of the session are about to be deleted. All clients should release access to the videos */
    SessionDeletePending        = 809,
    /** entityId = session id. The files of the session are about to be moved. All clients should release access to the videos */
    SessionMovePending          = 810,
    /** entityId = appointment id */
    AppointmentFailedDueToNotEnoughFreeSpace = 811,    

    /** entityId = group id */
    GroupAdded                  = 901,
    /** entityId = group id */
    GroupRemoved                = 902,
    /** entityId = group id */
    GroupChanged                = 903,
    
    /** entityId = group id */
    DepartmentAdded             = 911,
    /** entityId = group id */
    DepartmentRemoved           = 912,
    /** entityId = group id */
    DepartmentChanged           = 913,


    /** entityId = not used */
    SecurityRightsChanged       = 10001,

    /** entityId = not used */
    VisoServicesStarted         = 10101,
    /** entityId = not used */
    VisoServicesStopped         = 10102,

    /** entityId = not used */
    SessionCopyStatusChanged    = 10201,
    /** entityId = not used */
    LdapSyncStatusChanged       = 10202,
    /** entityId = not used */
    TerminologyChanged          = 10203,
    /** entityId = recorder id */
    DiskInfoChanged                = 10204,

    /** entityId = not used */
    RetentionChanged            = 10205,

    /** Not send by other clients, but used internally, entityId = not used */
    CommunicationPaused         = 20101,
    /** Not send by other clients, but used internally, entityId = not used */
    CommunicationUnPaused       = 20102,
    /** Not send by other clients, but used internally, entityId = not used */
    CommunicationConnected      = 20103,
    /** Not send by other clients, but used internally, entityId = not used */
    CommunicationDisconnected   = 20104,

}


/**
*  The notification service is responsible for sending and receiving notifications
*/
service NotificationService
{

    /**
     *  Sends/receives a change notification of an entity. The entity is changed in the MRR Services and
     *  an change notification is send to all listening clients with this method.
     */
    oneway void Notify(
        /** Identifier that specifies what has changed. */
        1:  EServiceNotifyId notifyId, 
        /** Id of the entity that has changed. */
        2:  i32 entityId);


    /**
     *  Sends/receives a change notification of an entity. The entity is changed in the MRR Services and
     *  an change notification is send to all listening clients with this method. Notification is send with
     *  the information of the current userId.
     */
    oneway void NotifyUser(
        /** Identifier that specifies what has changed. */
        1:  EServiceNotifyId notifyId, 
        /** Id of the entity that has changed. */
        2:  i32 entityId,
        /** The Id if the user which has initiated the notification. */
        3:  i32 userId);
}