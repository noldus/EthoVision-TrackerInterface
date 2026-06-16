//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   DataLab Contracts
// File       :   DataLabTypes.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 02-11-2017 Tijmen van Voorthuijsen   - Original version
//----------------------------------------------------------------------------

include "ErrorCodes.thrift"

namespace * Noldus.NLinx.Contracts.DataLab.Types


/**
 *  Generic exception that is thrown when something in the business application went
 *  wrong, usually due to wrong input.
 */
exception ApplicationException
{
    /*  The error code that specifies the exception in more detail.*/
    1: required ErrorCodes.EErrorCode errorCode,
    /*  A detailed technical description of the error */
    2: optional string technicalDescription
}

/**
 *  An exception thrown only when something critical in system went wrong, like a
 *  database that cannot be opened. This is usually NOT due to wrong input and probably
 *  results in a restart of a service.
 */
exception SystemException
{
    /*  The error code that specifies the exception in more detail.*/
    1: required ErrorCodes.EErrorCode errorCode,
    /*  A detailed technical description of the error */
    2 : optional string technicalDescription
}
