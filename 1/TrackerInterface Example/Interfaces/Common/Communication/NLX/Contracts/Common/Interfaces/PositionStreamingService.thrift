//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Common Contracts
// File       :   PositionStreamingService.thrift  (renamed from LocationStreamingService.thrift 9-6-2021)
//----------------------------------------------------------------------------
// Revisions  :
// 22-10-2019 Andrius Zukas, Phd   - Original version
//			  Ramon Bollen, ???	  - Original version
//----------------------------------------------------------------------------

include "..\\Types\\CommonTypes.thrift"
include "..\\Entities\\PositionData.thrift"

namespace * Noldus.NLinx.Contracts.Public

/** The name of the RabbitMQ exchange on which the messages of this service runs.*/
const string      exchange                  = "Noldus.NLinx.Public.Streaming.PositionTracking"
/** This service runs on a topic exchange which allows fine-grained routing of all types of eye tracking data.*/
const CommonTypes.ExchangeType exchangeType = CommonTypes.ExchangeType.TOPIC

/** This service runs on a topic exchange that supports routing keys in the following format:
 *
 *  "{datatype}.{senderId}.{receiverId}"		see definition in CommonTypes.
 *
 *  datatype, supported values : positiondata	(lower case)
 *  senderId				   : the processId of the N-Linx process that is the producer of eye tracking data
 *  receiverId				   : mostly use "*", but can be used as the processId of the process that wants to receive the data
 *
 *  Example: "positiondata.2254b828-7bc2-450f-b8d8-3f3da9511305.5d659955-cff5-44f8-bb8a-dc57e4fc08ee"
*/

/** The string definition for routing raw position data. */
const string dataTypePosition = "positiondata";

service PositionStreamingService
{
	/** Produce and consume of Position data. Specify position for the data type to receive this data stream.*/
	oneway void			    PositionDataReceived(   /** A list of position data.*/
													1: list<PositionData.PositionData> positionData);
}