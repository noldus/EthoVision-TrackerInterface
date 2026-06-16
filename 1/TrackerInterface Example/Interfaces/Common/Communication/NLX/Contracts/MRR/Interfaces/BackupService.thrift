//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Viso Contracts
// File       :   BackupService.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 18-02-2015 Jeroen Diederix           - Original version
//----------------------------------------------------------------------------
include "..\\Types\\VisoTypes.thrift"
include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "..\\..\\Common\\Interfaces\\CommonService.thrift"
include "..\\Entities\\SessionBackupSettings.thrift"

namespace csharp Noldus.NLinx.Contracts.Viso.Services
namespace * Noldus.NLinx.Contracts.Viso

// Settings for this service
const i32         interfaceVersion  = 2;
const string      exchange          = "Noldus.NLinx.Viso.BackupService"
const string      routingKey        = "155FEF7A-4600-42E5-AB76-9CCD9BAD224A"


/**
 *  OBSOLETE since R4. 
 *  Data to schedule a session copy OBSOLETE
 */
struct CopyScheduleData
{
    /** copy to this location */
    1:  optional string copyLocation,

    /** daily, weekly or monthly recurrence */
    2: optional string recurrenceMode,

    /** method to use in case of monthly mode */
    3: optional string monthlyMode,

    /** time of day to start, in seconds from midnight */
    4: optional string timeOfDay,

    /** reoccur every 'this amount' of day(s)/week(s)/month(s) */
    5: optional string recurrenceValue,

    /** the day of week/month */
    6: optional string day,

    /** the week of month */
    7: optional string weekOfMonth
}


/**
 *  Result of the validate location function
 */
enum ELocationValidationFailure
{
    /** Folder format invalid */
    InvalidFormat,

    /** Folder does not exist */
    DoesNotExists,

    /** No write access to folder */
    NoWriteAccess,

    /** No Recorder manager running on recorder location */
    NoRecorderManager,

    /** Request timed out */
    TimedOut
}

/**
 *  Failure result
 */
struct LocationValidationFailureResult
{
    /** The location */
    1:  optional string location,

    /** The result */
    2: optional ELocationValidationFailure result,
}
    
/**
 *  Result of location validation
 */
struct ValidateLocationResult
{
    /** Is the location valid for all recorders to copy video files*/
    1:  optional bool isValid,

    /** List of all failed recorders */
    2:  optional list<LocationValidationFailureResult> recorderFailures,

    /** Contains the results of the copy location disk space checking */
    3:  optional CopyLocationFreeDiskSpaceResult diskSpaceResults
}
    
/**
 *  Result of copy location disk space checking
 */
struct CopyLocationFreeDiskSpaceResult
{
    /** Success is true if there is enough space for the video files to make the copy action */
    1:  optional bool success,

    /** The number of needed free bytes to copy all the video files */
    2:  optional i64 neededFreeBytes,

    /** The number of available free bytes on the copy location */
    3:  optional i64 availableFreeBytes,

    /** Cause of the failure */
    4:  optional EFolderValidationResult folderValidationResult,
}

/**
 *  Return result of FolderValidation
 */
enum EFolderValidationResult
{
    /** Folder is valid */
    Valid,

    /** Folder format is invalid */
    InvalidFormat,

    /** Folder does not exists or cannot be found */
    DoesNotExists,

    /** No write access to the folder */
    NoWriteAccess
}

/**
 *  Result of the copy action
 */
enum ECopyStatusResult
{
    /** Copy action succeeded without errors */
    Success,

    /** Some of the files cound not be copied */
    PartialSuccess,

    /** Central storage has not enough free disk space to start the copy action */
    NotEnoughFreeSpace,

    /** File Copy failed */
    CopyVideosFailed,

    /** File is not in the proper format */
    WrongFormat,

    /** Source file not found */
    NoFile,

    /** Has no acces to the target file/folder */
    NoAccess,

    /** Unknown error happend */
    UnknownError
}


/**
 *  Result of the retention action
 */
enum ERetentionStatusResult
{
    /** Retention action succeeded without errors */
    Success,

    /** Some of the files could not be removed */
    PartialSuccess
}


/**
 *  Result of the move sessions ("now") action
 */
enum EMoveSessionsResult
{
    /** Result of all move actions unknown */
    Unknown,

    /** All move action succeeded without errors */
    Success,

    /** Not all move action succeeded without errors */
    Failed
}
    
/**
 *  Result of the copy status
 */
struct GetLastCopyStatusResult
{
    /** The start time of the copy action, not set when no copies were completed */
    1:  optional CommonTypes.IsoDateTime startDate,

    /** Number of successful copies */
    2:  optional i32 successfulCopyCount,

    /** list of files that failed to copy */
    3: optional list<string> failedCopy,

    /** the result of the copy action */
    4: optional ECopyStatusResult result
}


/**
 *  Result of the session retention status
 */
struct SessionRetentionStatusResult
{
    /** The start time of the session retention action, not set when no retention was completed */
    1:  optional CommonTypes.IsoDateTime startDate,

    /** Number of successful retention */
    2:  optional i32 successfulRemoveCount,

    /** list of files that failed to remove */
    3: optional list<string> failedToRemove,

    /** the result of the retention action */
    4: optional ERetentionStatusResult result
}


/**
 *  Contains parameters for checking disk info.
 */
struct BackupSvsDiskInfoParams
{
    /** The machine id that we want to check */
    1: optional CommonTypes.GUID machineId,

    /** Path to check for disk info */
    2: optional string diskPathToCheck
}

/**
 *  The backup service is responsible for session files copy
 */
service BackupService extends CommonService.CommonService
{
    /**
     *  DEPRECATED since R5. Please use RegisterCopierMachine instead.
     *  Register a copier for a number of recorders.
     */
    void RegisterCopier(
            /** A unique Id to identify the copier */
            1:  CommonTypes.GUID guid, 
            /** A list of all UMR devices handled by this copier */
            2:  list<CommonTypes.GUID> recorders
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Register a copier for a machine.
     */
    void RegisterCopierMachine(
            /** A unique Id to identify the copier */
            1:  CommonTypes.GUID copierId, 
            /** A unique identifier of machine. */
            2:  CommonTypes.GUID machineId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Unregister a copier
     */
    void UnRegisterCopier(
            /** A unique Id to identify the copier */
            1:  CommonTypes.GUID guid, 
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Set the status of an ongoing/finishes/canceled file copy
     */
    void SetCopyStatus(
            /** Id of the copier */
            1:  CommonTypes.GUID guid,
            /** Source path */
            2:  string fromPath,
            /** Destination path */
            3:  string toPath,
            /** The status of the copy */
            4:  VisoTypes.ECopyStatus status
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Gets the specified copier's GUID
     *  @return CommonTypes.GUID - the guid of the copier
     */
    CommonTypes.GUID GetCopier(
            /** The Id of the device for which we want to get back its copier */
            1: CommonTypes.GUID deviceId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  OBSOLETE since in R4, schedule data is now passed as a Schedule entity.
     *  Schedule copy action.
     */
    void ScheduleCopy(
            /** Data to schedule a copy */
            1:  CopyScheduleData scheduleData
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

    /**
     *  Do the copy action immediately without any scheduling.
     */
    EMoveSessionsResult DoCopyImmediately(
            /** copy to this location */
            1:  string location
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Check if the system is copying now
     *  @return bool - true when copying, false otherwise
     */
    bool IsCopyingNow() throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Check that all recorder managers can access the file location
     *  @return ValidateLocationResult - the result
     */
    ValidateLocationResult ValidateLocation(
            /** Folder to check */
            1:  string path
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

       
    /**
     *  Gets the saved scheduler settings from the database OBSOLETE
     *  @return CopyScheduleData - Data of the scheduled copy action
     */
    CopyScheduleData GetSchedulerSettings() throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Get the last copy status
     *  @return GetLastCopyStatusResult - Object that stores the last copy status
     */
    GetLastCopyStatusResult GetLastCopyStatus() throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     * OBSOLETE since R5, please use UpdateSessionBackupSettings method instead
     *  Saves the scheduler settings to the database
     *  @return SessionBackupSettings - Data of the scheduled copy action
     */
    SessionBackupSettings.SessionBackupSettings UpdateSessionManagement(1: SessionBackupSettings.SessionBackupSettings settings) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     * OBSOLETE since R5, please use GetSessionBackupSettings method instead
     *  Gets the saved scheduler settings from the database
     *  @return SessionBackupSettings - Data of the scheduled copy action
     */
    SessionBackupSettings.SessionBackupSettings GetSessionManagementResult() throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Saves the session backup settings to the database
     *  @return SessionBackupSettings - The saved session backup settings from the database
     */
    SessionBackupSettings.SessionBackupSettings UpdateSessionBackupSettings(
            /** Session backup settings to save to database */
            1:  SessionBackupSettings.SessionBackupSettings sessionBackupSettings
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Gets the saved session backup settings from the database
     *  @return SessionBackupSettings - The session backup settings from the database
     */
    SessionBackupSettings.SessionBackupSettings GetSessionBackupSettings() throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Gets the disk information for the specified device
     *  @return VisoTypes.DiskInfo - disk information
     */
    VisoTypes.DiskInfo GetDiskInfo(
            /** The Id of the machine for which we want to get back disk information */
            1: BackupSvsDiskInfoParams parameters
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Get the last retention status
     *  @return SessionRetentionStatusResult - Object that stores the last retention status
     */
    SessionRetentionStatusResult GetSessionRetentionStatus() throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);
}
