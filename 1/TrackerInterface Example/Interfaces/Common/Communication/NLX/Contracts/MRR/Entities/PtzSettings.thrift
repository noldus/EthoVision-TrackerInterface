//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   MRR
// Module     :   Noldus.Mrr.Contracts
// File       :   PtzSettings.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 09-06-2015 Gabriela Ignacio                 - Original version
//----------------------------------------------------------------------------
include "..\\Types\\VisoTypes.thrift"
include "..\\Entities\\CameraPosition.thrift"

namespace csharp Noldus.NLinx.Contracts.Viso.Entities
namespace * Noldus.NLinx.Contracts.Viso

/**
 *  An entity that contains the ptz settings of an audio device
 */
struct PtzSettings
{
    /**  A unique identifier of the pan tilt zoom settings */
    1: optional i32 id,

    /** Flips camera horizontal movement direction */
    2: optional bool flipPan,

    /** Flips camera vertical movement direction */
    3: optional bool flipTilt,

    /** One or more default camera positions (normally 2) */
    4: optional list<CameraPosition.CameraPosition> defaultCameraPositions,

    /** true if PTZ is supported on this device */
    5: optional bool isPTZSupported
}