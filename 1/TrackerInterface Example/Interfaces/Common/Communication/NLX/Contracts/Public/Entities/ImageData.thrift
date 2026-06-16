//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Entities Contracts
// File       :   ImageData.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 18-08-2020 Tijmen van Voorthuijsen - Original version
//----------------------------------------------------------------------------

include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "ImageSample.thrift"

namespace * Noldus.NLinx.Contracts.Public.Entities

/** Information and the data on a list of images.*/
struct ImageData
{
    /** Identifier of the source that generates the image data. This ID is used to identify the images and also to identify possible derived data. Most commonly,
	*   the sourceId is the processId of the N-Linx process that produces the image data.*/
    1: optional CommonTypes.GUID sourceId,
    
    /** A list of image samples that describes at each UTC sample time the data of the image.*/
    2: list<ImageSample.ImageSample> imageSamples,
}
