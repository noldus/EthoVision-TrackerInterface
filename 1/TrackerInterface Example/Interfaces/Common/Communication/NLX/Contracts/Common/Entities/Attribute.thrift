//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Common Entities Contracts
// File       :   Attribute.thrift
//----------------------------------------------------------------------------
// Revisions  :
//----------------------------------------------------------------------------

include "..\\Types\\CommonTypes.thrift"

namespace * Noldus.NLinx.Contracts.Common


/** A numeric attribute value  */
struct NumericAttributeValue 
{
    /** The numeric value.*/
    1: double value,

    /** A free format description of the numeric attribute value.*/
    2: optional string description

}

/** A group of numeric attribute values.*/
struct PredefNumericAttributeGroup 
{
      /** The name of the group.*/
    1: string name,
      /** Optional detailed description.*/
    2:optional string description,
      /** The numeric precision (values 0-3 allowed).*/
    3:optional i32 precision,
      /** The color to be used for visualization.*/
    4: optional CommonTypes.Color color
}

/** A  numeric attribute group defining a range of values. */
struct NumericAttributeGroup 
{
      /** The name of the group*/
    1: string name,
      /** Optional detailed description*/
    2:optional string description,
      /** The numeric precision (values 0-3 allowed)*/
    3:optional i32 precision,
      /** The minimal value*/
    4:optional double minValue,
      /** The maximum vlaue*/
    5:optional double maxValue,
      /** The color to be used for visualization*/
    6: optional CommonTypes.Color color
}

/** A nominal attribute value */
struct NominalAttributeValue 
{
      /** The name of the value*/
    1: string name,
      /** Optional detailed description*/
    2: optional string description,
      /** The color to be used for visualization*/
    3: optional CommonTypes.Color color,
      /** Key code*/
    4: optional string keyCode
}

/** A group of nolminal attribute values */
struct NominalAttributeGroup 
{
      /** The name of the group*/
    1: string name,    
      /** Optional detailed description*/
    2:optional string description,
      /** Mutually exclusive group of attributes or not*/
    3:optional bool mutEx = true,
      /** Is it required to have at least one value scored*/
    4:optional bool isRequired = false
}