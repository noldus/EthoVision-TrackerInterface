//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Common Contracts
// File       :   EyeTrackingCollectionService.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 15-06-2018 Cecilia Herrera   - Original version
//----------------------------------------------------------------------------

include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "..\\..\\Common\\Interfaces\\CommonService.thrift"
include "..\\..\\Common\\Entities\\CalibrationResult.thrift"
include "..\\..\\Common\\Entities\\CalibrationValidationResult.thrift"
include "..\\..\\Common\\Entities\\Process.thrift"

namespace * Noldus.NLinx.Contracts.Public

// Settings for this service

/** Version of the interface.*/
const i32         interfaceVersion          = 1;
/** The name of the RabbitMQ exchange on which the communication of this service runs.*/
const string      exchange                  = "Noldus.NLinx.Public.EyeTrackingCollection"
/** This service runs on a direct exchange using the process ID as routing key. */
const CommonTypes.ExchangeType exchangeType = CommonTypes.ExchangeType.DIRECT


/** 
* The EyeTracking service is used for controlling an eye tracker device or application. It contains
* control functions like for example the calibration procedure. Data is tranfered through a data service.
* The messages are sent to a specific process, ususally the master
*/
service EyeTrackingCollectionService extends CommonService.CommonService
{
    /** Starts the calibration procedure of the eye tracker. This function returns when the calibration has been successfully started.
    *   The end of the calibration, which can be after several tens of seconds, will be announced by a notification message, and not by the return
    *   of this function.
    *   @return void - no return information
    *   @exceptions No specifics
    */ 
    void									StartCalibration(/** The process that wants to start the calibration. This process must be a master of the process that implements the calibration.
                                                              *  When you are making the request you should pass in my process.*/
                                                              1: Process.Process sender) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);

    /** Gets the result of last calibration of eye tracker. This function returns the calibration result.
    *   @return CalibrationResult - status of calibration and results for each target
    *   @exceptions No specifics
    */ 
    CalibrationResult.CalibrationResult		GetCalibrationResult(/** The process that wants to get calibration result. This process must be a master of the process that implements return of calibration result.
                                                                  *   When you are making the request you should pass in my process.*/
                                                                  1: Process.Process sender) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);

    /** Gets the status if calibrating or not. This function returns true if calibrating.
    *   @return bool - status of calibration
    *   @exceptions No specifics
    */ 
    bool		                            GetIsCalibrating(/** The process that wants to get the status of calibration. This process must be a master of the process that implements return of calibration status.
                                                                  *   When you are making the request you should pass in my process.*/
                                                                  1: Process.Process sender) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);

    /** Gets the result of last calibration validation of eye tracker. This function returns the calibration validation result.
    *   @return CalibrationValidationResult - status of calibration validation and results for each validation target.
    *   @exceptions No specifics
    */ 
    CalibrationValidationResult.CalibrationValidationResult		GetCalibrationValidationResult(/** The process that wants to get calibration validation result. This process must be a master of the process that implements return of calibration validation result.
                                                                  *   When you are making the request you should pass in my process.*/
                                                                  1: Process.Process sender) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);

    /** Gets the sampling frequency of the eye tracker. This function returns the value which represents how many times per second the position of the eyes is registered by the eye tracker.
    *   @return double - The sampling frequency of an eye tracking system refers to how many times per second the position of the eyes is registered by the eye tracker.
    *   @exceptions No specifics
    */ 
    double	                                                 	GetEyeTrackerSamplingFrequency (/** The process that wants to get eye tracker sampling frequency. This process must be a master of the process that implements return of eye tracker sampling frequency.
                                                                  *   When you are making the request you should pass in my process.*/
                                                                  1: Process.Process sender) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);
}
