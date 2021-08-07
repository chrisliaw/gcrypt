
require 'fiddle'

require_relative "config"
require_relative "func_prot"

module Gcrypt
  module Libgcrypt
    include ToolRack::ConditionUtils
    class FunctionNotFound < StandardError; end

    def init_lib(&block)
      if is_empty?(Gcrypt::Config.library_version)
        Gcrypt::Config.library_version = find_function(:check_version).call(Gcrypt::Config.minVer)
      end
    end

    protected
    def find_function(mtd, *args, &block)
      val = instance_variable_get("@#{mtd}")
      if is_empty?(val)
        res = Gcrypt::FuncProt::Map[mtd]
        raise FunctionNotFound, "Function '#{mtd}' not found" if is_empty?(res)
        res = Fiddle::Function.new(dlHandle[res[0]],*(res[1]))
        instance_variable_set("@#{mtd}", res)
        val = res
      end

      val
    end

    def is_rv_success?(rv)
      rv == Gcrypt::LibgcryptErrorConst::GPG_ERR_NO_ERROR
    end

    def check_rv(rv, error = Error)
      if not is_rv_success?(rv) 
        throw_error(rv, error)
      end
    end

    def throw_error(st, error = Error)
      errReason = find_function(:strerror)
      errMsg = errReason.call(st)
      throw error, errMsg
    end

    def dlHandle
      hdl = Gcrypt::Config.instance.gDlHdl
      hdl = Fiddle.dlopen(Gcrypt::Config.dlPath) if is_empty?(hdl)
      hdl
    end

    def logger
      Gcrypt::Config.instance.logger
    end

  end
end
