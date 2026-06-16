//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   N-Linx Contracts
// File       :   SoftwareProtectionService.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 27-05-2016   Tijmen van Voorthuijsen - Original version
//----------------------------------------------------------------------------
include "..\\Types\\SoftwareProtectionTypes.thrift"

namespace * Noldus.NLinx.Contracts.NLinx


// Settings for this service
/** Version of the interface.*/
const i32         interfaceVersion          = 1
/** The username of the special NxP user which can only log in to the NxP vhost.*/
const string      userName                  = "nolocker"
/** The password of the special user which can only log in to the NxP vhost.*/
const string      password                  = "mx2pqVd(v=}dQ4}{ZyqlnLo"
/** The virtual host for the software protection. This virtual host is created during the installation of the RabitMQ server. */
const string      vHost                     = "/lock"
/** The name of the RabbitMQ exchange on which the communication of this service runs.*/
const string      exchange                  = "Noldus.NLinx.Nxp"
/** The first routing key that all running processes should be listening on.*/
const string      mainRoutingKey            = "All"
/** This service runs on a topic exchange that supports multiple routing keys. For this service two routing keys are used:
 *  1. The mainRoutingKey as defined above.
 *  2. The GUID of a process when you want to target a specific process, e.g. used in the StartRecording method. */
const SoftwareProtectionTypes.ExchangeType exchangeType = SoftwareProtectionTypes.ExchangeType.TOPIC


/** 
*   The process service is responsible for querying the list of all running processes in
*   the N-Linx connected network and can be controlled for starting and stopping of a recording. 
*/
service SoftwareProtectionService
{
    /* A broadcast unlock request send regularly by all N-Linx node in the network.*/
    oneway void			    UnlockRequest           (   /** Identifier of the N-Linx node that sends the unlock request. This identifier is used as the routing key 
                                                         *  to send back the unlock response to the correct sender.*/
                                                        1: SoftwareProtectionTypes.GUID requestorId,

                                                        /** Holds the unlocking request data, a public key and a nonce.*/
                                                        2: SoftwareProtectionTypes.UnlockRequestData unlockRequestData
                                                    );
    /* A unicast unlock reposne send only to the requestor based on the processId of the requestor set as routing key. */
    oneway void             UnlockResponse          (   /** Identifier of the requestor, i.e. myself.*/
                                                        1: SoftwareProtectionTypes.GUID requestorId,
                                                        
                                                        /** Holds the unlock information, if valid. This unlock information consists of the signature and password, among others. */
                                                        2: SoftwareProtectionTypes.UnlockResponseData unlockResponseData
                                                    );
}
