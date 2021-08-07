
require 'fiddle'
require 'fiddle/import'

module Gcrypt
  module CipherConstant
    extend Fiddle::Importer

    CBulk = struct [
      "void * cfb_enc_func",
      "void * cfb_dec_func",
      "void * cbc_enc_func",
      "void * cbc_dec_func",
      "void * ctr_enc_func",
      "size_t * ocb_dec_func",
      "size_t * ocb_auth",
      "void * xts_crypt"
    ]

    CMarks = struct [
      "uint key",
      "uint iv",
      "uint tag",
      "uint finalize"
    ]

    ProperlyAlignedType = union [
      "int a",
      "short b",
      "char c[1]",
      "long d",
      "u64 e",
      "float f",
      "double g"
    ]

    CipherCtxAlign = union [
      "ProperlyAignedType foo",
      "char c[1]"
    ]
    
    UIv = union [
      "CipherCtxAlign iv_align",
      "uchar iv[16]"
    ]

    UCtr = union [
      "CipherCtxAlign iv_align",
      "uchar ctr[16]"
    ]



    Context = struct [
      "int magic",
      "size_t actual_handle_size",
      "size_t handle_offset",
      "void * gcry_cipher_spec_t",
      "int algo",
      "CBulk bulk",

      "int mode",
      "uint flags",

      "CMarks marks",
      
      "UIv uiv",
      "UCtr uctr",

      "uchar lastiv[16]",
      "int unused",
      
    ]

    GCRY_CIPHER_NONE        = 0
    GCRY_CIPHER_IDEA        = 1
    GCRY_CIPHER_3DES        = 2
    GCRY_CIPHER_CAST5       = 3
    GCRY_CIPHER_BLOWFISH    = 4
    GCRY_CIPHER_SAFER_SK128 = 5
    GCRY_CIPHER_DES_SK      = 6
    GCRY_CIPHER_AES         = 7
    GCRY_CIPHER_AES192      = 8
    GCRY_CIPHER_AES256      = 9
    GCRY_CIPHER_TWOFISH     = 10

    #/* Other cipher numbers are above 300 for OpenPGP reasons. */
    GCRY_CIPHER_ARCFOUR     = 301  #/* Fully compatible with RSA's RC4 (tm). */
    GCRY_CIPHER_DES         = 302  #/* Yes this is single key 56 bit DES. */
    GCRY_CIPHER_TWOFISH128  = 303
    GCRY_CIPHER_SERPENT128  = 304
    GCRY_CIPHER_SERPENT192  = 305
    GCRY_CIPHER_SERPENT256  = 306
    GCRY_CIPHER_RFC2268_40  = 307  #/* Ron's Cipher 2 (40 bit). */
    GCRY_CIPHER_RFC2268_128 = 308  #/* Ron's Cipher 2 (128 bit). */
    GCRY_CIPHER_SEED        = 309  #/* 128 bit cipher described in RFC4269. */
    GCRY_CIPHER_CAMELLIA128 = 310
    GCRY_CIPHER_CAMELLIA192 = 311
    GCRY_CIPHER_CAMELLIA256 = 312
    GCRY_CIPHER_SALSA20     = 313
    GCRY_CIPHER_SALSA20R12  = 314
    GCRY_CIPHER_GOST28147   = 315
    GCRY_CIPHER_CHACHA20    = 316

    GCRY_CIPHER_AES128      = GCRY_CIPHER_AES
    GCRY_CIPHER_RIJNDAEL    = GCRY_CIPHER_AES
    GCRY_CIPHER_RIJNDAEL128 = GCRY_CIPHER_AES128
    GCRY_CIPHER_RIJNDAEL192 = GCRY_CIPHER_AES192
    GCRY_CIPHER_RIJNDAEL256 = GCRY_CIPHER_AES256

    ## 
    # Mode
    ##
    GCRY_CIPHER_MODE_NONE     = 0   #/* Not yet specified. */
    GCRY_CIPHER_MODE_ECB      = 1   #/* Electronic codebook. */
    GCRY_CIPHER_MODE_CFB      = 2   #//* Cipher feedback. */
    GCRY_CIPHER_MODE_CBC      = 3   #//* Cipher block chaining. */
    GCRY_CIPHER_MODE_STREAM   = 4   #//* Used with stream ciphers. */
    GCRY_CIPHER_MODE_OFB      = 5   #//* Outer feedback. */
    GCRY_CIPHER_MODE_CTR      = 6   #//* Counter. */
    GCRY_CIPHER_MODE_AESWRAP  = 7   #//* AES-WRAP algorithm.  */
    GCRY_CIPHER_MODE_CCM      = 8   #//* Counter with CBC-MAC.  */
    GCRY_CIPHER_MODE_GCM      = 9   #//* Galois Counter Mode. */
    GCRY_CIPHER_MODE_POLY1305 = 10  #//* Poly1305 based AEAD mode. */
    GCRY_CIPHER_MODE_OCB      = 11  #//* OCB3 mode.  */
    GCRY_CIPHER_MODE_CFB8     = 12  #//* Cipher feedback (8 bit mode). */
    GCRY_CIPHER_MODE_XTS      = 13  #//* XTS mode.  */


    ## 
    # Flag
    ##
    GCRY_CIPHER_SECURE      = 1  #/* Allocate in secure memory. */
    GCRY_CIPHER_ENABLE_SYNC = 2  #/* Enable CFB sync mode. */
    GCRY_CIPHER_CBC_CTS     = 4  #/* Enable CBC cipher text stealing (CTS). */
    GCRY_CIPHER_CBC_MAC     = 8  #/* Enable CBC message auth. code (MAC). */
    
    #/* GCM works only with blocks of 128 bits */
    GCRY_GCM_BLOCK_LEN   = (128 / 8)
    #/* CCM works only with blocks of 128 bits.  */
    GCRY_CCM_BLOCK_LEN   = (128 / 8)
    #/* OCB works only with blocks of 128 bits.  */
    GCRY_OCB_BLOCK_LEN   = (128 / 8)
    #/* XTS works only with blocks of 128 bits.  */
    GCRY_XTS_BLOCK_LEN   = (128 / 8)

  end
end
