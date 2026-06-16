//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   FileStorageService.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 03-01-2022 Adrian Kovacs             - Original version
//----------------------------------------------------------------------------

include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "..\\..\\Common\\Interfaces\\CommonService.thrift"
include "..\\Entities\\Video.thrift"

namespace * Noldus.NLinx.Contracts.Public.Services

/** Version of the interface.*/
const i32         interfaceVersion          = 1;

/** The name of the RabbitMQ exchange on which the communication of this service runs.*/
const string      exchange                  = "Noldus.NLinx.Public.FileStorageService"

/** This service runs on a direct exchange.*/
const CommonTypes.ExchangeType exchangeType = CommonTypes.ExchangeType.DIRECT

/** Use this routing key to direct messages to this service.*/
const string      routingKey                = "9b3ab2f1-9a76-4e53-be45-b6b3ec75230f"

/** 
* The command interface to operate the file storage service. 
*/
service FileStorageService extends CommonService.CommonService
{
    /**
     *  Get a list of all videos that are present in the service. 
     *  @return A list of all existing videos, unordered, i.e. in the same order as is stored in persistent storage.
     *  @Exception: None.
     */
    list<Video.Video>       GetVideos            (
                                                 ) throws(1: CommonTypes.SystemException sysEx, 2: CommonTypes.ApplicationException appEx);

    /** Get the video information object for the specified video ID.
     * @return The video object that belongs to the specified video ID.
     * @Exception: ApplicationException if a video cannot be found for the specified ID.
     */
    Video.Video             GetVideo             ( /** The video ID for which the video information is requested.*/
                                                   1: CommonTypes.GUID videoId
                                                 ) throws(1: CommonTypes.SystemException sysEx, 2: CommonTypes.ApplicationException appEx);

                                                     /** Get the video information object for the specified video ID.
     * @return The video ID that belongs to the specified video name.
     * @Exception: ApplicationException if a video cannot be found for the specified name.
     */
    CommonTypes.GUID        GetVideoId          ( /** The basic name (without guid) for which the video id is requested.*/
                                                   1: string videoName
                                                 ) throws(1: CommonTypes.SystemException sysEx, 2: CommonTypes.ApplicationException appEx);

    /**
    * Deletes the videos for the specified id's from the service.
    * @return The number of deleted videos
    */
    i32                     DeleteVideos         ( /** A list of video ids.*/
                                                   1: list<CommonTypes.GUID> videoIds
                                                 ) throws(1: CommonTypes.SystemException sysEx, 2: CommonTypes.ApplicationException appEx);

    /**
    * Retreive video metadata information
    * @return The video structure contains the metadata.
    */
    Video.Video             GetVideoWithMetaData ( /** The video ID for which the video metadata is requested.*/
                                                   1: CommonTypes.GUID videoid
                                                 ) throws(1: CommonTypes.SystemException sysEx, 2: CommonTypes.ApplicationException appEx);
}
