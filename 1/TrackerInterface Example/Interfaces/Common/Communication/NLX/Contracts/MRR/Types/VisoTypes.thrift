//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Viso Contracts
// File       :   VisoTypes.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 02-12-2014 Tijmen van Voorthuijsen   - Original version
//----------------------------------------------------------------------------

namespace * Noldus.NLinx.Contracts.Viso

/**
 *  The dynamic status of a room
 */
enum ERoomStatus
{
    /** The status has not been set. It has not been set in the Viso system.*/
    Missing = 0,

    /** This status is set for a short moment in the IsAlive polling sequence. The first time when the recorder is not setting the status it will become unknown.*/
    Unknown = 1,

    /** The Viso Recorder for this room is up and running and ready for making a live recording */
    Online = 2,

    /** The room is locked by a user who is (going to) make a live recording */
    OnlineLocked = 3,

    /** The Viso Recorder of this room is not running. A live recording cannot be started for this room */
    Offline = 4,

    /** The room is locked by a user and busy making a live recording */
    Recording = 5,

    /** DEPRECATED since R4. (The recorder of the room does not respond to service calls like stop recording, the remote calls to the recording service time out.)*/
    Unresponsive = 6,

    /** Status used while the creation of a new room is in progress */
    New = 7,

    /** The Viso Recorder of this room is running but having graph building or streaming issues due to wrong configuration or faulty hardware */
    ConfigurationError = 8,

    /** The Viso Recorder is running but not all its cameras are working correctly or some of them are offline. There is at least one camera that is working fine */
    ConfigurationWarning = 9
}


/**
 *  The dynamic status of a machine
 */
enum EMachineStatus
{
    /** The status has not been set. It has not been set in the Viso system.*/
    Missing = 0,

    /** The room status could not be retrieved, i.e. the recorder manager failed to let its status know on time */
    Unknown = 1,

    /** The Viso Recorder Machine is up and running and ready */
    Online = 2,

    /** The sharing settings are invalid. */
    InvalidSharing = 3,

    /** The Viso Recorder Machine is not running.*/
    Offline = 4,

    /** There is a name conflict regarding the machine name. Another machine already has the same name. */
    NameConflict = 5
}

 /**
 *  The status of a recorder
 */
enum ERecorderStatus
{
    /** The status has not been set. It has not been set in the Viso system. */
    Missing = 0,

    /** The Viso Recorder status could not be retrieved, i.e. the recorder failed to let its status know on time. */
    Unknown = 1,

    /** The Viso Recorder is up and running and ready for making a live recording. */
    Online = 2,

    /** The Viso Recorder is not running. A live recording cannot be started. */
    Offline = 3,

    /** The Viso Recorder is restricted. Dongle registration was not successful. */
    NoLicense = 4,

    /** The Viso Recorder is busy making a live recording. */
    Recording = 5,

    /** The Viso Recorder does not respond to service calls like stop recording, the remote calls to the recording service time out. */
    Unresponsive = 6,

    /** The Viso Recorder is running but having graph building or streaming issues due to wrong configuration or faulty hardware */
    ConfigurationError = 7,

    /** The Viso Recorder is running but not all its cameras are working correctly or some of them are offline. There is at least one camera that is working fine */
    ConfigurationWarning = 8
}


/**
 *  This is an enum that combines session, appointment and dashboard statuses into one enum.
 *  It was invented due to the large overlap among the different entity statuses. Note that
 *  not all entry of this enum is used in all the entities as a valid status.
 */
enum ECombinedStatus
{
    /** Unknown status.*/
    Unknown = 0,

    /** Recording has started but recorder has timed out or crashed. */
    Invalid = 1,

    /** Recording has started or An appointment that is currently ongoing */
    Recording = 2,

    /** Recording has completed or An appointment that started and ended succesfully in the past */
    Finished = 3,

    /** Recording was stopped by recorder, recorder manager or by technician or An appointment that started in the past and only partially succeeded */
    ForcedFinished = 4,

    /** Stop session result is Failed or There was an error during the execution of the appointment */
    Failed = 5,

    /** An appointment that is scheduled for the future */
    Scheduled = 6,

    /** An item that is for invited users (before recording while in location view). Applies only as a dashboard item status */
    InvitedWithoutSession = 7
}


/** 
 *  Security dongle status 
 */
enum ERegisterResult
{
    /** Registration successful */
    Success = 0,

    /** Registration successful, dongle is upgraded. Advanced User Management dongle-bit is added to the dongle. */
    LicenseUpgraded = 1,

    /** Registration successful, but need extra attention */
    LicenceWillExpireSoon = 2,

    /** Registration failed, the license is expired */
    LicenceExpired = 3,

    /** Registration failed, no dongle in the system */
    NoDongle = 4,

    /** Registration failed, maximum number of users exceeded */
    MaxNrExceeded = 5,

    /** Missing Advanced User Management, dongle is downgraded */
    MissingAdvancedUM = 6,

    /** Registration failed, no connection */
    ConnectionFailed = 7,

    /** The services and client do not have the same version, so they are incompatible */
    IncompatibleVersion = 8,

    /** Registration successful via a software based license */
    QLMSuccess = 9,

    /** Software based licensing is enabled, but there is no license */
    QLMMissingLicense = 10
}


/**
 *  The type of client used for the security.
 */
enum EClientType
{
    /** A viso viewer client */
    Viewer = 0,

    /** A recorder client */
    Recorder = 1,

    /** A recorder manager client */
    RecorderManager = 2,

    /** A webapp client */
    WebApp = 3
}

    
/** The type of user profiles for a basic license and when the user management license applies. */
enum EUserProfileType
{
    /************************************************************/
    /** Basic user profiles                                     */
    /************************************************************/

    /** A default system Setup account installed with Viso. This account is responsible 
        * for the setup of users and locations. There is only one setup account in Viso. A login is required. */
    Setup_deprecated = 0,

    /** A User is a person who can create codes lists and session recordings. There can 
        * be multiple User accounts in Viso. A login is required. */
    User_deprecated = 1,
        
    /** At the startup of Viso all users can view all locations and sessions as Guest. Guest accounts do not require a login. */
    Guest_deprecated = 2,

    /************************************************************/
    /** User management (Um) User profiles                      */
    /************************************************************/
        
    /** A default system Setup account installed with Viso. This account is responsible for the setup of users only. There is only one 
        * setup account in Viso. A login is required. */
    SetupUserManagement = 3,

    /** A Technician account is mainly responsible for location- and session (= move) management. There can be 
        * multiple Technician accounts in Viso. A login is required. */ 
    Technician = 4,

    /** An Administrator account is mainly responsible for user management and to oversee the overall usage of the Viso system. There 
        * can be multiple Administrators. A login is required. */
    Administrator = 5,

    /** A Trainer can make session recordings and only view his/her own recordings. There can be multiple Trainers. A login is required.*/
    Trainer = 6,

    /** A Trainee is a user that needs to be invited by authorized users (Trainer, Administrator, Technician) in order to 
        * attend a live session or to playback a session. There can be multiple Trainees. A login is required.*/
    Trainee = 7
}


/**
 *  Status of a file copy
 */
enum ECopyStatus
{
    /** Waiting to copy */
    Idle = 0,

    /** Busy with copying */
    Copying = 1,

    /** Copying finished */
    Finished = 2,

    /** Copying failed */
    Failed = 3,

    /** Copying canceled */
    Canceled = 4,

    /** Copying failed, hash check failed */
    CrcFailed = 5
}


/**
*  Video layouts
*/
enum EVideoLayout
{
    /** Quad view (videos are of same size) */
    Quad = 0,

    /** Thumbnails view right side (video thumbnails shown on the right) */
    ThumbnailsRight = 1,

    /** Thumbnails view bootm side (video thumbnails shown on the bottom) */
    ThumbnailsBottom = 2,

    /** Picture in Picture (On top of first video the other videos as thumbnails ) */
    PictureInPicture = 3
}


/**
*  PTZ commands
*/
enum EPtzCommand
{
    /** Move the camera */
    Move = 0,

    /** Save the current position */
    Save = 1,

    /** Restore the saved position */
    Restore = 2
}


/**
*  PTZ commands data
*/
struct PtzCommandData
{
    /** Sets what kind of command it is */
    1:  required EPtzCommand command,

    /** Move in the Pan direction */
    2: optional double pan = 0.0,

    /** Move in the Tilt direction */
    3: optional double tilt = 0.0,

    /** Zoom in or out */
    4: optional double zoom = 0.0,

    /** Save and restore index */
    5: optional i32 position
}


/**
 *  A small entity that contains a width and height integer value
 */
struct IntSize
{
    /** The width */
    1:  optional i32 width,

    /** The height */
    2:  optional i32 height
}


/**
 *  A small struct that contains a minimum and maximum integer value
 */
struct IntRange
{
    /** The minimum value*/
    1:  optional i32 minimum,

    /** The maximum value*/
    2:  optional i32 maximum
}


/**
*  A set of all video device options
*/
struct VideoDeviceOptions
{
    /** A list of possible resolutions */
    1:  optional list<IntSize> resolutions,

    /** A list of possible encoding profiles */
    2: optional list<string> encodingProfiles,

    /** The range of possible FPS values */
    3: optional IntRange framesPerSecond,

    /** The range of possible bitrate values */
    4: optional IntRange bitrate,

    /** The range of possible GOV length values */
    5: optional IntRange govLength,

    /** The range of possible quality values */
    6: optional IntRange quality,

    /** The range of possible encoding interval values */
    7: optional IntRange encodingInterval
}


/**
 *  Status of audio or video device
 */
enum EAudioVideoDeviceStatus
{
    /** Video status is OK */
    OK = 0,
    
    /** Not yet used */
    MissingVideo = 1,

    /** Not yet used */
    MissingAudio = 2,

    /** There is an error with the video */
    ErrorVideo = 3,

    /** There is an error with the audio */
    ErrorAudio = 4,
        
    /** Not yet used */
    NoAudio = 5,

    /** Not yet used */
    AudioNotMatchVideo = 6,

    /** Not yet used */
    SingleAudioConflict = 7,

    /** The settings are invalid */
    IPConnectionLost = 8,

    /** The IP settings are invalid */
    IPInvalid = 9,
    
    /** No ONVIF capable device was found */
    OnvifWrongDevice = 10,
    
    /** The username/password was wrong, or check the webservice settings in the camera */
    OnvifAuthorizationFailed = 11,
    
    /** unknown error */
    OnvifUnknownError = 12
}

/** 
  * The recurrencemode for scheduled tasks
  */
enum ESchedulerRecurrence
{
    /** 0 No schedule */
    None = 0,

    /** 1  e.g. every x day(s) */
    Daily = 1,

    /** 2  e.g every monday and friday of every x week(s) */
    Weekly = 2,
          
    /** 3  e.g. the 4th of every x month(s) */
    MonthlyBasedOnDate = 3,
          
    /** 4  e.g. the second Wednesday of every x month(s) */
    MonthlyBasedOnDayOfWeek = 4
}

/** 
  * The scheduler error types
  */
enum ESchedulerResult
{
    /** Unknown result */
    Unknown = 0,

    /** Synchronization was succesful */
    Success = 1,

    /** Failed to connect */
    FailedToConnect = 2,

    /** No users to synchronize */
    NoDomainUsers = 3,

    /** No users need to synchronize */
    NoChangesInUsers = 4,

    /** Exception occured in service */
    ExceptionInService = 5,

    /** No error */
    None = 6,

    /** Copy failed due to low disk space */
    CopyFailedLowDiskSpace = 7,
          
    /** Copy videos failed */
    CopyVideosFailed = 8,

    /** Copy failed due wrong file format*/
    CopyFailedWrongFormat = 9,

    /** Copy failed due wrong No source file*/
    CopyFailedNoFile = 10,

    /** Copy failed due no acces to target folder*/
    CopyFailedNoAccess = 11
}

/** 
  * The days of the week as Flags
  */
enum EDayOfWeek
{
    /** The first day of the week.*/
    Monday = 1,

    /** The second day of the week.*/
    Tuesday = 2,

    /** The third day of the week.*/
    Wednesday = 4,

    /** The fourth day of the week.*/
    Thursday = 8,

    /** The fifth day of the week.*/
    Friday = 16,

    /** The sixth day of the week.*/
    Saturday = 32,

    /** The seventh day of the week.*/
    Sunday = 64
}


/** 
  * The weeks of the month.
  */
enum EWeekOfMonth
{
    /** The first week of the month.*/
    First = 1,

    /** The second week of the month.*/
    Second = 2,

    /** The third week of the month.*/
    Thrird = 3,

    /** The fourth week of the month.*/
    Fourth = 4,

    /** The fifth week of the month.*/
    Last = 5
}


/**
  * An enum whether a user is removed or not.
  * Users can be removed from LDAP and from Viso system too.
  */
enum EUserRemovedStatus
{
    /** User is not removed */
    NotRemoved = 0,

    /** User is removed from Viso system */
    RemovedFromViso = 1,

    /** User is removed from the LDAP system */
    RemovedFromLDAP = 2
}


/**
 *  Possible error codes
 */
enum EErrorCode
{
    /** The default value.*/
    NO_COMM_ERROR = 0,

    /** An indirect service call timed out. This can happen for example when the session service calls a method on a remote recording service which times out.*/
    COMMUNICATION_TIMEOUT = 10000,

    /** The communication in the Viso Services or Viso Recorder is not working.*/
    COMMUNICATION_NOT_INITIALIZED = 10003,

    /** A non-recoverable and fatal exception occurred in Viso Services.*/
    FATAL_EXCEPTION = 20000,

    /** The backup of the database file failed.*/
    DATABASE_BACKUP_FAILED = 20002,

    /** Deleting a media file failed.*/
    DELETING_FILE_FAILED = 20003,

    /** Adding a location to the MRR Service failed because the associated recorder was not found in the database.*/
    ROOM_UMR_DEVICE_NOT_FOUND_IN_DB = 20004,

    /** Information about a location is requested that does not exists in the database.*/
    INVALID_ROOM_EXCEPTION = 20005,

    /** The entity names is not unique.*/
    NOT_UNIQUE_NAME = 20007,

    /** The Viso license or the user does not have the required rights. AUTHORIZATION EXCEPTION */
    INSUFFICIENT_RIGHTS_EXCEPTION = 20008,

    /** An event was scored without Date or comment/marker in it.*/
    INVALID_EVENT_EXCEPTION = 20009,

    /** The codes list of the event log does not exist.*/
    CODESLIST_NOTEXIST = 20010,

    /** Information about a session is requested that does not exists in the database.*/
    SESSION_NOTEXIST = 20011,

    /** A second event log is added to the session, this is not allowed.*/
    EVENTLOG_ALREADYEXISTS = 20012,

    /** The copy of video files failed for unknown reason.*/
    COPY_FAILED_UNEXPECTEDLY = 20013,

    /** The database cannot be accessed because the database context was not created. SYSTEM EXCEPTION */
    DBCONTEXT_NULL = 20014,

    /** There are no markers defined in the list.*/
    INVALID_MARKERS = 20015,

    /** Information about a location is requested by UMR device ID but no location was found in the Viso services that is associated with the device ID.*/
    INVALID_ROOM_UNCONNECTED_DEVICE = 20016,

    /** The login session has expired, the user should login again. AUTHORIZATION EXCEPTION  */
    LOGIN_EXPIRED = 20018, // auth exception

    /** The user tried to change the password but entered the same one.*/
    PASSWORD_NOT_NEW = 20019,

    /** The user tried to add an insecure password (less than 6 chars).*/
    PASSWORD_NOT_SECURE = 20020,

    /** An entity with the wrong index was requested.*/
    INVALID_INDEX = 20021,

    /** A user with the entered name already exists.*/
    USERNAME_EXISTS = 20022,

    /** Unable to stop the session.*/
    STOPPED_SESSION = 20023,

    /** The database was not initialized and/or connected to the MDF file which indicates problems with the environment or database file.*/  
    DBCONTEXT_NOT_INITIALIZED = 20026,

    /** One of the entity fields is empty. The field cannot be empty.*/
    EMPTY_FIELD = 20027,

    /** Guest user tried to lock a session.*/
    GUEST_TRIEDLOCK = 20028,

    /** User tried to access and change a location (start/stop rec, add event etc), but the location is locked by another user.*/
    ROOM_LOCKED = 20029,

    /** A call to the database could not be finished, try again.*/
    DATABASE_ERROR = 20030,

    /** Guest user tried to lock a session.*/
    GUEST_TRIEDLOCK_SESSION = 20031,

    /** Guest user tried to unlock a session.*/
    GUEST_TRIEDUNLOCK_SESSION = 20032,

    /** Guest user tried to unlock a location.*/
    GUEST_TRIEDUNLOCK = 20033,

    /** A user tried to unlock a location but it was locked by another user.*/
    UNLOCK_OTHERUSER = 20034,

    /** A user tried to unlock a session but it was locked by another user.*/
    UNLOCK_OTHERUSER_SESSION = 20035,

    /** A user tried to access and change a session (add event log or events) but it is locked by another user.*/
    EXC_SESSION_LOCKED = 20036,

    /** File access problems when removing the old video file, may still be in use.*/
    UNABLE_TO_DELETE_OLD_VIDEO = 20037,

    /** File access problems on the newly created file.*/
    UNABLE_TO_DELETE_NEW_VIDEO = 20038,

    /** Unable to copy a video file.*/
    COPY_OF_VIDEO_FAILED = 20039,

    /** A call to the database could not be finished, try again.*/
    DATABASE_READ_ERROR = 20041,

    /** The location name is not unique.*/
    NOT_UNIQUE_NAME_LOCATION = 20042,

    /** The maximum recorders allowed on one computer exceeded.*/
    MAX_ROOM_RECORDERS_EXCEEDED = 20043,

    /** The maximum recorders allowed according to the licence exceeded.*/
    MAX_RECORDERS_EXCEEDED = 20044,

    /** Something went wrong when trying to synchronize with Ldap.*/
    LDAP_SYC_FAILED = 20047,

    /** Maximum number of markers in one codes list is reached.*/
    MAX_NUMBER_OF_MARKERS_REACHED = 20064,

    /** Maximum number of subjects in one codes list is reached.*/
    MAX_NUMBER_OF_SUBJECTS_REACHED = 20065,

    /** A codes list has been replaced when there are events scored in the event log.*/
    MRR_SERVER_EXC_CODES_LIST_CANNOT_BE_CHANGED = 20068,

    /** General message for the exceptions thrown without specific description.*/
    MRR_SERVER_EXC_EXCEPTION_TROWN = 20069,

    /** The user is logged in currently and therefore it is not possible to change the department*/
    MRR_SERVER_EXC_CANNOT_CHANGE_DEPARTMENT_OF_LOGGEDIN_USER = 20098,

    /** Viso cannot connect to LDAP using these settings.*/
    LDAP_TEST_SETTINGS_FAILED = 30094,

    /** The user tried to add an invalid username.*/
    USERNAME_INVALID = 30119,

    /** Viso Recorder Manager exited unexpectedly.*/
    MANAGER_EXITED = 40002
}


/**
 *  The result of a session remove
 */
enum ERemoveSessionResult
{
    /** Unknown result */
    Unknown = 0,

    /** Remove successful */
    Success = 1,

    /** Remove incomplete*/
    Incomplete = 2,

    /** Video file(s) not accessible */
    FileNotAccessible = 3,

    /** Video File(s) not found */
    FileNotFound = 4,

    /** Drive of video files not found */
    DriveNotFound = 5,

    /** Delete method not supported */
    CannotDeleteVideos = 6
}


/**
 *  The result of a video file remove
 */
enum ERemoveVideoFileResult
{
    /** Unknown result */
    Unknown = 0,

    /** Remove successful */
    Success = 1,

    /** Video file(s) not accessible */
    FileNotAccessible = 2,

    /** Video File(s) not found */
    FileNotFound = 3,

    /** Drive of video files not found */
    DriveNotFound = 4,

    /** Delete method not supported */
    CannotDelete = 5,

    /** Deletion is pending, probably will succeed */
    DeletePending = 6
}


/**
 *  The items for user-defined terminologies
 */
enum ETerminologyItem
{
    /** Undefined */
    Undefined = 0,

    /** Technician */
    Technician = 1,

    /** Administrator */
    Administrator = 2,

    /** Trainer */
    Trainer = 3,

    /** Trainee */
    Trainee = 4,

    /** Location */
    Location = 100,

    /** Session */
    Session = 101,

    /** Marker */
    Marker = 102,

    /** Subject */
    Subject = 103,

    /** Department */
    Department = 104,

    /** Group*/
    Group = 105
}


/** The result of retrieving disk info */
enum EDiskInfoResult
{
    /** Unknown result */
    Unknown = 0,

    /** Successfully retrieved disk info. */
    Success = 1,

    /** Failed to retrieve disk info */
    Failed = 2,

    /** Folder format invalid */
    InvalidFormat = 3,

    /** Folder does not exists or cannot be found */
    DoesNotExists = 4,

    /** No write access to the folder. */
    NoWriteAccess = 5
}


/**
 *  Contains info about disk space.
 */
struct DiskInfo
{
    /** Total disk space string representation.
        Formated automatically in B, KB, MB, or GB. */
    1:  optional string totalSpace,
    
    /** Available free disk space string representation.
        Formated automatically in B, KB, MB, or GB. */
    2:  optional string freeSpace,

    /** Total disk space long representation. */
    3:  optional i64 totalSpaceBytes,

    /** Available free disk space long representation. */
    4:  optional i64 freeSpaceBytes,

    /** The result of retrieving disk info */
    5:  optional EDiskInfoResult diskInfoResult
}


/** The list of shapes used for markers */
enum EMarkerShapes
{
    /** No marker's shape */
    None = 0,

    /** Marker's shape square */
    Square = 1,

    /** Marker's shape triangle */
    Triangle = 2,

    /** Marker's shape triangle, rotated for 180 degrees */
    Triangle180 = 3,

    /** Marker's shape half triangle, rotated for 90 degrees */
    Triangle90 = 4,

    /** Marker's shape triangle, rotated for 270 degrees */
    Triangle270 = 5,

    /** Marker's shape circle */
    Circle = 6,

    /** Marker's shape plus */
    Plus = 7,

    /** Marker's shape plus, rotated for 45 degrees */
    Plus45 = 8,

    /** Marker's shape equals */
    Equals = 9,

    /** Marker's shape equals, rotated for 90 degrees */
    Equals90 = 10,

    /** Marker's shape half circle, rotated for 90 degrees */
    HollowCircle = 11,

    /** Marker's shape diamonds */
    Diamonds = 12,

    /** Marker's shape hearts */
    Hearts = 13,

    /** Marker's shape spades */
    Spades = 14,

    /** Marker's shape clubs */
    Clubs = 15
}

/**
 *  The type of appointment in a schedule.
 */
enum EAppointmentType
{
    /** Default type */
    Unknown = 0,
    /** A planned Viso session that has one location */
    SingleSession = 1,
    /** Planned Viso sessions with separate sessions of several locations */
    SeparateSession = 2,
    /** A planned Viso session that is a composite session of several locations */
    CompositeSession = 3,
}


/**
 *  The type of a session, based on the way how the session is started.
 */
enum ESessionStartingType
{
    /** Default type */
    Unknown = 0,
    /** Session started via recording view manually */
    Manual = 1,
    /** Session stared via scheduler */
    Scheduled = 2,
    /** Session stared remotely vai an HTTP command */
    Remote = 3
}


/**
 *  Enum for Audit Trail Action logs
 */
enum EAuditAction
{
    /** Session access Right Granted log - comes in pair with the next one */
    SessionUserRightGrantedTo,
    SessionUserRightGrantedBy,
    /** Session access Right Revoked log - comes in pair with the next one */
    SessionUserRightRevokedFrom,
    SessionUserRightRevokedBy,
    /** Location access Right Granted log - comes in pair with the next one */
    LocationRightGrantedTo,
    LocationRightGrantedBy,
    /** Location access Right Revoked log - comes in pair with the next one */
    LocationRightRevokedFrom,
    LocationRightRevokedBy,
    /** Appointment access Right Granted log - comes in pair with the next one */
    AppointmentRightGrantedTo,
    AppointmentRightGrantedBy,
    /** Appointment access Right Revoked log - comes in pair with the next one */
    AppointmentRightRevokedFrom,
    AppointmentRightRevokedBy,
    /** Video Created log */
    VideoCreated,
    /** Video Removed log */
    VideoRemoved,
    /** Audit trail log turned on */
    AuditTrailEnabled,
    /** Audit trail log turned off */
    AuditTrailDisabled,
    /** Video exported */
    VideoExported,
    /** Session name changed */
    SessionRenamed,
    /** Apointment name changed */
    AppointmentRenamed,
	/** Video imported */
    VideoImported,
	/** Session Viewed*/
    SessionViewed,
	/** Location Viewed*/
    LocationViewed,
    /** Session access Right Granted */
    SessionGroupRightGranted,
    /** Session access Right Revoked */
    SessionGroupRightRevoked,
    /** Location access Right Granted */
    LocationGroupRightGranted,
    /** Location access Right Revoked */
    LocationGroupRightRevoked,
    /** Group/Department created */
    GroupCreated,
    /** Group/Department removed */
    GroupRemoved,
    /** User added to Group - comes in pair with the next one */
    UserAddedToGroup,
    UserAddedToGroupBy,
    /** UserRemoved from Group - comes in pair with the next one */
    UserRemovedFromGroup,
    UserRemovedFromGroupBy,
    /** Group/Department renamed */
    GroupRenamed,
    /** session Annotator Right transfer by */
    SessionAnnotatorRightTranseferedBy,
    /** session Annotator Right transfer From user */
    SessionAnnotatorRightTranseferedFrom,
    /** session Annotator Right transfer To user */
    SessionAnnotatorRightTranseferedTo,
    /** Appointment access Right Granted to Group */
    AppointmentRightGrantedGroupBy,
    /** Appointment access Right revoked from group */
    AppointmentRightRevokedGroupFrom,
    /** Appointment Annotator Right transfer by */
    AppointmentAnnotatorRightTransferredBy,
    /** Appointment Annotator Right transfer From user */
    AppointmentAnnotatorRightTransferredFrom,
    /** Appointment Annotator Right transfer To user */
    AppointmentAnnotatorRightTransferredTo,
    /** Session ownership transfer by */
    SessionOwnershipTransferredBy,
    /** Session ownership transfer from */
    SessionOwnershipTransferredFrom,
    /** Session ownership transfer to */
    SessionOwnershipTransferredTo,

    /** Department created */
    DepartmentCreated,
    /** Department removed */
    DepartmentRemoved,
    /** User added to Department - comes in pair with the next one */
    UserAddedToDepartment,
    UserAddedToDepartmentBy,
    /** User Removed from Department - comes in pair with the next one */
    UserRemovedFromDepartment,
    UserRemovedFromDepartmentBy,
    /** Department renamed */
    DepartmentRenamed


}



/**
 *  Enum for audit trail retention period values.
 */
enum EAuditTrailRetentionPeriod
{
    /** Retention will be never done */
    Never,

    /** The data will be kept for the specified number of days */
    AfterSpecifiedNumberOfDays,

    /** The data will be kept for the specified number of years */
    AfterSpecifiedNumberOfYears
}


/**
 *  Simple struct to represent a single User - Group connection.
 */
 struct UserGroupConnection
 {
    /** The unique Id of the user entity. */
    1: required i32 userId,

    /** The unique Id of the group entity. */
    2: required i32 groupId
 }

/**
 *  Simple struct to represent a single User - Department connection.
 */
 struct UserDeptConnection
 {
    /** The unique Id of the user entity. */
    1: required i32 userId,

    /** The unique Id of the group entity. */
    2: required i32 groupId
 }

/**
 *  Generic exception that is thrown when something in the business application went
 *  wrong, usually due to wrong input.
 */
exception ApplicationException
{
    /*  The error code that specifies the exception in more detail.*/
    1: required EErrorCode errorCode,
    /*  A detailed technical description of the error */
    2: optional string technicalDescription
}


/**
 *  An exception thrown only when something critical in system went wrong, like a
 *  database that cannot be opened. This is usually NOT due to wrong input and probably
 *  results in a restart of a service.
 */
exception SystemException
{
    /*  The error code that specifies the exception in more detail.*/
    1: required EErrorCode errorCode,
    /*  A detailed technical description of the error */
    2 : optional string technicalDescription
}


/**
 *  A specific exception thrown when the logged in user has insufficient rights, or when
 *  the login session is expired
 */
exception AuthorizationException
{
    /*  The error code that specifies the exception in more detail.*/
    1: required EErrorCode errorCode,
    /*  A detailed technical description of the error */
    2 : optional string technicalDescription
}


/**
 *  A specific exception thrown when the password policy is not met with the current requirements.
 */
exception PasswordPolicyException
{
    /*  The error code that specifies the exception in more detail.*/
    1: required EErrorCode errorCode,
    /*  A detailed technical description of the error */
    2: optional string technicalDescription,
    /* List of inserts for substituting %1, %2,... in the description body of the message. */
    3: optional list<string> messageCodeArguments 
}