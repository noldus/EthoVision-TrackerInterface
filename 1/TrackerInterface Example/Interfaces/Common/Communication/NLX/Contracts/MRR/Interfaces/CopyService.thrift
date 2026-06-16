//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Viso Contracts
// File       :   CopyService.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 18-02-2015 Jeroen Diederix           - Original version
//----------------------------------------------------------------------------
include "..\\Types\\VisoTypes.thrift"
include "..\\..\\Common\\Interfaces\\CommonService.thrift"

namespace csharp Noldus.NLinx.Contracts.Viso.Services
namespace * Noldus.NLinx.Contracts.Viso

// Settings for this service
const i32         interfaceVersion  = 2;
const string      exchange          = "Noldus.NLinx.Viso.CopyService"
const string      routingKey        = "00000000-0000-0000-0000-000000000000"



/**
 *  Return result of StartCopy
 */
enum EStartCopyResult
{
    /** Copying started */
    Started,

    /** Not started, source file not found */
    SourceNotFound,

    /** Not started, source file not accessable */
    SourceNotAccessable,

    /** Not started, target file not found */
    TargetNotFound,

    /** Not started, target file not found */
    TargetNotAccessable,

    /** Not started, target file already exists */
    TargetExists,

    /** Not started, already busy with copying */
    AlreadyCopying
}


/**
 *  Return result of FolderValidation
 */
enum EFolderValidationResult
{
    /** Folder is valid */
    Valid,

    /** Folder format is invalid */
    InvalidFormat,

    /** Folder does not exists or cannot be found */
    DoesNotExists,

    /** No write access to the folder */
    NoWriteAccess
}


/**
 *  Contains parameters for checking disk info.
 */
struct CopySvsDiskInfoParams
{
    /** Path to check for disk info */
    1: optional string diskPathToCheck
}


/**
 *  The copy service is responsible for copying the session video files to a central location.
 */
service CopyService extends CommonService.CommonService
{

    /**
     *  Start the copy operation
     *  @return EStartCopyResult - The result of the start copy
     */
    EStartCopyResult TryStartCopy(
            /** path to the source file */
            1:  string fromPath,
            /** path to the destination file */
            2:  string toPath,
            /** copy speed limit in B/s, negative or zero means no limit */
            3:  i32 speed
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Cancel the current copy action
     */
    void StopCopy(
            /** Only cancel if this is the file being copied */
            1:  string fromPath
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Get the current copy status
     *  @return ECopyStatus - The current status
     */
    VisoTypes.ECopyStatus GetStatus(
            /** source path from which to get the copy status */
            1:  string fromPath
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Validate a copy folder
     *  @return EFolderValidationResult - the result
     */
    EFolderValidationResult FolderValidation(
            /** Path to the folder */
            1:  string path
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Tries to remove video files from the file system
     *  @return VisoTypes.ERemoveVideoFileResult - the result
     */
    VisoTypes.ERemoveVideoFileResult TryRemoveVideoFiles(
            /** Path to the folder */
            1:  string path
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     *  Get the information about disk of the machine.
     */
    VisoTypes.DiskInfo GetDiskInfo(
            1: CopySvsDiskInfoParams parameters
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

}