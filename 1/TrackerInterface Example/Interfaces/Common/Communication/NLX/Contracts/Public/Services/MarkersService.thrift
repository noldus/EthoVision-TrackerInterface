//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   MarkersService.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 24-10-2022 Tijmen van Voorthuijsen - Original version
//----------------------------------------------------------------------------

include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "..\\..\\Common\\Interfaces\\CommonService.thrift"
include "..\\Entities\\MarkerDefinitionList.thrift"
include "..\\Entities\\MarkerDefinition.thrift"
include "..\\Entities\\Marker.thrift"

namespace * Noldus.NLinx.Contracts.Public.Services

/** Version of the interface.*/
const i32         interfaceVersion          = 1;
/** The name of the RabbitMQ exchange on which the communication of this service runs.*/
const string      exchange                  = "Noldus.NLinx.Public.MarkersService"
/** The session service runs on a direct exchange.*/
const CommonTypes.ExchangeType exchangeType = CommonTypes.ExchangeType.DIRECT
/** This service has a fixed routing key, to direct the messages to.*/
const string      routingKey                = "75f3f71f-7ba2-4983-976e-1ea117844330"

/** 
* The command interface to operate the markers service. The markers service is responsible for
* the definition of elements that are used to score events, for example the definition of markers.
*/
service MarkersService extends CommonService.CommonService
{
    /**
    *  Creates a new marker definition list, which is stored in persistent storage.
    *  @return MarkerDefinitionList - A newly created marker definition list with a valid marker definition list Id. The new marker definition list contains zero marker definitions.
    */
    MarkerDefinitionList.MarkerDefinitionList               CreateMarkerDefinitionList        (   /** The name for the marker list. There is no requirement for uniqueness of the name within the collection of all marker lists.*/
                                                                                                  1:  string displayName,
                                                                                              ) throws(1: CommonTypes.SystemException appEx, 2 : CommonTypes.ApplicationException sysEx);

    /**
     * Get a marker definition list by Id.
     * @return MarkerDefinitionList - A retrieved marker definition list for a valid marker definition list Id.
    */
    MarkerDefinitionList.MarkerDefinitionList               GetMarkerDefinitionList           (   /** A valid Id of a marker definition list, for example the Id of the MarkerDefinitionList that was returned by CreateMarkerDefinitionList. */
                                                                                                  1:  CommonTypes.GUID markerDefinitionListId,
                                                                                                  /** Indicate whether soft-deleted items should be included in the retrieval of marker definition list.*/
                                                                                                  2:  bool includeDeleted,
                                                                                              ) throws(1: CommonTypes.SystemException appEx, 2 : CommonTypes.ApplicationException sysEx);

    /**
     * Update a marker definition list.
     * @return MarkerDefinitionList - An updated marker definition list for a valid marker definition list Id.
    */
    MarkerDefinitionList.MarkerDefinitionList               UpdateMarkerDefinitionList        (   /** A marker definition list with a valid marker definition list Id.*/
                                                                                                  1:  MarkerDefinitionList.MarkerDefinitionList markerDefinitionList,
                                                                                              ) throws(1: CommonTypes.SystemException appEx, 2 : CommonTypes.ApplicationException sysEx);


    /**
     * Delete a marker definition list by Id.
    */
    void                                                    DeleteMarkerDefinitionList        (   /** The valid Id of a marker definition list, for example the Id of the MarkerDefinitionList that was returned by CreateMarkerDefinitionList. */
                                                                                                  1:  CommonTypes.GUID markerDefinitionListId
                                                                                              ) throws(1: CommonTypes.SystemException appEx, 2 : CommonTypes.ApplicationException sysEx);

    /**
      * Add marker. 
    */
    CommonTypes.GUID                                        AddMarker                         ( /** The EventStream guid. */
                                                                                                  1:CommonTypes.GUID eventStreamId, 
                                                                                                /** The marker. */  
                                                                                                  2:Marker.Marker marker,
                                                                                              ) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);

    /**
     * Get the marker list, which are in the given event stream. These markers are constructed from AbstractEvent and MarkerDefinition.
     * @return Marker - A retrieved marker list.
    */
    list<Marker.Marker>                                     GetMarkers                        (   /** The EvenStream guid. */
                                                                                                  1:  CommonTypes.GUID eventStreamId
                                                                                              ) throws(1: CommonTypes.SystemException appEx, 2 : CommonTypes.ApplicationException sysEx);

    /**
      * Delete marker.
    */
    void                                                    DeleteMarker                      (   /** Id of the marker event which should be deleted. */
                                                                                                  1:CommonTypes.GUID markerId,
                                                                                                  /** Id of the event stream from which marker should be deleted. */  
                                                                                                  2: CommonTypes.GUID eventStreamId,
                                                                                              ) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);

}