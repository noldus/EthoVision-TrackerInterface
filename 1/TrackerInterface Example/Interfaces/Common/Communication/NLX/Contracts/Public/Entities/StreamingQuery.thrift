//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   StreamingQuery.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 11-03-2022 Tijmen van Voorthuijsen - Original version
//----------------------------------------------------------------------------
include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "..\\..\\Common\\Types\\ProgramTypes.thrift"
include "..\\..\\Common\\Types\\PhysiologyTypes.thrift"

namespace * Noldus.NLinx.Contracts.Public

/** 
 *  The physiology ecg storage settings are used during saving or retrieval of ecg physiology data. They allow to specify what to be saved or loaded.
 */
struct StreamingQuery
{
    /** The identifier of the collector process to which the settings apply. So the settings in this struct are only applied to this collector process ID.*/
    1: optional CommonTypes.GUID CollectorProcessId,

    /** Tags can be used to label the physiology data in storage with custom string values. These tags can be used later during data retrieval, to define
    *   what data should be retrieved from storage. For example, when the physiology data is recorded within a session, use a tag with name sessionId and 
    *   value a session guid.*/
    2: optional map<string, string> tags,

    /** When specified, it specifies the to and from times for gettings or setting data. */
    3: optional CommonTypes.SampleTimeInterval sampleTimeInterval,

    /** Select here which type of data should be restreamed from the physiology service.*/
    4: optional PhysiologyTypes.ERestreamingDataType selectedDataType
}
