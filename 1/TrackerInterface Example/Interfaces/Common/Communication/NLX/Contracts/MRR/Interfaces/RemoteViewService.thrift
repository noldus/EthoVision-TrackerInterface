//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Viso Contracts
// File       :   RemoteViewService.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 10-10-2018Viktor Kovacs           - Original version
//----------------------------------------------------------------------------
include "..\\Types\\VisoTypes.thrift"
include "..\\..\\Common\\Interfaces\\CommonService.thrift"

namespace csharp Noldus.NLinx.Contracts.Viso.Services
namespace * Noldus.NLinx.Contracts.Viso

// Settings for this service
const i32         interfaceVersion  = 2;
const string      exchange          = "Noldus.NLinx.Viso.RemoteViewService"
const string      routingKey        = "A2F79AFD-ACD1-44F0-B105-B498EC617E33"



/**
 *  Return result of StartRemoteView
 */
enum EStartRemoteViewResult
{
    /** Streaming started */
    Started,

    /** Not started, target not found */
    TargetNotFound,

    /** Not started, already started by someone */
    AlreadyStarted,

    /** Not started, because it is not allowed */
    NotAllowed,

    /** No rights for folder creation */
    NoFolderAccess
}


/**
 *  The RemoteViewService
 */
struct RemoteViewResult
{
    /** The result */
    1: optional EStartRemoteViewResult result,

    /** The the location of the hls video */
    2: optional string videoLocation,

    /** Indicates whether this hls video is a combined one or not */
    3: optional bool combined
}


/**
 *  The RemoteViewService
 */
service RemoteViewService extends CommonService.CommonService
{

    /**
     * Start streaming for remote view
     *  @return EStartStreamingResult - The result of the start action
     */
    list<RemoteViewResult> StartRemoteLiveView(
            /** The room id */
            1: i32 roomId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

    /**
     * Start streaming for remote view
     *  @return EStartStreamingResult - The result of the start action
     */
    list<RemoteViewResult> StartRemoteReplayView(
            /** The session id */
            1: i32 sessionId,
            /** The room id */
            2: i32 roomId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  stop streaming for remote view
     */
    void StopRemoteView(
            /** The session id */
            1: i32 sessionId,
            /** The room id */
            2: i32 roomId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

}