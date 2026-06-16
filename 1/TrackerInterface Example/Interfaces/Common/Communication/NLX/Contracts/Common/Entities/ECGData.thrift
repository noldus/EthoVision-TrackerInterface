//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Entities Contracts
// File       :   ECGData.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 14-01-2021 Cecilia Herrera - Original version
//----------------------------------------------------------------------------

include "..\\Types\\CommonTypes.thrift"
include "..\\Types\\ECGTypes.thrift"
include "ECGSample.thrift"

namespace * Noldus.NLinx.Contracts.Public.Entities

/** ECG data contains one or more ECG samples and its related meta data. The raw ECG data is collected by a ECG collector process.*/
struct ECGData
{
    /** A unique identifier of the ECG collector which was used to generate the raw ECG data. In most cases you can pass in the process ID of the hosting 
    *   N-Linx process, but this is not always required. This ID will be used to identify the collected ECG data and its derived data, so as long as this ID is unique
    *   it can be used to identify the collected ECG data. */
    1: optional CommonTypes.GUID ecgCollectorId,

    /** It defines the type of physiology sensor system (e.g. for ECG: Lead3, Lead5 ). */
    2: optional ECGTypes.EEcgSensorType ecgSensorType,
    
    /** A list of collected ECG samples. */
    3: list<ECGSample.ECGSample> ecgSamples,

    /** The rate set on the ECG sensor, in samples per second, at which the continuous ECG signal is sampled.*/
    4: optional double samplingRate,
}
