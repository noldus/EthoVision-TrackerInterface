//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   PhysiologyPpgStorageSettings.thrift
//----------------------------------------------------------------------------
include "..\\Types\\CommonTypes.thrift"
include "..\\Types\\ProgramTypes.thrift"

namespace * Noldus.NLinx.Contracts.Public

/** 
 *  The physiology ppg storage settings are used during saving or retrieval of ppg physiology data. They allow to specify what to be saved or loaded.
 */
struct PhysiologyPpgStorageSettings
{
    /** The identifier of the PPG collector process to which the settings apply. So the settings in this struct are only applied to this ppg collector process ID.*/
    1: optional CommonTypes.GUID ppgCollectorProcessId,

    /** Tags can be used to label the physiology data in storage with custom string values. These tags can be used later during data retrieval, to define
    *   what data should be retrieved from storage. For example, when the physiology data is recorded within a session, use a tag with name sessionId and 
    *   value a session guid.*/
    2: optional map<string, string> tags

    /** When saving: specify true and heart data will be saved to storage, specify false and heart data will not be saved to storage.*/
    3: optional bool saveHeartDataToStorage,   

    /** When saving: specify true and PPG data will be saved to storage, specify false and PPG data will not be saved to storage.*/
    4: optional bool savePpgDataToStorage,

    /** When specified, it specifies the to and from times for gettings or setting data. */
    5: optional CommonTypes.SampleTimeInterval sampleTimeInterval,
    
}
