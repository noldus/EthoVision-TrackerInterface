//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   StimulusTypes.thrift
//----------------------------------------------------------------------------
// Revisions  :
//----------------------------------------------------------------------------

include "CommonTypes.thrift"
include "..\\..\\Public\\Entities\\Image.thrift"

namespace * Noldus.NLinx.Contracts.Public

/** Defines different types of stimuli.*/
enum EStimulusType
{
    /** A stimulus of undefined type. Use this type only when no other of the types below cover your stimulus. The type other does not
        provide any information at all to the recipient of your data, so use this type sparingly.*/
    OTHER                               = 0,

    /** The URL in the web browser has changed.*/
    WEB_PAGE_URL_CHANGED                = 1,

    /** The size of the web page has changed, for example by resizing the web browser application.*/
    WEB_PAGE_SIZE_CHANGED               = 2,

    /** The scroll position in the web has changed.*/
    WEB_PAGE_SCROLL_POSITION_CHANGED    = 3,
}

/** Data associated with a stimulus event of type WEB_PAGE_URL_CHANGED, WEB_PAGE_SIZE_CHANGED and WEB_PAGE_SCROLL_POSITION_CHANGED.
*
*      3: viewPortLeftPosInImage, example (125, 150). Measured from the upper left corner in the image.
*      4: viewPortLeftPosOnScreen, example (10, 20), measured from the upper left corner of the screen.
*      4: viewPortSize
*
*
*      ---> x
*     ---------------------------------------------------------------------------------------------
*   |  | (0, 0)  Image (of web page)                                                               |
*   |  |                                                                                           |
*   ^  |                                                                                           |
*   y  |      ---> x'                                                                              |
*      |      ╔════════════════════════════════════════════════════════════════════════════════╗   |
*      |    | ║(0, 0) Monitor screen                                                           ║   |
*      |    | ║                                                                                ║   |
*      |    ^ ║      3: (x = 125, y = 150)                                                     ║   |
*      |    y'║      4: (x'= 10, y' = 20)                                                      ║   |
*      |      ║      ╔═════════════════════════════════════════════════╗                       ║   |
*      |      ║      ║ Viewport                                        ║                       ║   |
*      |      ║      ║                                                 ║                       ║   |
*      |      ║      ║                                                 ║                       ║   |
*      |      ║      ║                                                 ║                       ║   |
*      |      ║      ║                                                 ║ 4: viewPortSize.height║   |
*      |      ║      ║                                                 ║                       ║   |
*      |      ║      ║                                                 ║                       ║   |
*      |      ║      ║                                                 ║                       ║   |
*      |      ║      ║                                                 ║                       ║   |
*      |      ║      ╚═════════════════════════════════════════════════╝                       ║   |
*      |      ║                      4: viewPortSize.width                                     ║   |
*      |      ║                                                                                ║   |
*      |      ║                                                                                ║   |
*      |      ║                                                                                ║   |
*      |      ║                                                                                ║   |
*      |      ╚════════════════════════════════════════════════════════════════════════════════╝   |                                                                                            |
*      |                                                                                           |
*      |                                                                                           |
*      |                                                                                           |
*      |                                                                                           |
*      |                                                                                           |
*      |                                                                                           |
*      |                                                                                           |
*      |                                                                                           |
*      |                                                                                           |
*      |                                                                                           |
*      ---------------------------------------------------------------------------------------------
*/
struct WebPageChangedData
{
    /** The URL string of the web page.*/
    1: optional string url,

    /** The snapshot image of a complete web page, from top to bottom, which can be larger that the viewport. For a URL change or  
    *   when the page is resized, the content of the page changes, and therefore a new snapshot is taken. Also contains additonal 
    *   information on the snapshot like image type and dimensions. 
    *   For WEB_PAGE_SCROLL_POSITION_CHANGED this member is left empty.*/
    2: optional Image.Image webPageSnapshot,

    /** The position of the upper left corner of the viewport in the coordinate frame of the image (web page snapshot). The viewport is the
    *   visible portion of the entire web page.*/
    3: optional CommonTypes.Position viewPortLeftPosInImage,

    /** The position of the upper left corner of the viewport in the coordinate frame of the screen. The viewport is the
    *   visible portion of the entire web page.*/
    4: optional CommonTypes.Position viewPortLeftPosOnScreen,

    /** The size of the viewport in logical pixels. This is the height and width of the visible portion of the entire web page.*/
    5: optional CommonTypes.Size viewPortSize,
}

