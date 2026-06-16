//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Types Contracts
// File       :   NotificationEvent.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 16-02-2019 Tijmen van Voorthuijsen   - Original version
//----------------------------------------------------------------------------

include "..\\Types\\CommonTypes.thrift"
include "..\\Types\\NotificationIds.thrift"

namespace * Noldus.NLinx.Contracts.Public

/** Holds information about a notification event.*/
struct NotificationEvent
{
    /** The ID of the event notification.*/	
    1: required NotificationIds.ENotificationId notificationId,

    /** If the event notification is about an entity that is identified by a guid, then this fields holds the value of the guid identifier.*/
    2: optional CommonTypes.GUID entityId,

    /** If the event notification indicates a change in a name, then this field holds the value of the new name.*/
    3: optional string newName,

    /** If the notification ID indicates a change in a date and time, then this field holds the new date and time value.*/
    4: optional CommonTypes.IsoDateTime newTime,

    /** If the notification contains a message as well then this field contains it.*/
    5: optional string message,

    /** If the notification involves an N-Linx process id or change in N-Linx process id, then this field holds the existing value or new value of the process id.*/
    6: optional CommonTypes.GUID processId,
}
