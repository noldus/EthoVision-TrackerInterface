include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "..\\..\\Common\\Interfaces\\CommonService.thrift"
include "..\\..\\Common\\Entities\\AcquisitionSettings.thrift"
include "..\\..\\Common\\Entities\\TimeSeriesPoint.thrift"
include "..\\Entities\\WebRtcSource.thrift"
include "..\\Entities\\AcquisitionRun.thrift"

namespace * Noldus.NLinx.Contracts.Public.Services

/** Version of the interface.*/
const i32         interfaceVersion          = 1;
/** The name of the RabbitMQ exchange on which the communication of this service runs.*/
const string      exchange                  = "Noldus.NLinx.Public.AcquisitionService"
/** The session service runs on a direct exchange.*/
const CommonTypes.ExchangeType exchangeType = CommonTypes.ExchangeType.DIRECT
/** This service has a fixed routing key, to direct the messages to.*/
const string      routingKey                = "433fa772-294a-4ea0-8323-50f7bc1af676"

/** 
* The command interface to operate the acquisition service. The acquisition service is responsible for the orchestration of a live recording.
*/
service AcquisitionService extends CommonService.CommonService
{
    /**
    *  Initializes an acquisition run for a live data recording. What to record is defined in the selected devics in the resource service. 
    *  You can call InitAcquisition twice, which will result in the same returned acquisition run.
    *  @return AcquisitionRun - Holds information about the initialized acquisition run.
    */
    AcquisitionRun.AcquisitionRun InitAcquisition(
            /** Must be a valid and existing project. */
            1:  CommonTypes.GUID projectId,
    
            /** Must be a valid and existing location. */
            2:  CommonTypes.GUID locationId,	    
        ) throws(1: CommonTypes.SystemException appEx, 2 : CommonTypes.ApplicationException sysEx);

    /**
     * Starts the acquisition for the specified acquisition run.
    */
    AcquisitionRun.AcquisitionRun StartAcquisition(
            /** The id of the acquisition run as obtained via the call to InitAcquisition. */
            1:  CommonTypes.GUID acquisitionRunId,
        ) throws(1: CommonTypes.SystemException appEx, 2 : CommonTypes.ApplicationException sysEx);

    /**
    *  Stops the acquisition for the specified acquisition run.
    */
    AcquisitionRun.AcquisitionRun StopAcquisition(
            /** The id of the acquisition run as obtained via the call to InitAcquisition. */
            1:  CommonTypes.GUID acquisitionRunId,    
        ) throws(1: CommonTypes.SystemException appEx, 2 : CommonTypes.ApplicationException sysEx);

    /**
    *  Gets the active acquisition run that belongs to a project and location. An active acquisition run is in fact a last
    *  created acquisition run for the project and location combination. This last acquisition runmay have status stopped, meaning about
    *  recording was started and stopped for this last acquisition run. Or, when no acquisition was ever initialized for the project
    *  and location combination, a default acquisition run is returned, which has no id and status ERecordingStatus.Undefined.
    *  @return AcquisitionRun - Holds information about the last acquisition run or a default acquisition run when an acquisition run was never initiated.
    */
    AcquisitionRun.AcquisitionRun GetActiveAcquisitionRun(
            /** Must be a valid and existing project. */
            1:  CommonTypes.GUID projectId,
            /** Must be a valid and existing location. */
            2:  CommonTypes.GUID locationId,	    
        ) throws(1: CommonTypes.SystemException appEx, 2 : CommonTypes.ApplicationException sysEx);

    /**
    *  Gets the latest acquisition run(s) based on the specified project and location ID, or for all the projects if projectId is null,
    *  or for all the locations id locationId is null. When no acquisition was ever initialized for the project
    *  and location combination, an empty list is returned
    *  @return AcquisitionRun - Holds information about the last acquisition run(s) or a empty list when an acquisition run was never initiated.
    */
    list<AcquisitionRun.AcquisitionRun> GetActiveAcquisitionRuns(
            /** The project id of an acquisition run(s) to be found, or null to retrieve runs for all projects. */
            1:  CommonTypes.GUID projectId,
            /** The location id of acquisition run(s) to be found, or null to retrieve runs for all locations. */
            2:  CommonTypes.GUID locationId,	 
        ) throws(1: CommonTypes.SystemException appEx, 2 : CommonTypes.ApplicationException sysEx);

    /**
    *  Determines whether or not the specified location is currently being used for recording in specified project.
    *  If no project is specified (e.g. i.c.o. a lock at application level) projectId must be Guid.Empty. We'll determine if the location is 
    *  currently used for recording in any project.
    *  @return bool - true if location is currently in use for recording in any project or in specified project.
    */
    bool IsRecording(
            /** Can be a valid and existing project OR Guid.Empty. */
            1:  CommonTypes.GUID projectId,
            /** Must be a valid and existing location. */
            2:  CommonTypes.GUID locationId,	    
        ) throws(1: CommonTypes.SystemException appEx, 2 : CommonTypes.ApplicationException sysEx);

    /**
    *  Add an event stream to the acquisition
    */
    void AddEventStream(
            /** The id of the acquisition run as obtained via the call to InitAcquisition. */
            1:  CommonTypes.GUID acquisitionRunId,
            /** The eventstream id to add */
            2:  CommonTypes.GUID eventStreamId,
        ) throws(1: CommonTypes.SystemException appEx, 2 : CommonTypes.ApplicationException sysEx);

    /**
    *  Get eventstreams of the acquisition
    *  @return list of eventstream ids of the the acquisition
    */
    list<CommonTypes.GUID> GetEventStreams(
            /** The id of the acquisition run as obtained via the call to InitAcquisition. */
            1:  CommonTypes.GUID acquisitionRunId,
        ) throws(1: CommonTypes.SystemException appEx, 2 : CommonTypes.ApplicationException sysEx);

    /**  
    *  Deletes acquisition run. The acquisition run must exist otherwise an exception is thrown.
    */
    void DeleteAcquisitionRun(
            /** Unique identifier of a session. The Id must be valid. */
            1: CommonTypes.GUID id,
        ) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);

    /**  
    *  Gets acquisition run which belongs to specified session.
    */
    AcquisitionRun.AcquisitionRun GetAcquisitionRunForSession(
            /** Unique identifier of a session for acquisition run should be found. The Id must be valid. */
            1: CommonTypes.GUID id,
        ) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);


    /**
    *  Store external data to timeseries storage.
    */
    void StoreExternalData(
            /** Name of the measurement. */
            1:  string measurementName,
            /** The data points */
            2:  list<TimeSeriesPoint.TimeSeriesPoint> data,
        ) throws(1: CommonTypes.SystemException appEx, 2 : CommonTypes.ApplicationException sysEx);
}
