//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Common Contracts
// File       :   ProcessService.thrift
//----------------------------------------------------------------------------
// Revisions  :
//----------------------------------------------------------------------------
include "..\\Types\\CommonTypes.thrift"
include "CommonService.thrift"
include "..\\Entities\\Event.thrift"
include "..\\Entities\\Process.thrift"
include "..\\Entities\\Subject.thrift" 
include "..\\Entities\\Behavior.thrift"
include "..\\Entities\\Attribute.thrift"

namespace * Noldus.NLinx.Contracts.Common

// Settings for this service

/** Version of the interface.*/
const i32         interfaceVersion          = 1;
/** The name of the RabbitMQ exchange on which the communication of this service runs.*/
const string      exchange                  = "Noldus.NLinx.Common.ExtendedDataService"
/** The first routing key that all running processes should be listening on.*/
const string      mainRoutingKey            = "Listing"
/** This service runs on a topic exchange that supports multiple routing keys. For this service two routing keys are used:
 *  1. The mainRoutingKey as defined above.
 *  2. The GUID of a process when you want to target a specific process, e.g. used in the StartRecording method.
*/
const CommonTypes.ExchangeType exchangeType = CommonTypes.ExchangeType.TOPIC



/** 
* The extended data service is used for transferring configuration and detailed event data.
* It can be used in combination with the simple data service.
* The messages are sent to a specific process, ususally the master (see Process service)
*/
service ExtendedDataService extends CommonService.CommonService
{
    /** Send an event.*/
    oneway void			    AddExtendedEvent                (   /** The identifier of the process that sends out the data.*/
                                                                1: Process.Process sender,

                                                                /** An extended event based on well defined subjects, behaviors and modifiers.*/
                                                                2:Event.ExtendedEvent nlxevent);

    /**add a subject.*/
    oneway void			    AddSubject                      (   /** The identifier of the process that sends out the data.*/
                                                                1: Process.Process sender,
                                                
                                                                /** Add a subject to the configuration.*/
                                                                2:Subject.Subject subject);

    /**add a behavior.*/
    oneway void			    AddBehavior                     (   /** The identifier of the process that sends out the data.*/
                                                                1: Process.Process sender,
                                                                
                                                                /** Add a behavior to the configuration.*/
                                                                2:Behavior.Behavior behavior);

    /**add multiple subjects.*/
    oneway void			    AddSubjects                     (   /** The identifier of the process that sends out the data.*/
                                                                1: Process.Process sender,

                                                                /** Add a list of subjects to the configuration.*/
                                                                2:list<Subject.Subject> subjects);
    
    /**add multiple behaviors.*/
    oneway void			    AddBehaviors                    (   /** The identifier of the process that sends out the data.*/
                                                                1: Process.Process sender,
        
                                                                /** Add a list of behaviors to the configuration.*/
                                                                2:list<Behavior.Behavior> behaviors);
    
    /**add a behavior group.*/
    oneway void			    AddBehaviorGroup                (   /** The identifier of the process that sends out the data.*/    
                                                                1: Process.Process sender,
                                                                2:Behavior.BehaviorGroup group); 
    
    /**add multiple behavior groups.*/
    oneway void			    AddBehaviorGroups               (   /** The identifier of the process that sends out the data.*/
                                                                1: Process.Process sender,
                                                                
                                                                /** Add a list of behavior groups to the configuration.*/
                                                                2:list<Behavior.BehaviorGroup> groups); 
    
    /**add a nominal attribute group.*/
    oneway void			    AddNominalAttributeGroup        (   /** The identifier of the process that sends out the data.*/
                                                                1: Process.Process sender,
                                                                
                                                                /** Add a group for hosting nominal attributes.*/
                                                                2:Attribute.NominalAttributeGroup group); 
    
    /**add a numeric attribute group which will contain predefined values.*/
    oneway void			    AddPredefNumericAttributeGroup  (   /** The identifier of the process that sends out the data.*/
                                                                1: Process.Process sender,
                                                                
                                                                /** Add a group for hosting predefined numerical attributes.*/
                                                                2:Attribute.PredefNumericAttributeGroup group); 

    /**add a numeric attribute group which will contain a renage of values.*/
    oneway void			    AddNumericAttributeGroup        (   /** The identifier of the process that sends out the data.*/
                                                                1: Process.Process sender,
                                    
                                                                /** Add a group for hosting numerical attributes.*/
                                                                2:Attribute.NumericAttributeGroup group); 
    
    /**add nominal attribute values.*/
    oneway void			    AddNominalAttributeValues       (   /** The identifier of the process that sends out the data.*/
                                                                1: Process.Process sender,

                                                                /** Specify the name of the group that was created using function AddNominalAttributeGroup.*/
                                                                2: string groupname,

                                                                /** A list of nominal attribute values that will be added to the specified group.*/
                                                                3: list<Attribute.NominalAttributeValue> values); 
    
    /**add numeric attribute values (to a group created with AddPredefNumericAttributeGroup).*/
    oneway void			    AddNumericAttributeValues       (   /** The identifier of the process that sends out the data.*/
                                                                1: Process.Process sender,

                                                                /** Specify the name of the group that was created using function AddNumericAttributeGroup.*/
                                                                2: string groupname,

                                                                /** A list of numeric attribute values that will be added to the specified group.*/
                                                                3: list<Attribute.NumericAttributeValue> values); 
}
