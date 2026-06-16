//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   FacialAnalysisTypes.thrift
//----------------------------------------------------------------------------
// Revisions  :
//----------------------------------------------------------------------------

namespace * Noldus.NLinx.Contracts.Public.Types

/** Defines the predefined types of facial expressions.*/
enum EExportState
{
        /** Undefined*/
        Undefined = 0,

        /** Not started*/
        NotStarted = 1,

        /** Creating*/
        Creating = 2,

        /** Preparing for download*/
        PreparingForDownload = 3,

        /** Ready to download*/
        ReadyToDownload = 4    
}

/** the file info for frontend.*/
struct FileInfo
{
    /** The full relative file access url */
    1: required string fullFileUrl,

    /** The short filename for download */
    2: required string fileName,

    /** The file size in Mb */
    3: i64 fileSize,
}