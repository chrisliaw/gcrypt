

module Gcrypt
  module FuncProt
    Map = {
      check_version: ['gcry_check_version', [[Fiddle::TYPE_CONST_STRING],Fiddle::TYPE_CONST_STRING]],
      control: ['gcry_control', [[Fiddle::TYPE_VARIADIC],Fiddle::TYPE_INT]],

      strerror: ['gcry_strerror',[[Fiddle::TYPE_INT],Fiddle::TYPE_CONST_STRING]],
      strsource: ['gcry_strsource',[[Fiddle::TYPE_INT],Fiddle::TYPE_CONST_STRING]], 

      randomize: ['gcry_randomize',[[Fiddle::TYPE_VOIDP,Fiddle::TYPE_INT, Fiddle::TYPE_INT],Fiddle::TYPE_VOID]],
      create_nonce: ['gcry_create_nonce',[[Fiddle::TYPE_VOIDP,Fiddle::TYPE_INT],Fiddle::TYPE_VOID]],

      cipher_open: ['gcry_cipher_open',[[Fiddle::TYPE_INTPTR_T,Fiddle::TYPE_INT, Fiddle::TYPE_INT, Fiddle::TYPE_INT],Fiddle::TYPE_INT]],
      cipher_close: ['gcry_cipher_close',[[Fiddle::TYPE_INT],Fiddle::TYPE_VOID]]

    }
  end
end
