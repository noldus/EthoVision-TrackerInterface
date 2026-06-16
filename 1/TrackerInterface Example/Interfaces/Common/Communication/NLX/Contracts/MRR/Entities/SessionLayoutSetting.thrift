//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   MRR
// Module     :   Noldus.Mrr.Contracts
// File       :   SessionLayoutSetting.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 28-04-2017 Dragana Verpoort Petric           - Original version
//----------------------------------------------------------------------------
include "..\\Entities\\Media.thrift"
include "..\\Types\\VisoTypes.thrift"

namespace csharp Noldus.NLinx.Contracts.Viso.Entities
namespace * Noldus.NLinx.Contracts.Viso

/**
 *  The session's layout settings. 
 */
struct SessionLayoutSetting
{
    /** A unique identifier of the file. */
    1: optional i32 id,

    /** The media of the session for which layout settings are saved. */
    2: optional Media.Media media,

    /** Video layout of the session's room. */
    3: optional VisoTypes.EVideoLayout videoLayout
}