//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Viso Contracts
// File       :   CameraPosition.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 11-06-2015 Gabriela Ignacio            - Original version
//----------------------------------------------------------------------------


namespace csharp Noldus.NLinx.Contracts.Viso.Entities
namespace * Noldus.NLinx.Contracts.Viso


/**
 *  Represents a camera position, used to store default camera positions for a video device with PTZ available
 */
struct CameraPosition
{
    /** A unique identifier of the camera position */
    1: optional i32 id,

    /** The index of this camera position, used to make the order persistent */
    2: optional i32 orderIndex,

    /** Position on the x axis */
    3: optional double x,

    /** Position on the y axis */
    4: optional double y,

    /** Position on the z axis */
    5: optional double z
}

