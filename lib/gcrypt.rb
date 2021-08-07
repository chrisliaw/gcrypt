# frozen_string_literal: true

require 'toolrack'
require 'tlogger'

require_relative "gcrypt/version"
require_relative "gcrypt/libgcrypt_control_constant"
require_relative "gcrypt/libgcrypt_error_constant"
require_relative "gcrypt/cipher_constant"

require_relative "gcrypt/aes"
require_relative "gcrypt/securerandom"
require_relative "gcrypt/libgcrypt"

module Gcrypt
  class Error < StandardError; end
  # Your code goes here...
end
