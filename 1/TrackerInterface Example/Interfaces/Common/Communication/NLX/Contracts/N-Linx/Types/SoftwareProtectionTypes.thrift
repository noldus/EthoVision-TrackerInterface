//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx CSharp
// Module     :   Noldus.NLinx.Thrift
// File       :   SoftwareProtectionTypes.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 02-06-2016 Tijmen van Voorthuijsen   - Original version
//----------------------------------------------------------------------------

namespace * Noldus.NLinx.Contracts.NLinx

/** This enumerator is mostly used for testing purposes, it gives information about the protection status.*/
enum EProtectionInfo
{
    /** Default is success.*/
    NOTINITIALIZED  = 0,

    /** The software protection has started and is running in the background.*/
    STARTED         = 1
}

/** Type of RabbitMQ exchange.
 *  NOTE: this is a COPY FROM COMMONTYPES.THRIFT because using the common contracts directly in the N-Linx Thrift module
 *        causes double definition of the common generated files in client software that wants to include N-Linx.
 */
enum ExchangeType
{
  /** A direct exchange delivers messages to queues based on the message routing key. */
  DIRECT = 0,

  /** A fanout exchange routes messages to all of the queues that are bound to it and the routing key is ignored. */
  FANOUT,

  /** A headers exchange is designed to for routing on multiple attributes that are more easily expressed as message headers than a routing key. */
  HEADERS,

  /** Topic exchange routes messages to one or many queues based on matching between a message routing key and the pattern that was used to bind a queue to an exchange. */
  TOPIC = 3
}


/** Defines parameters for RSA cryptography. This enum has been defined here first and for all as a reference for 
 *  possible RSA settings and to define clear symbolic names them. The parameter(s) that is actually used in the 
 *  N-Linx protection is defined below. */
enum ERsaParameters
{
    /** RSA key length of 2048 bits.*/
    KEYSIZE_2048    = 2048,
}


/**
 * Defines possible padding schemes which can be used for the public key (RSA) cryptography. This enum has been defined
 * here first and for all as a reference for possible RSA padding schemes and to define clear symbolic names. The padding
 * scheme that is actually used in the N-Linx protection is defined below.
 */
enum ERsaPadding
{
    /** PKCS#1 v1.5 padding.*/
    PKCS1v15   = 1,
    
    /** PKCS#1 v2 or OAEP padding.*/
    OAEP  = 2,
}

/** N-Linx protection uses a key size of 2048 for RSA cryptography.*/
const ERsaParameters    rsaKeySize      = ERsaParameters.KEYSIZE_2048;

/** N-Linx protection uses PKCS#1 v2 or OAEP padding for RSA key exchange cryptography.
 *  Note that the N-Linx signature creation and verification uses PKCS#1 v1.5 padding.
 */
const ERsaPadding       rsaPadding      = ERsaPadding.OAEP;


/**
 * Defines possible key sizes which can be used for the Advanced Encryption Standard. This enum has been defined
 * here first and for all as a reference for possible AES key sizes and to define clear symbolic names. The key size
 * that is actually used in the N-Linx protection is defined below.
 */
enum EAesParameter
{
  /** AES block encryption algorithm with a key length of 128 bits.*/
  KEYSIZE_128 = 16,

  /** AES block encryption algorithm with a key length of 192 bits.*/
  KEYSIZE_192 = 24,

  /** AES block encryption algorithm with a key length of 256 bits.*/
  KEYSIZE_256 = 32,

  /** The block length of the key cipher.*/
  BLOCKSIZE   = 16
}

/**
 * Defines possible padding schemes which can be used for the Advanced Encryption Standard. This enum has been defined
 * here first and for all as a reference for possible AES padding schemes and to define clear symbolic names. The padding
 * scheme that is actually used in the N-Linx protection is defined below.
 */
enum EAesPaddingMode
{
    /** PKCS#5 padding. PKCS#5 padding is identical to PKCS#7 padding, except that it has only been defined for block ciphers 
     * that use a 64-bit (8 byte) block size. In practice the two can be used interchangeably. */
    PKCS5   = 1,
    
    /** The padding uses random numbers.*/
    RANDOM  = 2,

    /** The padding uses zeros.*/
    ZERO    = 3
}

/**
 * Defines possible block cipher modes which can be used for the Advanced Encryption Standard. This enum has been defined
 * here first and for all as a reference for possible AES block cipher modes and to define clear symbolic names. The block
 * cipher mode that is actually used in the N-Linx protection is defined below.
 */
enum EAesBlockCipherMode
{
    /** Cipher block chaining */
    CIPHER_MODE_CBC = 1,

    /** Electronic code book */
    CIPHER_MODE_ECB = 2,
    
    /** Output feedback mode */
    CIPHER_MODE_OFB = 3,
    
    /** Cipher feedback mode */
    CIPHER_MODE_CFB = 4,
    
    /** Ciphertext stealing mode */
    CIPHER_MODE_CTS = 5,
}

/** N-Linx protection uses a key size of 256 bits for AES cryptography.*/
const EAesParameter         aesKeySize          = EAesParameter.KEYSIZE_256;
/** N-Linx protection uses a block size of 16 bytes for AES cryptography.*/
const EAesParameter         aesIvSize           = EAesParameter.BLOCKSIZE;
/** N-Linx protection uses PKCS #5 padding for AES cryptography.*/
const EAesPaddingMode       aesPaddingMode      = EAesPaddingMode.PKCS5;
/** N-Linx protection uses CBC block cipher mode for AES cryptography.*/
const EAesBlockCipherMode   aesBlockCipherMode  = EAesBlockCipherMode.CIPHER_MODE_CBC;




/** A GUID is transfered as a 16 byte number with a byte order presented in big endian format according to the RFC for GUIDs(RFC4122). 
 *  NOTE: this is a COPY FROM COMMONTYPES.THRIFT because using the common contracts directly in the N-Linx Thrift module
 *        causes double definition of the common generated files in client software that wants to include N-Linx.
 */
typedef binary GUID

/** The time in microseconds that N-Linx can be used before it expires and becomes locked, unless a successful unlock response was received.*/
const i64  unlockExpirationTime    = 300000000                 // 5 minutes

/** The regular time interval at which an unlock request is send, in microseconds.*/
const i64  unlockTimerPeriod       = 30000000                  // 30 seconds


/// <summary>
/// The public key for the RSA asymetric encryption.
/// </summary>
struct PublicKey
{
    /** The 3-byte Exponent parameter for the RSA asymetric encryption algorithm.*/
    1: optional binary      exponent,

    /** The 256-byte Modulus parameter for the RSA asymetric encryption algorithm.*/
    2: optional binary      modulus
}

/** Data send when some N-Linx node makes an unlock request to all N-Linx nodes.*/
struct UnlockRequestData
{
    /** A unique identifier of a request message. this Id is needed to match the correct response from a replier.*/
    1: optional i64         requestId,

    /** The public RSA key which will be used to encrypt the returned response message.*/
    2: optional PublicKey   publicKey,

    /** A 16-bit long random number to make each request unique and protects against replay attacks.*/
    3: optional binary      nonce,
}

struct UnlockResponseData
{
    /** The unique identifier that was send with the request message. This Id is returned so that the requestor can match the correct response from a replier.*/
    1: optional i64         requestId,

    /** The epiphermal AES session key, encrypted with the RSA public key.*/
    2: optional binary      encryptedSessionKey,

    /** The initialization vector for the AES encryption, as plain text.*/
    3: optional binary      aesIv,

    /** The N-Linx signature, encrypted with the AES session key.*/
    4: optional binary      encryptedSignature,

    /** The thumbprint of the Noldus certificate, encrypted with the AES session key.*/
    5: optional binary      encryptedThumbPrint,

    /** The serial number of the Noldus certificate, encrypted with the AES session key.*/
    6: optional binary      encryptedSerialNumber,

    /** The N-Linx password, encrypted with the AES session key.*/
    7: optional binary      encryptedNLinxPassword,

    /** The public key of the Noldus certificate, encrypted with the AES session key.*/
    8: optional PublicKey   publicKeyCertificate,

    /** The SHA-256 hash of the message.*/
    9: optional binary      hash,
}
