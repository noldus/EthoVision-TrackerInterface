//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   CognitiveLoadStorageSettings.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 15-07-2020 Rogier Giesen   - Original version
//----------------------------------------------------------------------------
include "..\\Types\\CommonTypes.thrift"
include "..\\Types\\ProgramTypes.thrift"

namespace * Noldus.NLinx.Contracts.Public

/** 
 *  The Cognitive Load storage settings are used during saving or retrieval of Cognitive Load data. They allow to specify what to be saved or loaded.
 */
struct CognitiveLoadStorageSettings
{
    /** The name of the computer to collect both image data and eye tracker data. So the settings in this struct are only applied to these.*/
    1: optional string computerName,

    /** Tags can be used to label the Cognitive Load data in storage with custom string values. These tags can be used later during data retrieval, to define
    *   what data should be retrieved from storage. For example, when the Cognitive Load data is recorded within a session, use a tag with name sessionId and 
    *   value a session guid.*/
    2: optional map<string, string> tags,

    /** When saving: specify true and cognitive load data will be saved to storage, specify false and cognitive load data will not be saved to storage.
    *   When retrieving: specify true to retrieve cognitive load data.*/
    4: optional bool saveCogLoadDataToStorage,

    /** When specified, it specifies the to and from times for gettings or setting data. */
    3: optional CommonTypes.SampleTimeInterval sampleTimeInterval
}
