//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   LocationLockInfo.thrift
//----------------------------------------------------------------------------
// Revisions  :
//----------------------------------------------------------------------------
include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "..\\Types\\ResourceTypes.thrift"

namespace * Noldus.NLinx.Contracts.Public.Entities

/** Information corresponding to locking of a location */
struct LocationLockInfo
{
    /** Locking status of the corresponding location.*/
    1: optional ResourceTypes.ELockStatus status,
    
    /** The user, who locked the location.*/
    2: optional string user,

    /** ID of the project for which the location was locked.*/
    3: optional CommonTypes.GUID projectId,

    /** Scope of the lock.*/
    4: optional ResourceTypes.ELockScope scope,

    /** The full name of the user, who locked the location.*/
    5: optional string userFullName

}
