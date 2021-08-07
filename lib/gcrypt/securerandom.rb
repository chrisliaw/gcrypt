

require_relative "config"
require_relative "libgcrypt"

module Gcrypt
  module SecureRandom
    extend Gcrypt::Libgcrypt
    
    GCRY_RNG_TYPE_STANDARD   = 1  #/* The default CSPRNG generator.  */
    GCRY_RNG_TYPE_FIPS       = 2  #/* The FIPS X9.31 AES generator.  */
    GCRY_RNG_TYPE_SYSTEM     = 3  #/* The system's native generator. */

    GCRY_WEAK_RANDOM        = 0
    GCRY_STRONG_RANDOM      = 1
    GCRY_VERY_STRONG_RANDOM = 2

    def self.secure_random_bytes(size)
      init_lib

      res = nil
      Fiddle::Pointer.malloc(size, Fiddle::RUBY_FREE) do |pointer|
        find_function(:randomize).call(pointer, size, GCRY_VERY_STRONG_RANDOM)
        res = pointer.to_s(size)
      end
      res
    end

    def self.random_bytes(size)
      res = nil
      Fiddle::Pointer.malloc(size, Fiddle::RUBY_FREE) do |pointer|
        find_function(:create_nonce).call(pointer, size)
        res = pointer.to_s(size)
      end
      res
    end


  end
end
