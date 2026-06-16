//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Common Contracts
// File       :   LoggingService.thrift
//----------------------------------------------------------------------------
// Revisions  :
//----------------------------------------------------------------------------
include "..\\Types\\CommonTypes.thrift"
include "CommonService.thrift"

namespace * Noldus.NLinx.Contracts.Common

/** Version of the interface.*/
const i32         interfaceVersion  = 1;
/** The name of the RabbitMQ exchange on which the communication of this service runs.*/
const string      exchange          = "Noldus.NLinx.Common.LoggingService"
/** This service runs on a Direct exchange that supports one routing key. */
const string      routingKey        = "aff15099-451b-43dd-b557-e5d45649d0f8"
/** The logging service runs on a direct exchange.*/
const CommonTypes.ExchangeType exchangeType = CommonTypes.ExchangeType.DIRECT


/**
 *  Represents the severity of the logged message.
 */
enum ESeverity
{
    /** The message contains trace information.*/
    Trace = -1,

    /** Used for debugging only.*/
    Debug = 0,

    /** The message is purily informational.*/
    Info = 1,

    /** A warning situation was encountered which could be solved locally, e.g. by a workaround or using defaults settings. The program continues normally.*/
    Warning = 2,

    /** A recoverable error was encountered but this error was not fully solved. Solving might be done by user action. The program continues but may expose (other) errors.*/
    Error = 3,

    /** A fatal error was encountered from which no recovery could be done. The program will normally be terminated when this type of error occurs.*/
    Fatal = 4
}


struct LogInfo
{
    /** The severity of the message.*/
    1:  optional ESeverity severity,
    
    /** By specifying an application domain you tell the logging service to output the log into a separate log file, specific to an
     *  application domain. Leave this field empty (= empty string) when you want to log to the default log file of the Logging Service.
     */
    2:  optional string applicationDomain,

    /** The message that need to be logged.*/
    3:  optional string message
}


/**
 *  The logging service is responsible of error logging
 */
service LoggingService extends CommonService.CommonService
{

    /**
     *  Logs a message to the Diagnostic Logging Service. Uses one way call (a.k.a. fire and forget) and is non-blocking.
     */
    oneway void LogMessage(
            /** Information about what and how to be logged.*/
            1:  LogInfo logInfo
        );

}