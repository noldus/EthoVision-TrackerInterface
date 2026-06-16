//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   Status.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 21-09-2022 Ismail Guclu - Original version
//----------------------------------------------------------------------------

include "..\\..\\Common\\Types\\CommonTypes.thrift"

namespace * Noldus.NLinx.Contracts.Public.Entities

/** A status holds all the information regarding a source condition upon request. */
struct Status
{
    /** Identifies the sourceId. Source ID can be for example: the ID of a device or ID of a data stream. */
    1: required CommonTypes.GUID sourceId,
	
	/** Field to specify the type of requested source status. The source type specifies the kind of a sourceID, for example: a Shimmer device or a processing algorithm. */
	2: optional string sourceType,

	/** A short title of returned message. */
	3: optional string title,

	/** A description of returned message. */
	4: optional string message,
	
	/** The level of metric indicator. */
	5: optional EMetricIndicator metricIndicator,

	/** A severity message. */
	6: optional EStatusSeverityType severity,
	
	/** The timestamp of message generation from the source. */
	7: optional CommonTypes.UnixTime timestamp,

	/** A nested tree of [key, value] pairs for additional source specific information. */
	8: optional CommonTypes.PropertyTree additionalInformation,
}

/** The status severity is used to report the status of a source. */
enum EStatusSeverityType
{
	/** No warning */
	Neutral = 0,

    /** Minor severity */
	Minor = 1,
	
	/** Major severity */
	Major = 2,
	
	/** Critical severity */
	Critical = 3,
}

/** */
enum EMetricIndicator
{
	/** Good metric */
	Good = 0,

    /** Warning metric */
	Warning = 1,
	
	/** Error metric */
	Error = 2,
}