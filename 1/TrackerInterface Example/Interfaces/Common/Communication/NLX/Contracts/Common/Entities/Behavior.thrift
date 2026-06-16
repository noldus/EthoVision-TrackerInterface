//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Common Entities
// File       :   Behavior.thrift
//----------------------------------------------------------------------------
// Revisions  :
//----------------------------------------------------------------------------
include "..\\Types\\CommonTypes.thrift"

namespace * Noldus.NLinx.Contracts.Common

/** One behavior, either state or point. Point behaviors can only have a start key code, states also can have a stop key code */
struct Behavior 
{
      /** The behavior name*/
    1: string name,
      /** The name of the group*/
    2: optional string group,
      /** Optional detailed description*/
    3: optional string description,
      /** State or point*/
    4: bool isState=false,
      /** Default behavior or not (only for state behaviors)*/
    5: optional bool isDefault=false,
      /** The color which is used in Visaulizations for this behavior*/
    6: optional CommonTypes.Color color,
      /** The start key code*/
    7: optional string startKeyCode,
      /** The stop key code (only for states)*/
    8: optional string stopKeyCode    
}


/** A group of behaviors */
struct BehaviorGroup
{
      /** The name of the group*/
    1: string name,
      /** Mutually exclusive group or not*/
    2: optional bool mutex=true,   
      /** Exhaustive group or not (may be true only for Mutex groups)*/  
    3: optional bool exhaustive=false, 
      /** Optional longer description*/ 
    4:optional string description
}

