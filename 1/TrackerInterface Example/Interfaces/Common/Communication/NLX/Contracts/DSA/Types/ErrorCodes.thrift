//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   DataLab Contracts
// File       :   ErrorCodes.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 02-11-2017 Tijmen van Voorthuijsen   - Original version
//----------------------------------------------------------------------------

namespace * Noldus.NLinx.Contracts.DataLab.Types


/**
 *  All error codes of the DataLab solution.
 */
enum EErrorCode
{
    /** Marks the beginning of the range for all errors which can occur across all functional DataLab modules.*/
    GENERAL_BEGIN = 20000,

    /** The default value.*/
    GENERAL_FAILURE = 0,

    /** An invalid entity id was detected. */
    GENERAL_INVALID_ENTITY_ID = 1,

    /** Marks the end of the range for all errors which can occur across all functional DataLab modules.*/
    GENERAL_END = 29999

    
    /** Marks the beginning of the range for all errors in the main DSA application.*/
    DSA_APPLICATION_BEGIN = 30000,

    /** Marks the end of the range for all errors in the main DSA application.*/
    DSA_APPLICATION_END = 39999,


    /** Marks the beginning of the range for all errors in the DSA Services.*/
    DSA_SERVICES_BEGIN = 40000,

    /** A project with a non-zero Id was supplied for the new project call, suggesting an existing project. Please specify a non-zero Id.*/
    DSA_SERVICES_EXC_NEW_PROJECT_NONZERO_ID = 40001,

    /** Marks the end of the range for all errors in the DSA Services.*/
    DSA_SERVICES_END = 49999,
}
