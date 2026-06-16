//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Entities Contracts
// File       :   Image.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 05-10-2020 Tijmen van Voorthuijsen - Original version
//----------------------------------------------------------------------------

include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "..\\Types\\MediaTypes.thrift"

namespace * Noldus.NLinx.Contracts.Public.Entities

/** Represents an image, with the content bytes and related information like type of image.*/
struct Image
{
    /** The image data as a sequence of 8-bit unsigned integers, unencoded bytes.*/
    1: required binary imageBytes,

    /** The type of image (png, gif, etc) as a MIME type, for a complete list of MIME types visit https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/MIME_types/Complete_list_of_MIME_types */
    2: optional string mimeType,

    /** The height and width of the image in logical pixels.*/
    3: optional CommonTypes.Size size,

    /** An optional name of the image. For example, the base filename.*/
    4: optional string name

    /** The type of image if it's not a file. Like I420/BMP32/...  */
    5: optional MediaTypes.EColorSpace colorSpace,
}
