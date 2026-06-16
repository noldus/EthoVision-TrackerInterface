//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   ResourceTypes.thrift
//----------------------------------------------------------------------------
// Revisions  :
//----------------------------------------------------------------------------

namespace * Noldus.NLinx.Contracts.Public.Types


/** Defines an aggregated state for a device. The device status can be composed from origins, like the run status of an N-Linx process up until the
*   condition that a hardware device has been plugged in and is delivering */
enum EDeviceStatus
{
    /** The default status of a device.*/
    Offline			= 0,

    /** When a device is online, it can be used for making recordings.*/
    Online		    = 1,
}

/** Location lock status  */
enum ELockStatus
{
    /** Location is free to use*/
    Unlocked        = 0,

    /** Location exclusivle locked */
    Locked          = 1
}

/** Location lock scope  */
enum ELockScope
{
    /** Project level, lock corresponds to a certain project */
    Project         = 0,

    /** Application level */
    Application     = 1
}

