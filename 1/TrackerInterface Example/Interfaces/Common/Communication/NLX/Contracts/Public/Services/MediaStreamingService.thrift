//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   MediaStreamingService.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 18-08-2020 Tijmen van Voorthuijsen   - Original version
//----------------------------------------------------------------------------

include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "..\\..\\Common\\Entities\\Process.thrift"
include "..\\..\\Common\\Entities\\StreamingOptions.thrift"
include "..\\Entities\\ImageData.thrift"

namespace * Noldus.NLinx.Contracts.Public.Services

/** The name of the RabbitMQ exchange on which the messages of this service runs.*/
const string      exchange                  = "Noldus.NLinx.Public.Streaming.Media"

/** This service runs on a topic exchange, which allows fine-grained routing of all types of media data.*/
const CommonTypes.ExchangeType exchangeType = CommonTypes.ExchangeType.TOPIC

/** This service runs on a topic exchange that supports routing keys in the following format:
 *
 *  "{datatype}.{senderId}.{receiverId}"		see definition in CommonTypes.
 *
 *  datatype, supported values : images	(lower case)
 *  senderId				   : the processId of the N-Linx process that is the producer of media data
 *  receiverId				   : mostly use "*", but can be used as the processId of the process that wants to receive the data
 *
 *  Examples: 
 *       "images.2254b828-7bc2-450f-b8d8-3f3da9511305.5d659955-cff5-44f8-bb8a-dc57e4fc08ee"
 *       "images.*.*"
*/
/** The string definition for routing raw image data. */
const string dataTypeImages = "images";

/** 
* The media streaming service defines the methods that are used for streaming data in the multi-media domain, like images.
* The methods define unconditional, oneway, publishing of time-series data.
*/
service MediaStreamingService
{
    /** Produce and consume of image data. Specify 'images' for the data type to receive data in this method.*/
    oneway void			    ImageDataReceived    ( /** The identifier of the process that sends out the data.*/
                                                  1: Process.Process sender,

                                                  /** The image data contains the list of images, plus some meta data describing the package, like the ID that identifies 
                                                  *   the process that originally produces the images.*/
                                                  2: ImageData.ImageData imageData);
}
