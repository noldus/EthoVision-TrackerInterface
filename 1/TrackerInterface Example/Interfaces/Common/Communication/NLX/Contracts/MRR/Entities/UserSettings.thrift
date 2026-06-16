//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Viso Contracts
// File       :   UserSettings.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 26-04-2017 Dragana Verpoort Petric   - Original version
//----------------------------------------------------------------------------
include "..\\Entities\\UserMachineSetting.thrift"
include "..\\Entities\\UserCodesSetting.thrift"

namespace csharp Noldus.NLinx.Contracts.Viso.Entities
namespace * Noldus.NLinx.Contracts.Viso

/**
 *  Holds the information and data from one recording session.
 */
struct UserSettings
{
    /** A unique identifier of the file. */
    1: optional i32 id,
    
    /** The default name used for sessions created by the specific user. */
    2: optional string defaultSessionName,
    
    /** True if user can edit default session name before saving session, false otherwise. */
    3: optional bool enableEditDefaultSessionName,
    
    /** True if user has enabled auto coropping for all locations, false otherwise. */
    4: optional bool enableAutoCropping,
    
    /** Quick session review interval which user has setup. */
    5: optional i64 quickReviewInterval,
    
    /** List of machine settings for user. */
    6: optional list<UserMachineSetting.UserMachineSetting> userMachineSettings,

    /** List of codes list settings for user. */
    7: optional list<UserCodesSetting.UserCodesSetting> userCodesSettings,

    /** True if use of default session name is enabled, false otherwise. */
    8: optional bool isDefaultSessionNameEnabled,

    /** Holds the value of the numbers of sessions named with the default session name. */
    9: optional i32 defaultSessionNameIterationNumber,

    /** Pre-roll interval which user has setup. */
    10: optional i64 preRollInterval,
    
    /** Pause after quick review  */
    11: optional bool isQuickReviewPauseEnabled
}

