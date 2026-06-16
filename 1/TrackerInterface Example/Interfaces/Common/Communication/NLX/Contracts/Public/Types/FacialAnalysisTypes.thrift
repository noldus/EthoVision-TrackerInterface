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
enum EFacialExpression
{
    /** A facial expression with neutral positioning of the facial features, implying a lack of strong emotion.*/
    Neutral         = 0,

    /** A facial expression of a genuine, fully expressed happy face.*/
    Happy           = 1,

    /** A facial expression that causes someone to lower the corners of their mouth, and raise the inner portion of their brows.*/
    Sad             = 2,

    /** A facial expression that causes someone to lower their brows, press their lips together firmly, and bulge their eyes.*/
    Angry           = 3,

    /** A facial expression that causes someone to arch their brows, open their eyes widely, and drop their jaw. */
    Surprised       = 4,

    /** A facial expression that cause someone to raise their brows, open their mouth slightly, and open their eyes in a manner that is wider than normal. */
    Scared          = 5,

    /** A facial expression that causes someone to raise their upper lip, wrinkle their nose bridge, and raise their cheeks.*/
    Disgusted       = 6,

    /** A facial expression that causes someone to scrunch up the nose and forehead, lips are typically pursed together as well, although the expression of confusion tends to be most accentuated around the eyes and nose.*/
    Confusion       = 7,

    /** There is no universally accepted definition of boredom. */
    Boredom         = 8,

    /** A facial expression that causes someone to drop jaws, tongue is stuck upward and outward, and pupils are dilated. */
    Interest        = 9,

    /** Indicates whether the facial expressions display a positive or negative emotion. */
    Valence         = 10,

    /** Indicates whether the test participant’s face is active (+1) or not active (0). */
    Arousal         = 11
}
