//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   DeviceSelection.thrift
//----------------------------------------------------------------------------
// Revisions  :
//----------------------------------------------------------------------------

include "..\\Types\\CommonTypes.thrift"

namespace * Noldus.NLinx.Contracts.Public

/** 
 *  Defines the devices selected for a data acquisition run. A device is represented in an N-Linx process that has the role of producer.
 */
struct DeviceSelection
{
    /** If specified, it instructs the recording engine to use this eye tracker process and store the eye tracking data to long term storage that
    *   is associated with this eye tracker process ID. The ID is normally the N-Linx process ID of the eye data collection process, but may be a 
    *   different guid as long as the guid can uniquely identify the eye tracking */
    1: optional CommonTypes.GUID eyeTrackerProcessId,

    /** If specified, it instructs the recording engine to use this stimulus logger process and store the stimulus data to long term storage that
    *   is associated with this stimulus logger process ID. The ID is normally the N-Linx process ID of the stimulus data collection process, but may be a 
    *   different guid as long as the guid can uniquely identify the eye tracking */
    2: optional CommonTypes.GUID stimulusLoggerProcessId,   
    
    /** If specified, the identifier of the N-Linx process that acts as an image source for calculating facial expression data and specify to include in long term storage.
    *   This ID is normally the ID of the N-Linx process that acts as the source of the image data, but may be a different guid as long as the guid can uniquely identify
    *   the facial expression data.For example, the video web service can act as an image source, produced from frame grabbing web cam video.*/
    3: optional CommonTypes.GUID facialExpressionImageSourceProcessId, 

    /** If specified, the identifier of the N-Linx process that acts as an ecg source for calculating heart data and specify to include in long term storage.
    *   This ID is normally the ID of the N-Linx process that acts as the source of the ecg data, but may be a different guid as long as the guid can uniquely identify
    *   the ecg data.*/
    4: optional CommonTypes.GUID physiologyEcgProcessId, 

    /** If specified, the identifier of the N-Linx process that acts as an ppg source for calculating heart data and specify to include in long term storage.
    *   This ID is normally the ID of the N-Linx process that acts as the source of the ppg data, but may be a different guid as long as the guid can uniquely identify
    *   the ppg data.*/
    5: optional CommonTypes.GUID physiologyPpgProcessId, 

    /** If specified, the identifier of the N-Linx process that acts as an eda source for calculating processed data and specify to include in long term storage.
    *   This ID is normally the ID of the N-Linx process that acts as the source of the eda data, but may be a different guid as long as the guid can uniquely identify
    *   the eda data.*/
    6: optional CommonTypes.GUID physiologyEdaProcessId, 
}
