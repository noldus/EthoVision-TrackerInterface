//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Viso Contracts
// File       :   CodesService.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 18-02-2015 Jeroen Diederix           - Original version
//----------------------------------------------------------------------------
include "..\\Entities\\CodesList.thrift"
include "..\\Entities\\MarkerDefinition.thrift"
include "..\\Entities\\SubjectDefinition.thrift"
include "..\\Entities\\Marker.thrift"
include "..\\Entities\\Subject.thrift"
include "..\\Types\\VisoTypes.thrift"
include "..\\..\\Common\\Interfaces\\CommonService.thrift"

namespace csharp Noldus.NLinx.Contracts.Viso.Services
namespace * Noldus.NLinx.Contracts.Viso

// Settings for this service
const i32         interfaceVersion  = 2;
// Do not rename the exchange name to keep backward compatibility
const string      exchange          = "Noldus.NLinx.Viso.MarkerService"
const string      routingKey        = "1A576C2F-0295-4712-9FEE-8FD7380CC5EC"

/**
 *  The codes service is responsable for the subjects, markers and comments
 */
service CodesService extends CommonService.CommonService
{
    /**
     *  Get a codes list by id
     *  @return CodesList - A codes list
     */
    CodesList.CodesList GetCodesList(
            /** The id of the codes list */
            1:  i32 codesListId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);
        

    /**
     *  Get all codes lists not marked for deletion.
     *  @return list<CodesList> - A list of codes lists
     */
    list<CodesList.CodesList> GetCodesLists() throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Get a list of all marker definitions used by all codes lists
     *  @return List<markerDefinition> - A list of marker-definitions
     */
    list<MarkerDefinition.MarkerDefinition> GetPredefinedMarkers() throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Get a list of all subject definitions used by all codes lists
     *  @return List<subjectDefinition> - A list of subject-definitions
     */
    list<SubjectDefinition.SubjectDefinition> GetPredefinedSubjects() throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

        
    /**
     *  Add a new codes list with markers and subjects.
     *  @return CodesList - The newly added codes list, with filled in id's
     */
    CodesList.CodesList AddCodesList(
            /** The codes list with markers and subjects to be added */
            1:  CodesList.CodesList newCodesList
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Remove a codes list. After removing it is no longer available for making a new session recording.
     */
    void RemoveCodesList(
            /** The codes list to be removed.*/
            1:  i32 codesListId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Extend private codes list with subject
     *  @return CodesList - The updated codes list
     */
    CodesList.CodesList AddSubjectToPrivateCodesList(
            /** The codes list to be updated */
            1:  CodesList.CodesList codesList,
            /** The subject to be added to the codes list */
            2:  Subject.Subject addedSubject
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Extend private codes list with marker
     *  @return CodesList - The updated codes list
     */
    CodesList.CodesList AddMarkerToPrivateCodesList(
            /** The codes list to be updated */
            1:  CodesList.CodesList codesList,
            /** The marker to be added to the codes list */
            2:  Marker.Marker addedMarker
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);



    /******************* OBSOLETE FUNCTIONS REGION STARTS HERE *******************/

    /** OBSOLETE since R5, use the function GetCodesList instead! */
    CodesList.CodesList GetMarkerList(1:  i32 codesListId) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /** OBSOLETE since R5, use the function GetCodesLists instead! */
    list<CodesList.CodesList> GetMarkerLists() throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

    /** OBSOLETE since R5, use the function AddCodesList instead! */
    CodesList.CodesList AddMarkerList(1:  CodesList.CodesList newCodesList) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /** OBSOLETE since R5, use the function RemoveCodesList instead! */
    void RemoveMarkerList(1:  i32 codesListId) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

    /******************* OBSOLETE FUNCTIONS REGION  ENDS  HERE *******************/
}
