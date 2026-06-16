//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Common Contracts
// File       :   ErrorCodes.thrift
//----------------------------------------------------------------------------
// Revisions  :
//----------------------------------------------------------------------------

namespace * Noldus.NLinx.Contracts.Common

/** Error codes used by the services of the N-Linx Common Contracts. */
enum EErrorCode
{
    /** Default is success.*/
    SUCCESS  = 0,

    /************************************************************************************************************/
    /** Generic error range 1 - 999                                                                             */
    /** To be used when a classification does not apply or the error originates from un unhandled situation.    */
    /************************************************************************************************************/

    /** A generic failure when the error situation is not detailed by one of the below error codes. */
    FAILURE   = 1,

    /** A failure in some internal routine which may not be specified in more detail */
    INTERNAL  = 2,

    /** Time out */
    TIME_OUT = 3,

    /** The call was received in the service but the service is closed for some reason. For example, when closing down the service application 
     *  and a very last request is just received but cannot be handled, for example because the database is already closed.
     */
    SERVICE_CLOSED = 4,

    /** The call failed because of an exception in the application or business logic. The description contains detailed information about this exception.*/
    APPLICATION_LOGIC = 5

    /************************************************************************************************************/
    /** Error range 1000 - 1999                                                                                 */
    /** ProgramService errors                                                                                   */
    /************************************************************************************************************/

    /** This can happen when the specified program is not registered at the N-Linx Agent. */
    PROGRAM_NOT_REGISTERED = 1000,

    /** This can happen when the specified program is registered but not found on the computer where the N-Linx Agent runs. */
    PROGRAM_NOT_FOUND = 1001,

    /** The program info XML file did not defined a program path or the path is invalid. */
    PROGRAM_INVALID_PATH_SPECIFICATION = 1002,

    /************************************************************************************************************/
    /** Error range 2000 - 2999                                                                                 */
    /** ProcessService errors                                                                                   */
    /************************************************************************************************************/

    /** The configuration settings are not valid. */
    PROCESS_CONFIGURATION_NOT_VALID = 2000,

    /** The process start recording failed. */
    PROCESS_START_RECORDING_FAILURE = 2001,

    /** The process stop recording failed. */
    PROCESS_STOP_RECORDING_FAILURE  = 2002,

    /** The process master-slave setting failed. */
    PROCESS_MASTERSLAVE_FAILURE     = 2003,

    /** The process configuration setting failed. */
    PROCESS_CONFIGURATION_FAILURE   = 2004,

    /** The process init recording failed. */
    PROCESS_INIT_RECORDING_FAILURE  = 2005,

    /** The process exit failed. */
    PROCESS_EXIT_FAILURE            = 2006,

    /** The hardware device could not be found. */
    PROCESS_HARDWARE_DEVICE_NOT_FOUND = 2007,

    /** The connection to the hardware device was lost. */
    PROCESS_HARDWARE_DEVICE_CONNECTION_LOST = 2008,

    /** The software of the device is not running. */
    PROCESS_DEVICE_SOFTWARE_NOT_RUNNING = 2009,    
}
