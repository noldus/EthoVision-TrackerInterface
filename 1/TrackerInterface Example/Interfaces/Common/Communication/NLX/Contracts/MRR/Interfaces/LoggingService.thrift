//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Viso Contracts
// File       :   LoggingService.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 18-02-2015 Jeroen Diederix           - Original version
//----------------------------------------------------------------------------
include "..\\Types\\VisoTypes.thrift"
include "..\\..\\Common\\Interfaces\\CommonService.thrift"

namespace csharp Noldus.NLinx.Contracts.Viso.Services
namespace * Noldus.NLinx.Contracts.Viso

// Settings for this service
const i32         interfaceVersion  = 2;
const string      exchange          = "Noldus.NLinx.Viso.LoggingService"
const string      routingKey        = "D209504E-875F-431B-AF03-6F2C6F81EAEC"


/**
 *  Represents the severity of the logged message.
 */
enum ESeverity
{
    /** The message is purily informational */
    Informational = 0,

    /** The message represents a warning, nothing went wrong. */
    Warning = 1,

    /** A recoverable error was encountered, and now logged. */
    Error = 2,

    /** A fatal error was encountered, and now logged. */
    Fatal = 3
}


/**
 *  The logging service is responsible of error logging
 */
service LoggingService extends CommonService.CommonService
{

    /**
     *  Logs a message to the MRR Logging Service. Uses one way call (a.k.a. fire and forget) and is non-blocking.
     */
    oneway void LogMessage(
            /** The severity of the message, low severities may not be logged. */
            1:  ESeverity severity
            /** The message that need to be logged. */
            2:  string message
        );

}
