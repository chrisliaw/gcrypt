
require 'tlogger'

module Gcrypt
  class Config
    include Singleton

    attr_accessor :logger, :dlPath, :minVer, :library_version, :gDlHdl
    def initialize
      @dlPath = File.join(File.dirname(__FILE__),"..","..","native","linux","libgcrypt.so.20.2.9")  
      @minVer = "1.8.0"
      @logger = Tlogger.new
    end

    def self.method_missing(mtd, *args, &block)
      if Config.instance.respond_to?(mtd)
        Config.instance.send(mtd, *args, &block)
      end
    end
  end
end
