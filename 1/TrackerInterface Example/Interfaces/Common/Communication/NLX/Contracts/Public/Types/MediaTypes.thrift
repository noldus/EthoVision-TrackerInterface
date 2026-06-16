//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   MediaTypes.thrift
//----------------------------------------------------------------------------
// Revisions  :
//----------------------------------------------------------------------------

namespace * Noldus.NLinx.Contracts.Public.Types

/** Defines known color spaces in the public N-Linx platform.*/
enum EColorSpace
{
    /** The color space has not been defined.*/
    Unknown			= 0

	/** No pixel format is specified, if possible, the system may find out himself or use defaults.*/
    DontCare		= 1

	/** Specifies that the format is 24 bits per pixel; 8 bits each are used for the red, green, and blue components.*/
    RGB24			= 100,

	/** Specifies that the format is 32 bits per pixel; 8 bits each are used for the red, green, and blue components, plus an additional 8 bits for transparency mask (A component).*/
    RGB32			= 101,

    /** Has the luma "luminance" plane Y first, then the U chroma plane and last the V chroma plane. This format requires 4×8+8+8=48 bits per 4 pixels, so its depth is 12 bits per pixel.*/
    I420            = 201,
}
