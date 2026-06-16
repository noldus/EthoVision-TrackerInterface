//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   PhysiologyTypes.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 09-12-2021 Cecilia Herrera - Original version
//----------------------------------------------------------------------------

include "CommonTypes.thrift"
include "ProgramTypes.thrift"

namespace * Noldus.NLinx.Contracts.Public.Types.Physiology

/** Defines different types of ECG/PPG heart sample processors.*/
enum EHeartSampleDataType
{
    /** An undefined processor */
    Undefined = 0,

    /** A processor for Heart Rate data */
    HR = 1,

    /** A processor for Inter-Beat-Interval data */
    IBI = 2,
}

/** Defines different types of EDA skin conductance sample processed data type. */
enum ESkinConductanceSampleDataType
{
    /** An undefined processed data type */
    Undefined = 0,

    /** A processed data type for Baseline data */
    Baseline = 1,

    /** A processed data type for Average Peaks data */
    AveragePeaks = 2,
}

/** Defines the types of physiology data that can be restreamed from the physiology service.*/
enum ERestreamingDataType
{
    /** Restreaming of raw ECG data.*/
    ECG = 0,

    /** Restreaming of raw PPG data.*/
    PPG = 1,

    /** Restreaming of raw EDA data.*/
    EDA = 2,

    /** Restreaming of heart data, which includes for example HR and IBI.*/
    HeartData = 3,

    /** Restreaming of skin conductance data, which includes for example Baseline and AveragePeaks.*/
    SkinConductanceData = 4,
}

/** Defines the settings to delete data from the physiology service, data that is related to the recording of a physiology sensor.*/
struct DeleteQuery
{
    /** The type of physiology device.*/
    1: optional ProgramTypes.EDeviceType DeviceType,

    /** Tags can be used to label the physiology data in storage with custom string values. These tags can be used later during data retrieval, to define
    *   what data should be retrieved from storage. For example, when the physiology data is recorded within a session, use a tag with name sessionId and 
    *   value a session guid.*/
    2: optional map<string, string> tags
}
