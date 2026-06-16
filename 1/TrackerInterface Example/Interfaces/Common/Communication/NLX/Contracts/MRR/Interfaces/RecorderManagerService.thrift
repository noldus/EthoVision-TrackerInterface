//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Viso Contracts
// File       :   RecorderManagerService.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 08-08-2023 Krizsán Péter           - Original version
//----------------------------------------------------------------------------
include "..\\Types\\VisoTypes.thrift"
include "..\\Entities\\Machine.thrift"
include "..\\..\\Common\\Interfaces\\CommonService.thrift"

namespace csharp Noldus.NLinx.Contracts.Viso.Services
namespace * Noldus.NLinx.Contracts.Viso

// Settings for this service
const i32         interfaceVersion  = 2;
const string      exchange          = "Noldus.NLinx.Viso.RecorderManagerService"
const string      routingKey        = "A58BB872-6A76-48E5-AA97-D20D93504FAD"


/**
 *  The recorder manager service is responsible for Recorder Manager actions.
 */
service RecorderManagerService extends CommonService.CommonService
{
    /**
     *  Changes the used machine to the given one when registering to Viso Services.
     */
    void ChangeMachine(
            /** The machine to use with the Recorder Manager for registration. */
            1: Machine.Machine machine
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);
}
