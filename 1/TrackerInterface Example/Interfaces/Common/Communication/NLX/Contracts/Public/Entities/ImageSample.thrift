//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Entities Contracts
// File       :   ImageSample.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 18-08-2020 Tijmen van Voorthuijsen   - Original version
//----------------------------------------------------------------------------

include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "Image.thrift"

namespace * Noldus.NLinx.Contracts.Public.Entities

/** Defines the UTC time and data for one image sample.*/
struct ImageSample
{
    /** The sample time stamp of the image, in Unix UTC time. */
    1: required CommonTypes.UnixTime timeStamp,

    /** The image itself.*/
    2: optional Image.Image image,
}
