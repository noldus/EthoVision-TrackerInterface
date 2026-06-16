//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   SignalDefinitionDisplay.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 14-03-2023 Rogier Giesen - Original version
//----------------------------------------------------------------------------

include "..\\..\\Common\\Types\\CommonTypes.thrift"

namespace * Noldus.NLinx.Contracts.Public.Entities

/** The SignalDefinitionDisplay contains information on how to display a signal. 
*/
struct SignalDefinitionDisplay
{
    /** the unit (suffix). E.g. 'mV' for Voltage*/
    1: optional string unit,

    /** The minimum on the vertical axis.*/
    2: optional double min,

    /** The maximum on the vertical axis.*/
    3: optional double max,

    /** The (expected) freqency of the signal.*/
    4: optional double frequency,

    /** Whether the signal is selected by default.*/
    5: optional bool selected

}
