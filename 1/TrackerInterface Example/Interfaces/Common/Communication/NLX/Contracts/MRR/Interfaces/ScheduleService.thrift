//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Viso Contracts
// File       :   ScheduleService.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 07-11-2014 Rogier Giesen   - Original version
//----------------------------------------------------------------------------
include "..\\Entities\\Appointment.thrift"
include "..\\Entities\\Session.thrift"
include "..\\Entities\\ScheduleEntry.thrift"
include "..\\Entities\\User.thrift"
include "..\\Entities\\Room.thrift"
include "..\\Types\\VisoTypes.thrift"
include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "..\\..\\Common\\Interfaces\\CommonService.thrift"

namespace csharp Noldus.NLinx.Contracts.Viso.Services
namespace * Noldus.NLinx.Contracts.Viso

// Settings for this service
const i32         interfaceVersion  = 1;
const string      exchange          = "Noldus.NLinx.Viso.ScheduleService"
const string      routingKey        = "0dac303f-2b8c-4cbd-a452-fac288d97d48"


/**
 *  The result of add appointment
 */
enum EAddAppointmentResult
{
    /** Unknown result */
    Unknown = 0,

    /** Appointment added succesfully */
    Success = 1,

    /** Appointment failed to be added, no reason given */
    Failed = 2,

    /** Appointment failed to be added, similar appointment exist (start time - end time, location) */
    AlreadyExists = 3,
}


/**
 *  Small return class for AddAppointment
 */
struct AddAppointmentResult
{
    /** The result of adding the appointment */
    1:  optional EAddAppointmentResult result,

    /** The appointment object for the started schedule */
    2: optional Appointment.Appointment appointment,
}


/**
 *  The result of edit appointment
 */
enum EEditAppointmentResult
{
    /** Unknown result */
    Unknown = 0,

    /** Appointment edited succesfully */
    Success = 1,

    /** Appointment failed to be edited, no reason given */
    Failed = 2,

    /** Appointment failed to be edited, similar appointment exist (start time - end time, location) */
    AlreadyExists = 3,
}


/**
 *  Small return class for EditAppointment
 */
struct EditAppointmentResult
{
    /** The result of editing the appointment */
    1:  optional EEditAppointmentResult result,

    /** The appointment object for the started schedule */
    2: optional Appointment.Appointment appointment,
}


/**
 *  Small class for AppointmentLockedBy arguments
 */
struct AppointmentLockedByArgs
{
    /** Id of the appointment which is locked or unlocked */
    1:  optional i32 appointmentId,

    /** User which locks the appointment */
    2: optional User.User lockedByUser
}


/** 
 *  The schedule service is responsible for creating and triggering schedules.
 */
service ScheduleService extends CommonService.CommonService
{
   /** 
     *  Get all the planned schedules from all locations.
     *  This function can be called only by the manager classes.
     *  @return List<Appointment> - The list of all schedules
     */
    list<Appointment.Appointment> GetAllPlannedSessionAppointments() throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /** 
     *  Get all schedules from all locations.
     *  This function can be called only by the manager classes.
     *  @return List<Appointment> - The list of all schedules
     */
    list<Appointment.Appointment> GetAllAppointments() throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);
        
    /** 
     *  Get all sessions to be displayed in scheduler
     *  @return List<Session> - The list of all Sessions
     */
    list<Session.Session> GetAllSessionsToDisplay() throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


        /** 
     *  Get all schedules from all locations, with the names hidden if the user does not have rights to the appointment.
     *  @return List<Appointment> - The list of all schedules
     */
    list<Appointment.Appointment> GetAppointments() throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

    /**
     *  Get the appointment for the specified Id.
     *  @return Appointment - The requested appointment
     */
    Appointment.Appointment GetAppointment(
            /** Unique identifier of a session. The Id must be valid. */
            1: i32 appointmentId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

    /**
     *  Add new appointment.
     *  @return EditAppointmentResult - Returns the result and Appointment as saved in the database (for new appontments the id will be changed from 0) 
     */
     AddAppointmentResult AddAppointment(
            /** Appointment to Add */
            1: Appointment.Appointment appointment
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

    /**
     *  Add separate appointments.
     *  @return A list of AddAppointmentResult - Returns the list of results and appointments saved into the database
     */
     list<AddAppointmentResult> AddSeparateAppointments(
            /** Separate appointments to add */
            1: list<Appointment.Appointment> separateAppointments
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

    /**
     *  Edit given appointment.
     *  @return EditAppointmentResult - Returns the result and the updated Appointment as saved in the database. 
     */
     EditAppointmentResult EditAppointment(
            /** Appointment to edit. */
            1: Appointment.Appointment appointment
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

    /**
     *  Delete the appointment with the specified Id.
     */
    void DeleteAppointment(
            /** Unique identifier of a appointment. The Id must be valid. */
            1: i32 appointmentId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

    /**
     *  Sets the AppointmentLockedBy property to the user which opened scheduled appointment.
     */
    void SetAppointmentLockedBy(
            /** AppointmentLockedby arguments. Id of the appointment which is locked and user which locked it. */
            1: AppointmentLockedByArgs appointmentLockedBy
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /** 
     *  Get all schedule entries from all locations.
     *  @return List<Appointment> - The list of all schedules
     */
    list<i32> GetAllScheduleEntries() throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);
        
    /**
     *  Delete the schedule entry with the specified Id.
     */
    void DeleteScheduleEntry(
            /** Unique identifier of a schedule entry. The Id must be valid. */
            1: i32 sheduleEntryId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

            
    /**
     *  Removes the session invites for one user
     *  This function can be called only by the manager classes.
     */
    void RemoveSessionInvitesForUser(
            /** The user id */
            1:  i32 userId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

    /**
     *  Get the schedule entry for the specified Id.
     *  @return ScheduleEntry - The requested schedule entry 
     */
    ScheduleEntry.ScheduleEntry GetScheduleEntry(
            /** Unique identifier of a schedule entry. The Id must be valid. */
            1: i32 sheduleEntryId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Get the appointment from the specified ScheduleEntry Id.
     *  @return Appointment - The requested appointment
     */
    Appointment.Appointment GetAppointmentFromScheduleEntry(
            /** Unique identifier of a schedule entry. The Id must be valid. */
            1: i32 sheduleEntryId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

    /**
     *  Get the session from the specified ScheduleEntry Id.
     *  @return Session - The requested appointment
     */
    Session.Session GetSessionFromScheduleEntry(
            /** Unique identifier of a schedule entry. The Id must be valid. */
            1: i32 sheduleEntryId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

    
    /**
     *  Get the schedule entry from session Id.
     *  @return ScheduleEntry - The requested schedule entry 
     */
    ScheduleEntry.ScheduleEntry GetScheduleEntryFromSession(
            /** Unique identifier of a session. The Id must be valid. */
            1: i32 sessionId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

        
    /**
     *  Get the room list from the specified ScheduleEntry Id.
     *  @return List<Room.Room>  - The requested roomlist
     */
      list<Room.Room>  GetLocationsOfScheduleEntry(
            /** Unique identifier of a schedule entry. The Id must be valid. */
            1: i32 sheduleEntryId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Check if the given rooms have some overlapping appointments planned in the next 5 minutes.
     *  @return Appointment.Appointment - The first overlapping appointment if any or the default entity
     */
    Appointment.Appointment CheckIsRoomScheduledForRecording(
            /** List of the room Ids to check for schedulings. */
            1: list<i32> listRoomIds
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /******************* OBSOLETE FUNCTIONS REGION STARTS HERE *******************/
    
    /******************* OBSOLETE FUNCTIONS REGION  ENDS  HERE *******************/
}
