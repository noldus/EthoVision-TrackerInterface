//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   StimulusStorageSettings.thrift
//----------------------------------------------------------------------------
// Revisions  :
//----------------------------------------------------------------------------

include "..\\Types\\CommonTypes.thrift"

namespace * Noldus.NLinx.Contracts.Public

/** 
 *  Specifies settings that determine the storage of stimulus data. 
 */
struct StimulusStorageSettings
{
    /** The identifier of the stimulus logger process to which the settings apply. So the settings in this struct are only applied to this stimulus logger process ID.*/
    1: optional CommonTypes.GUID stimulusLoggerProcessId,
}
