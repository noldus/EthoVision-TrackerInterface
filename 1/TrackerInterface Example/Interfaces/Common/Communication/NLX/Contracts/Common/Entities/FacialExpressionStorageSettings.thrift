//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   FacialExpressionStorageSettings.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 15-07-2020 Cecilia Herrera   - Original version
//----------------------------------------------------------------------------
include "..\\Types\\CommonTypes.thrift"
include "..\\Types\\ProgramTypes.thrift"

namespace * Noldus.NLinx.Contracts.Public

/** 
 *  The facial expression storage settings are used during saving or retrieval of facial expression data. They allow to specify what to be saved or loaded.
 */
struct FacialExpressionStorageSettings
{
    /** The identifier of the process that produces the images to which the settings apply. So the settings in this struct are only applied to this image source process ID.*/
    1: optional CommonTypes.GUID imageSourceProcessId,

    /** Tags can be used to label the facial expression data in storage with custom string values. These tags can be used later during data retrieval, to define
    *   what data should be retrieved from storage. For example, when the facial expression data is recorded within a session, use a tag with name sessionId and 
    *   value a session guid.*/
    2: optional map<string, string> tags

    /** When saving: specify true and facial expression data will be saved to storage, specify false and facial expression data will not be saved to storage.*/
    3: optional bool saveFacialExpressionDataToStorage,

    /** When specified, it specifies the to and from times for gettings or setting data. */
    4: optional CommonTypes.SampleTimeInterval sampleTimeInterval,
}
