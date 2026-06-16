//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Viso Contracts
// File       :   VideosService.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 01-03-2022 Laszlo Abari-Toth           - Original version
//----------------------------------------------------------------------------
include "..\\Types\\VisoTypes.thrift"
include "..\\..\\Common\\Interfaces\\CommonService.thrift"

namespace csharp Noldus.NLinx.Contracts.Viso.Services
namespace * Noldus.NLinx.Contracts.Viso

// Settings for this service
const i32         interfaceVersion  = 2;
const string      exchange          = "Noldus.NLinx.Viso.VideosService"
const string      routingKey        = "00000000-0000-0000-0000-000000000000"


/**
 *  The Videos service is responsible for creating combined video files.
 */
service VideosService extends CommonService.CommonService
{

    /**
     *  Try to generate combined video file
     *  @return boolean - the result
     */
    void TryCreatePbp(
            /** list of video files*/
            1:  list<string> videoFiles,
            /** path to the destination file */
            2:  string pbpVideoPath,
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

    /**
     *  Check is the combine graph still working
     *  @return boolean - the result
     */
        bool PbpProcessing() throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);
}