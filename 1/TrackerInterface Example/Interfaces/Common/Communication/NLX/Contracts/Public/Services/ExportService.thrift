//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   ExportService.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 06-09-2021 Viktor Kovacs - Original version
//----------------------------------------------------------------------------

include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "..\\..\\Public\\Types\\ExportTypes.thrift"
include "..\\..\\Common\\Interfaces\\CommonService.thrift"

namespace * Noldus.NLinx.Contracts.Public.Services

/** Version of the interface.*/
const i32         interfaceVersion          = 1;
/** The name of the RabbitMQ exchange on which the communication of this service runs.*/
const string      exchange                  = "Noldus.NLinx.Public.ExportService"
/** This service runs on a direct exchange.*/
const CommonTypes.ExchangeType exchangeType = CommonTypes.ExchangeType.DIRECT
/** Use this routing key to direct messages to this service.*/
const string      routingKey                = "7baad8fb-61d5-423b-a693-5dce66d25379"

/** 
* The command interface to operate the export service. 
*/
service ExportService extends CommonService.CommonService
{
    /**initiate the export of a given session for a user */
    bool ExportSession( /** the session guid to be exported */
                        1:CommonTypes.GUID sessionGuid,
                        
                        /** the user requesting the export */
                        2:string userName);

    /**get the export states for a given user  */
    map<CommonTypes.GUID, ExportTypes.EExportState> GetSessionExportStates (                        
                        /** the user requesting the session export states */
                        1:string userName);


    /**for a session ready to download, get the filenames (urls) to download. First one is a zip file, containing all csv-s, additional items in the list are the video files.  */
    list<ExportTypes.FileInfo> GetFilesNamesToDownload (                        
                        /** the session guid  */
                        1:CommonTypes.GUID sessionGuid,
                        
                        /** the user requesting the download */
                        2:string userName);

}
