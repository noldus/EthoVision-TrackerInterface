//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   NotificationService.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 16-02-2019 Tijmen van Voorthuijsen           - Original version
//----------------------------------------------------------------------------
include "..\\Types\\CommonTypes.thrift"
include "..\\Entities\\NotificationEvent.thrift"
include "..\\Entities\\Process.thrift"

namespace * Noldus.NLinx.Contracts.Public

/** The name of the RabbitMQ exchange on which the messages of this service runs.*/
const string      exchange                  = "Noldus.NLinx.Public.Events.Notification"
/** This service runs on a topic exchange which allows fine-grained routing of all types of event notifications.*/
const CommonTypes.ExchangeType exchangeType = CommonTypes.ExchangeType.TOPIC

/** This service runs on a topic exchange that supports routing keys in the following format:
 *
 *  "{domain}"		
 *
 *  Example: "eyetracking"
*/

/**
*  The notification service is responsible for sending and receiving notifications
*/
service NotificationService
{
    /**
     *  Sends/receives a change notification in the public N-Linx network.
     */
    oneway void Notify(
                        /** The N-Linx process that sends out the notification. This parameter is mostly used for diagnostic purposes, just to understand who has send the notification.
                        *   It is allowed to use a default process here with a process ID of zero. In that case the receiver will not know who has send the notification.*/
                        1: Process.Process sender,
                        /** Information on the notification, the ID and optional new or changed data.*/
                        2: NotificationEvent.NotificationEvent notificationEvent);
}