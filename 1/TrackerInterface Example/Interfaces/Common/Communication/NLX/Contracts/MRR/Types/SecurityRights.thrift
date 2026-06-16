//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Viso Contracts
// File       :   SecurityRights.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 15-01-2015 Tijmen van Voorthuijsen   - Original version
//----------------------------------------------------------------------------

namespace csharp Noldus.NLinx.Contracts.Viso.Types
namespace * Noldus.NLinx.Contracts.Viso


/** 
 * A list of all security rights. These rights can be combined and used as bit flags in for example method SecurityService.GetRights.
 */
enum ESecurityRights
{
    /** No user right required. */
    NoLimitations           = 0x00000000,

    /** Right to get markers and codes lists. */
    AnnotationAccess        = 0x00000001,

    /** Right to define markers and codes lists, add a new codes list with new or existing markers or to remove a codes list. */
    AnnotationDefine        = 0x00000002,

    /** Right to view markers and to view scored events during a live session and during a playback session. */
    AnnotationView          = 0x00000004,

    /** Right to access the location list (view a room's name and state) */
    LocationAccess          = 0x00000008,

    /** Right to modify a location for making a recording like locking the room. For adding, editing and removing locations 
    /** you need the LocationManagement right. */
    LocationModify          = 0x00000010,

    /** Right to view location streams and event data (live view) */
    LocationView            = 0x00000020,

    /** Right to adjust PTZ */
    LocationAdjustPTZ       = 0x00000040,

    /** Right to start and stop a session recording */
    RecordingStartStop      = 0x00000080,

    /** Right to access the session list (view name, creator, state) */
    SessionAccess           = 0x00000100,
        
    /** Right to administer session files (schedule copy of files, etc.) */
    SessionManagement       = 0x00000200,

    /** Right to modify, delete, export a session or a session invite. */
    SessionModify           = 0x00000400,

    /** Right to view the session data, video and scored events */
    SessionViewAll          = 0x00000800,

    /** Right to upgrade the license */
    UpgradeLicense          = 0x00001000,

    /** Right to add, modify or remove users */
    UserManagement          = 0x00002000,

    /** Right to add/remove/change locations, camera's, audio, video devices */
    LocationManagement      = 0x00004000,

    /** Right to use the push-to-talk */
    LocationPushToTalk      = 0x00008000,

    /** [R4 and later] Right to allow advanced user management with LDAP */
    UserManagementAdvanced  = 0x00010000,

    /** [R4 and later] Right to allow using the system without logging in (guest mode) */
    AllowGuestMode_deprecated  = 0x00020000,

    /** [R4 and later] Right to view only the sessions that you have recorded. */
    SessionViewOwn          = 0x00040000,

    /** [R11 and later] Right to modify appointments in the scheduler. */
    SchedulerModifyAll      = 0x00080000,

    /** [R4 and later] The right to view and edit the LDAP settings */
    LdapManagement          = 0x00100000,

    /** [R4 and later] The right to use markers for scoring (add, modify and delete events), score comments and add/remove event logs */
    AnnotationScoreEvents   = 0x00200000,

    /** [R11 and later] The system setup rights (only for setup user) old value: TerminologyModify [R4.1 and later] The right to customize Viso terminology */
    SystemSetup             = 0x00400000,

    /** [R11 and later] The global admin rights, to define and access all departments, force stop recordings old value: RecordingForcedStop [R5 and later] The right to stop recording whose owner is another user */
    GlobalAdmin             = 0x00800000,

    /** [R6 and later] The right to be able to adjust recording method (allow separate sessions and composite session recording) */
    RecordingMethodModify   = 0x01000000,

    /** [R6 and later] The right to be able to see the list/calendar of the scheduled recordings with all properties */
    SchedulerAccess         = 0x02000000,

    /** [R6 and later] The right to be able to create, change or remove recording schedules */
    SchedulerModify         = 0x04000000,

    /** [R6 and later] Obsolete in MRR110 The right to be able to change scheduler settings to define working days and hours etc.. */
    SchedulerSettingsModifyObsolete = 0x08000000,

    /** [R8 and later] Obsolete in MRR110 The right to be able to enable/disable remote viewing of sessions and to change remote view settings */
    RemoteViewManagementObsolete    = 0x10000000,

    /** [R8 and later] Obsolete in MRR110 The right to be able to turn on/off the audit trail policy and to change its retention settings */
    AuditTrailModifyObsolete        = 0x20000000,

    /** [R9 Patch1 and later] The right to be able to use Database Maintenance */
    DatabaseMaintenance     = 0x40000000
}


enum ESecurityRightsHigh
{

/** [R11 and later] New users of this profile can be created */
    UserCreatableProfile    = 0x00000001,

    /** [R12 and later] The right to be able to view and change the Password policy. */
    PasswordPolicy          = 0x00000002,
    
    /** [R12 and later] Right to allow group management (create, delete, modify, etc...) */
    GroupManagement         = 0x00000004

    /** [R12 and later] The admin rights for one specific department, to define and access users and sessions of that department (and no dept) */
    DepartmentAdmin         = 0x00000008
}
