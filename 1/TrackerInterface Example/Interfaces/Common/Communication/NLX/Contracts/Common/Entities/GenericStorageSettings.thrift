//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   GenericStorageSettings.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 15-01-2022 Rogier Giesen   - Original version
//----------------------------------------------------------------------------
include "..\\Types\\CommonTypes.thrift"
include "..\\Types\\ProgramTypes.thrift"

namespace * Noldus.NLinx.Contracts.Public

/** 
 *  The generic data storage settings are used during saving or retrieval of generic data data. They allow to specify what to be saved or loaded.
 */
struct GenericStorageSettings
{
    /** The identifiers of the processes that produce the data to which the settings apply. So the settings in this struct are only applied to these process IDs.*/
    1: optional CommonTypes.GUID dataSourceProcessId,

    /** Tags can be used to label the generic data data in storage with custom string values. These tags can be used later during data retrieval, to define
    *   what data should be retrieved from storage. For example, when the generic data data is recorded within a session, use a tag with name sessionId and 
    *   value a session guid.*/
    2: optional map<string, string> tags

    /** When saving: specify true and generic data data will be saved to storage, specify false and generic data data will not be saved to storage.*/
    3: optional bool saveGenericDataToStorage,

    /** When specified, it specifies the to and from times for gettings or setting data. */
    4: optional CommonTypes.SampleTimeInterval sampleTimeInterval,
}
