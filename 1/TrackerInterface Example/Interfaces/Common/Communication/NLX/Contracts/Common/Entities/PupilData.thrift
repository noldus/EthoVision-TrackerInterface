//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Common Entities Contracts
// File       :   PupilData.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 28-08-2018 Cecilia Herrera   - Original version
//----------------------------------------------------------------------------

include "..\\Types\\CommonTypes.thrift"

namespace * Noldus.NLinx.Contracts.Common

/** Provides properties for the pupil data. */
struct PupilData
{
    /** The diameter of the pupil in millimeters. */
    1: optional double pupilDiameter,

    /** The validity of the pupil data. */
    2: optional CommonTypes.EValidity validity
}
