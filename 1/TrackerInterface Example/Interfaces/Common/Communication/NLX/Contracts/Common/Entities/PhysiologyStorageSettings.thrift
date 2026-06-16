//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   PhysiologyStorageSettings.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 28-01-2021 Dragana Verpoort Petric   - Original version
//----------------------------------------------------------------------------
include "..\\Types\\CommonTypes.thrift"
include "..\\Types\\ProgramTypes.thrift"

namespace * Noldus.NLinx.Contracts.Public

/** 
 *  The physiology storage settings are used during saving or retrieval of physiology data. They allow to specify what to be saved or loaded.
 */
struct PhysiologyStorageSettings
{
    /** The identifier of the collector process to which the settings apply. So the settings in this struct are only applied to this collector process ID.*/
    1: optional CommonTypes.GUID CollectorProcessId,

    /** Tags can be used to label the physiology data in storage with custom string values. These tags can be used later during data retrieval, to define
    *   what data should be retrieved from storage. For example, when the physiology data is recorded within a session, use a tag with name sessionId and 
    *   value a session guid.*/
    2: optional map<string, string> tags

    /** When specified, it specifies the to and from times for gettings or setting data. */
    3: optional CommonTypes.SampleTimeInterval sampleTimeInterval,

    /** Specifies the storage behavior, for saving or retrieving raw data. Because this field is optional, it can have three states:
    *   1. Not specified: it will not alter the storage behavior, So, for example, if storing raw data is active and this field is not specified in a call, it will continue
    *      to storage raw data.
    *   2. True: it will turn on the saving of raw data when used for saving methods, or it will specify to retrieve raw data in retrieve methods.
    *   3. False: it will turn off the saving of raw data, when used for saving methods, or it will specify not to retrieve raw data in retrieve methods
    */
    4: optional bool SelectRawData,

    /** Specifies the storage behavior, for saving or retrieving processed data. Because this field is optional, it can have three states:
    *   1. Not specified: it will not alter the storage behavior, So, for example, if storing processed data is active and this field is not specified in a call, it will continue
    *      to storage processed data.
    *   2. True: it will turn on the saving of processed data when used for saving methods, or it will specify to retrieve processed data in retrieve methods.
    *   3. False: it will turn off the saving of processed data, when used for saving methods, or it will specify not to retrieve processed data in retrieve methods
    */
    5: optional bool SelectProcessedData,
}
