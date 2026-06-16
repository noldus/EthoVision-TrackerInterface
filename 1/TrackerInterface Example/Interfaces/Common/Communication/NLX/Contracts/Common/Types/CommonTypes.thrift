//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Common Contracts
// File       :   CommonTypes.thrift
//----------------------------------------------------------------------------
// Revisions  :   1.0
//----------------------------------------------------------------------------
include "ErrorCodes.thrift"
include "..\\Entities\\Header.thrift"

namespace * Noldus.NLinx.Contracts.Common

/** A GUID is transfered as a 16 byte number with a byte order presented
/* in big endian format according to the RFC for GUIDs(RFC4122). */
typedef binary GUID

/** Type of RabbitMQ exchange. Important: the absolute values of this enum must agree with the values defined in NCNlxTypes.*/
enum ExchangeType 
{
  /** A direct exchange delivers messages to queues based on the message routing key. */
  DIRECT = 0,

  /** A fanout exchange routes messages to all of the queues that are bound to it and the routing key is ignored. */
  FANOUT = 1,

  /** A headers exchange is designed to for routing on multiple attributes that are more easily expressed as message headers than a routing key. */
  HEADERS = 2,

  /** Topic exchange routes messages to one or many queues based on matching between a message routing key and the pattern that was used to bind a queue to an exchange. */
  TOPIC = 3
}

/** Specifies the validity. */
enum EValidity
{
    /** Invalid state */
    Invalid,

    /** Valid state */
    Valid,

    /** Indeterminate state */
    Indeterminate,
}

/** The definition type can apply to types where part uses a system definition but also leaves room for user-defined and free format. Often, system defined types
    allow to give meaning to the quantity, while user-defined free format types can only be treated in general terms.*/
enum EDefinitionType
{
    /** The type is fixed and defined by the system. */
    Predefined,

    /** The type is user defined and identified by a string only. */
    FreeFormat,
}

/**
 *  The event state is used for data that can be described as having state for a certain duration. This duration is send as separate start
 *  and stop events. For events that have no duration the point event state is used or the special marker state.
 */
enum EEventState
{
    /** Point event */
    Point,

    /** State started */
    StateStart,

    /** State stopped */
    StateStop,

    /** Marker */
    Marker
}

/** Allows to define constraints on the selection of properties.*/
enum EPropertyConstraint
{
    /** The default, a constraint does not apply or has not been set.*/
    NOTAPPLICABLE = 0,

    /** Any number of properties can be selected or filled in, including zero number.*/
    ANYOF = 1,

    /** Only one of the properties can be selected or filled in.*/
    ONEOF = 2
}

/** The progress state is used in N-Linx communication for long running jobs. It reports the current job status to the caller.*/ 
enum EProgressState
{
    /** The processing in the long running job is starting or has just started.*/
    Begin = 0,

    /** The long running job is still in progress. The fraction of the job done can be read from fractionDone field of the progress info struct. */
    InProgress = 1,

    /** The long running job is finished and the End status marks the last message, no more messages will arrive after this last message.*/
    End = 2,

    /** The long running job is aborted, either because the client requested a cancellation or of some exception during the long running job.
    *   An Aborted message marks a last message, so no more messages will arrive after this last message.*/
    Aborted = 3
}

/** The delivery options specify how data or messages should be returned to the caller. The delivery options are used only where multiple reply messages
*   can be supported, for example in restreaming time-series data. */
enum EDeliveryOption
{
    /** The data is returned as one chunk.*/
    OneChunk = 0,

    /** The data is divided in time bins and the bins are returned one by one, either ordered or unordered. */
    TimeBin = 1,

    /** The amount of returned data should be limited and only specified amount of data should be returned per request. */
    Limited = 2
}

/** Applies to returning data in chunks. This can be done ordered, for example based on time, or unordered.*/
enum EOrder
{
    /** The order is maintained.*/
    Ordered,

    /** The order of the chunks is not guaranteed */
    Unordered
}

/** The log level tells a process up to which severity the data will be logged. The log level increases from Off, Fatal, ... and last
 *  to Debug. The higher the log level the more details are logged. Th default log level in N-Linx is ERROR, so only errors or higher are logged by default.
 * 
 *  Log level -->   TRACE     DEBUG     INFO      WARNING   ERROR   FATAL   OFF
 *  Severity
 *      ^           •TRACE
 *      |           •DEBUG    •DEBUG
 *      |           •INFO     •INFO     •INFO
 *      |           •WARNING  •WARNING  •WARNING  •WARNING
 *      |           •ERROR    •ERROR    •ERROR    •ERROR    •ERROR
 *                  •FATAL    •FATAL    •FATAL    •FATAL    •FATAL  •FATAL
 */
enum ELogLevel
{
    /** Logging is off, no data will be logged.*/
    Off           = -2,
    
    /** Only fatal messages will be logged.*/
    Fatal         = -1,

    /** Only fatal and error messages are logged.*/
    Error         = 0,

    /** Fatal, error and warning messages are logged.*/
    Warning       = 1,

    /** Fatal, error, warning and info messages are logged.*/
    Info          = 2,
    
    /** Fatal, error, warning, info and debug messages are logged.*/
    Debug         = 3,

    /** Fatal, error, warning, info, debug and trace messages are logged.*/
    Trace         = 4,
}


/** Date and time as an ISO 8601 string in the local date and time format YYYY-MM-DDThh:mm:ss.ffffff±hh:mm. For example 2014-05-23T10:55:00.000000+02:00. */
typedef string IsoDateTime

/** Date and time as a Unix time double value where the integer part defines the number of seconds elapsed since 1970-01-01 00:00:00 (UTC). The fractional part has a microsecond precision.*/
typedef double UnixTime

/** Duration in microseconds. */
typedef i64 Duration


/** The routing key mask should be used to construct the correct routing key to stream data from and to streaming services. Streaming
 *  services run on a topic exchange, which supports routing keys in the following format:
 *
 *  "{datatype}.{senderid}.{receiverid}"		(all lower case)
 *
 *  datatype	: supported values should be defined in the contracts of each streaming service.
 *  senderid	: use the processId of the process that sends the data.
 *  receiverid  : use the processId of the process that receives the data.
 *
 *  Example: "gaze.2254b828-7bc2-450f-b8d8-3f3da9511305.9389bd8e-b3b8-409b-9a93-10a3ba0030e9"
*/
const string routingKeyMask = "{datatype}.{senderid}.{receiverid}";

/** Represents an ARGB (alpha, red, green, blue) color. */
struct Color
{
    /** The alpha component. Default c.q. not specified a color is 100% opaque. */
    1: optional i16 A = 255,

    /** The red component. */
    2: required i16 R,

    /** The green component. */
    3: required i16 G,

    /** The blue component. */
    4: required i16 B
}

/** Represents a position in 2-dimensional space. */
struct Point2D
{
    /** The X coordinate */
    1: optional double X,

    /** The Y coordinate */
    2: optional double Y
}

/** Represents a position in 3-dimensional space. */
struct Point3D
{
    /** The X coordinate */
    1: optional double X,

    /** The Y coordinate */
    2: optional double Y,

    /** The Z coordinate */
    3: optional double Z
}

/**
 *  The ratio of the sizes of a rectangle, most commonly of a screen, display or image. It is the proportional relationship between 
 *  its height and width.
 */
struct AspectRatio
{
    /** The height of the screen, display or image. */
    1: required i32 Height,

    /** The width of the screen, display or image. */
    2: required i32 Width
}

/** An ordered pair of integers, which specify a height and width in integral but otherwise arbitrary units.*/
struct Size
{
    /** The height in arbitrary units, for example screen pixels. */
    1: required i32 height,

    /** The width in arbitrary units, for example screen pixels. */
    2: required i32 width
}

/** Represents a position on a graphical user interface (monitor screen, mobile device screen) in logical pixels.*/
struct Position
{
    /** The x-coordinate on the screen in logical pixels.*/
    1: required i32 X,

    /** The y-coordinate on the screen in logical pixels.*/
    2: required i32 Y,
}

/** Defines an interval in time with a specification to include or exclude the left and right boundary. The default time interval includes
/*  the left but excludes the right boundary, so mathematically [from, to> */
struct SampleTimeInterval
{
    /** Only return samples from this time. Including the time specified. */
    1: required UnixTime fromTime,

    /** Includes the 'fromTime' into the query. i.e. False = larger than toTime, True = larger than or equal to toTime. true by default */
    2: optional bool fromTimeIncluded = true,

    /** Only return samples before this time. Excluding the time specified by default. Set toTimeIncluded to true to include.  */
    3: required UnixTime toTime,

    /** Includes the 'toTime' into the query. i.e. False = smaller than toTime, True = smaller than or equal to toTime. false by default */
    4: optional bool toTimeIncluded = false,
}

/** The progress info struct can be used for long running jobs that support sending result data back to the caller in chunks, or for long running analysis jobs.*/
struct ProgressInfo
{
    /** The state of the long-running job.*/
    1: required EProgressState progressState,

    /** An indication of the work done, running from 0.0 (starting) to 1.0 (all work done).*/
    2: optional double fractionDone,

    /** The maximum size of chunks. If request was made without chunking option, this should remain -1. -1 by default.*/
    3: optional i32 maxNrSamplesPerChunk = -1,
}


/** Type definition of a data type in the platform. The actual data types themselves are defined in DataTypes.thrift.*/
struct DataType
{
    /** The identifier should be a fixed guid and never change anymore over time. All modules in the platform should be able to relay on this fixed identifier.*/
    1: required GUID identifier,

    /** The common name should preferably be a short string representation of the data type, using a commonly accepted notation. Examples are Gaze and ECG.*/
    2: required string commonName,
}

/** Provides a relationship between an output data type, given an input data type.*/
struct IoPair
{
    /** First member of the pair.*/
    1: required DataType dataTypeIn,

    /** Second member of the pair.*/
    2: required DataType dataTypeOut,
}


/** A variant-like value placeholder which ensures type safety.*/
union PropertyValue
{
    1: bool   boolValue,
    2: string stringValue,
    3: i32    intValue,
    4: double doubleValue,
    5: i64    longValue,
    6: GUID   guidValue
}

/** One value in the property tree as a [key, value] pair. Examples: [key=Temperature, value=23.6] or [key=data set 1, value=true]*/
struct Property
{
    /** The key value as string.*/
    1: optional string         key,

    /** A typesafe value.*/
    2: optional PropertyValue  value,

    /** A description of the property. */
    3: optional string         description
}

/** A generic data structure for storing nested trees of [key, value] pairs.*/
struct PropertyTree
{
    /** A group name for the properties on this level.*/
    1: optional string              name,

    /** An optional constraint which can be defined when the list of properties represent e.g. a list from which a selection can be made.*/
    2: optional EPropertyConstraint constraint = EPropertyConstraint.NOTAPPLICABLE,

    /** List of properties on this level.*/
    3: optional list<Property>      properties,

    /** Child groups of properties.*/
    4: optional list<PropertyTree>  children,
}


 /**
 *  This exception is thrown when a method cannot fullfill its contract as a result of wrong input. This exception
 *  could be avoided by a change in caller action, for example passing a valid input parameter.
 */
exception ApplicationException
{
    /*  The error code that specifies the exception in more detail.*/
    1: required ErrorCodes.EErrorCode   errorCode,

    /*  A technical description of the error. */
    2: optional string                  description
}

/**
 *  This exception is thrown when a method cannot fullfill its contract as a result of a problem that is not caused by the input. This exception
 *  cannot be avoided by a change in caller action.
 */
exception SystemException
{
    /*  The error code that specifies the exception in more detail.*/
    1: required ErrorCodes.EErrorCode   errorCode,

    /*  A technical description of the error. */
    2: optional string                  description
}
