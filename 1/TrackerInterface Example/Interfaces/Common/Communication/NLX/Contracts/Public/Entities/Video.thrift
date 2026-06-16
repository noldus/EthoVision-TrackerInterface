//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public contracts
// File       :   Video.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 03-01-2020 Tijmen van Voorthuijsen   - Original version
//----------------------------------------------------------------------------

include "..\\..\\Common\\Types\\CommonTypes.thrift"

namespace * Noldus.NLinx.Contracts.Public.Entities


/** 
 *  A video entity holds information on one audio-video data. It is often the result of a video recording.
 */
struct Video
{
    /** Identifier of the video. This identifier is guaranteed to be unique within the platform. If the identifier is not filled in, it indicates 
     *  a new video which is not yet stored in long-term storage. */
    1: optional CommonTypes.GUID id,

    /** The friendly name of the video. This name can be seen for example in the user interface. */
    2: optional string name,   

    /** A resource identifier when accessing the video from a web application. */
    3: optional string uri, 
	
	/** The following value reflects if all the fields below are containing a valid value. */
    4: optional bool isMetaDataFilled,
	
	/** The local date and time when the video was created. */
    5: optional CommonTypes.IsoDateTime creationDateTime,

    /** The duration in microseconds. */
    6: optional CommonTypes.Duration duration,

    /** The resolution of  the video (width/height) in pixels. */
    7: optional CommonTypes.AspectRatio resolution,
	
    /** The framerate of the video. */
    8: optional double frameRate,

   /** The file size of the video in bytes. */
    9: optional i64 fileSize
}
