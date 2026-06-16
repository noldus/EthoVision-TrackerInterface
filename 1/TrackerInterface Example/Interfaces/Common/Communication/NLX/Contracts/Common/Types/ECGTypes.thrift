//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   ECGTypes.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 14-01-2021 Cecilia Herrera - Original version
//----------------------------------------------------------------------------

include "CommonTypes.thrift"

namespace * Noldus.NLinx.Contracts.Public.Types

/** Defines different types of physiology ECG sensor systems.*/
enum EEcgSensorType
{
    /** A physiology sensor system of undefined type. Use this type only when no other of the types below cover your sensor. The type does not
        provide any information at all to the recipient of your data, so use this type sparingly.*/
    Undefined = 0,

    /** A 5-Lead ECG system */
    Lead5,
}

/** Defines different types of ECG signals.*/
enum EEcgSignalType
{
    /** An ECG signal of undefined type. Use this type only when no other of the types below cover your signal type. The type does not
        provide any information at all to the recipient of your data, so use this type sparingly.*/
    Undefined = 0,

    /** For a 3 or 5-lead: Lead I - RA-LA = Right Arm - Left Arm */
    Lead_I,

    /** For a 3 or 5-lead: Lead II - RA-LL = Right Arm - Left Leg */
    Lead_II,

    /** For a 3 or 5-lead: Lead III - LA-LL = Left Arm - Left Leg */
    Lead_III,

    /** For a 3 or 5-lead: Vx - Chest - Right Leg (ground) */
    Vx, 
}

