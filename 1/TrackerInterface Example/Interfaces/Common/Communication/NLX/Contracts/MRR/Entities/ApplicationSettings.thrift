//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Viso Contracts
// File       :   ApplicationSettings.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 28-04-2017 Dragana Verpoort Petric   - Original version
//----------------------------------------------------------------------------
include "..\\Types\\VisoTypes.thrift"
include "..\\..\\Common\\Types\\CommonTypes.thrift"


namespace csharp Noldus.NLinx.Contracts.Viso.Entities
namespace * Noldus.NLinx.Contracts.Viso


/**
 *  The application persistency settings entity.
 */
struct ApplicationSettings
{
    /**  A unique identifier of the file. */
    1: optional i32 id,

    /** True if batch recording is enabled, false otherwise. */
    2: optional bool isEnabledBatchRecording,
    
    /** True if composite recording is enabled, false otherwise. */
    3: optional bool isEnabledCompositeRecording,

    /** The start time of the working hours. Used to define working and non-working hours in scheduler. */
    4: optional CommonTypes.IsoDateTime workingHoursStartTime,

    /** The stop time of the working hours. Used to define working and non-working hours in scheduler. */
    5: optional CommonTypes.IsoDateTime workingHoursStopTime,

    /** Combined value of flags ESchedulerDays to define the working days for the scheduler. */
    6: optional i32 workingDays,

    /** True if remote view is enabled, false otherwise. */
    7: optional bool isEnabledRemoteView,

    /** The folder (under the IIS root folder) where Viso will move the m3u8 files for video streaming */
    8: optional string remoteViewVideoFolder,

    /** Property to enable/disable the Audit Trail. */
    9: optional bool isAuditTrailEnabled,

    /** Property to enable/disable the automatic retention of the audit trail entries. */
    10: optional VisoTypes.EAuditTrailRetentionPeriod auditTrailRetentionPeriod,

    /** The number of days to keep the data. If 0, data is kept forever. */
    11: optional i32 auditTrailRetentionDays,

    /** The number of years to keep the data. If 0, data is kept forever. */
    12: optional i32 auditTrailRetentionYears,

    /** If true, the recorder will create a special combined stream from the selected cameras. */
    13: optional bool isEnabledCombinedStreaming,

    /** True if using default camera username and password is enabled, false otherwise. */
    14: optional bool isEnabledDefaultCameraAuthentication,

    /** DEPRECATED since R11 for security */
    /** The default camera user name */
    15: optional string defaultCameraUsername,

    /** DEPRECATED since R11 for security */
    /** The default camera password */
    16: optional string defaultCameraPassword,

    /** True if password policy is enabled, false otherwise. */
    17: optional bool isEnabledPasswordPolicy,

    /** This is the minimum allowed length for a password. */
    18: optional i32 minimumPasswordLength,

    /** If true then the password requires at least one uppercase letter [A-Z]. */
    19: optional bool isUppercaseLetterRequired,

    /** If true then the password requires at least one lowercase letter [a-z]. */
    20: optional bool isLowercaseLetterRequired,

    /** If true then the password requires at least one number [0-9]. */
    21: optional bool isNumberRequired,

    /** If true then the password requires at least one special character [!@#&^& etc..]. */
    22: optional bool isSpecialCharacterRequired,

    /** If true then the password is required to be changed every n.th day as specified in the next parameter */
    23: optional bool IsEnabledPasswordExpiry,
    
    /** the number of days to change passwords if the above flag is turned on (between 30 and 365) */
    24: optional i32 PasswordExpiryDays,

    /** The default camera user name,encoded */
    25: optional string defaultCameraUsernameEnc,

    /** The default camera password, encoded */
    26: optional string defaultCameraPasswordEnc

    /** If true then the retention perioed is taken into account, and after the specified time sessions are deleted */
    27: optional bool IsRetentionEnabled,

    /** The default retention period, in days in the range of 30-9999 */
    28: optional i32 RetentionPeriodDays

}
