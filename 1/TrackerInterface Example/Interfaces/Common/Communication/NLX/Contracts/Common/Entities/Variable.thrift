//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Common Contracts
// File       :   Variable.thrift
//----------------------------------------------------------------------------
// Revisions  :
//----------------------------------------------------------------------------
include "..\\Types\\CommonTypes.thrift"

namespace * Noldus.NLinx.Contracts.Common

/** The (nominal) variable value, with the variable name specified */
struct VarValue
{
        /** The variable name. Note that currently there is no interface function to add a variable, the name/value pair sent will trigger the creation of the nominal variable.*/
    1: string variableName,

        /** The variable value*/
    2: string variableValue

}

