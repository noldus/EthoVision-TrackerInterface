//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Viso Contracts
// File       :   SessionSettings.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 28-04-2017 Dragana Verpoort Petric   - Original version
//----------------------------------------------------------------------------
include "..\\Entities\\SessionLayoutSetting.thrift"
include "..\\Entities\\SessionVideoSetting.thrift"

namespace csharp Noldus.NLinx.Contracts.Viso.Entities
namespace * Noldus.NLinx.Contracts.Viso

/**
 *  The session persistency settings entity.
 */
struct SessionSettings
{
    /**  A unique identifier of the file. */
    1: optional i32 id,
    
    /** True if codes pane should be shown for the specific session, false otherwise. */
    2: optional bool showCodesPane,
    
    /** True if event log pane should be shown for the specific session, false otherwise. */
    3: optional bool showEventLogPane,
    
    /** True if timeline pane should be shown for the specific session, false otherwise. */
    4: optional bool showTimelinePane,
    
    /** True if participants pane should be shown for the specific session, false otherwise. */
    5: optional bool showParticipantsPane,
    
    /** List of session's video settings. */
    6: optional list<SessionVideoSetting.SessionVideoSetting> sessionVideoSetting,
    
    /** List of session's layout settings. */
    7: optional list<SessionLayoutSetting.SessionLayoutSetting> sessionLayoutSetting
}

