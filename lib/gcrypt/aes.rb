
require_relative "libgcrypt"

require_relative "securerandom"

module Gcrypt
  class AES
    include ToolRack::ConditionUtils
    include Gcrypt::Libgcrypt

    attr_accessor :iv, :key
    def initialize(keySize = 256, mode = :gcm)
      init_lib
      @keySize = keySize
      @mode = mode.to_s.downcase.to_sym
      case @mode
      when :gcm
        @ivLen = 12
      else
        @ivLen = 16
      end
      @data = []
    end

    def random_key
      if is_empty?(@key)
        @key = SecureRandom.secure_random_bytes(@keySize/8)
      end
      @key
    end

    def random_iv
      if is_empty?(@iv)
        @iv = SecureRandom.random_bytes(@ivLen)
      end
      @iv
    end

    def encrypt_init(&block)
      cipher_open(CipherConstant::GCRY_CIPHER_AES256, @mode, 0)
      if block
        block.call(self)
        cipher_close
      else
        self
      end
    end
    def encrypt_update(data,&block)
      block.call(:plain, data) if block

      block.call(:encrypted, enc) if block
    end
    def encrypt_close(&block)
      cipher_close 
    end


    private
    def cipher_open(algo, mode, flag)
      @cipherHdl = nil
      Fiddle::Pointer.malloc(Fiddle::SIZEOF_INT, Fiddle::RUBY_FREE) do |pointer|
        find_function(:cipher_open).call(pointer, algo, mode_to_gcrypt(mode), flag)
        @cipherHdl = pointer.to_i
      end

      @cipherHdl
    end

    def cipher_close
      if @cipherHdl.nil?
      else
        find_function(:cipher_close).call(@cipherHdlf)
      end
    end

    def mode_to_gcrypt(mode)
      case mode
      when :ecb
        CipherConstant::GCRY_CIPHER_MODE_ECB
      when :cfb
        CipherConstant::GCRY_CIPHER_MODE_CFB
      when :cbc
        CipherConstant::GCRY_CIPHER_MODE_CBC
      when :stream
        CipherConstant::GCRY_CIPHER_MODE_STREAM
      when :ofb
        CipherConstant::GCRY_CIPHER_MODE_OFB
      when :ctr
        CipherConstant::GCRY_CIPHER_MODE_CTR
      when :aeswrap
        CipherConstant::GCRY_CIPHER_MODE_AESWRAP
      when :ccm
        CipherConstant::GCRY_CIPHER_MODE_CCM
      when :gcm
        CipherConstant::GCRY_CIPHER_MODE_GCM
      when :poly1305
        CipherConstant::GCRY_CIPHER_MODE_POLY1305
      when :ocb
        CipherConstant::GCRY_CIPHER_MODE_OCB
      when :cfb8
        CipherConstant::GCRY_CIPHER_MODE_CFB
      when :xts
        CipherConstant::GCRY_CIPHER_MODE_XTS
      when :none
        CipherConstant::GCRY_CIPHER_MODE_NONE
      else
        raise Error, "Unsupported mode '#{mode}'"
      end
    end

  end
end
