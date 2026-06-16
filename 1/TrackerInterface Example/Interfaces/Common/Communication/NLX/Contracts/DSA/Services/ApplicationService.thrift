//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   Dsa
// Module     :   Noldus.Dsa.Communication.Contracts
// File       :   ApplicationService.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 08-05-2017 Tijmen van Voorthuijsen   - Original version
//----------------------------------------------------------------------------

include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "..\\Types\\DataLabTypes.thrift"        // This include is not used in this file, but needs to be compiled. Compilation is defined only for services in the prebuild step.

namespace * Noldus.NLinx.Contracts.DataLab.Services


/** Major version of the interface.*/
const i32         interfaceVersion          = 1;

/** The name of the RabbitMQ exchange on which the communication of this service runs.*/
const string      exchange                  = "Noldus.NLinx.DataLab.ApplicationService"

/** This service runs on a Direct exchange that supports one routing key. */
const string      routingKey                = "5171db2c-fd99-4f0c-9f51-d41be38120f2"

/** The application service runs on a direct exchange.*/
const CommonTypes.ExchangeType exchangeType = CommonTypes.ExchangeType.DIRECT

/**
 * Version information
 */
struct VersionInfo
{
    /** The full version string like "1.0.2.34". */
    1: optional string version,
}


/** 
 *  The application service is responsible for proving application level information, for example 
 *  the version of the current running DataLab Services. 
 */
service ApplicationService
{
    /**
     *  Get version information about the DataLab Services.
     *  @return Version information about the DataLab Services.
     */
    VersionInfo     GetVersionInfo   ();

}
