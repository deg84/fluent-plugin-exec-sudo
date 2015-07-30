require 'fluent/plugin/out_exec'

module Fluent
  class ExecSudoOutput < ExecOutput
    Plugin.register_output('exec_sudo', self)

    config_param :user, :string, :default => nil

    def write(chunk)
      if @user.nil?
        super
        return true
      end

      if chunk.respond_to?(:path)
        prog = "sudo -u #{@user} -i sh -c '#{@command} #{chunk.path}'"
      else
        tmpfile = Tempfile.new("fluent-plugin-exec-su-")
        chunk.write_to(tmpfile)
        tmpfile.close
        prog = "sudo -u #{@user} -i sh -c '#{@command} #{tmpfile.path}'"
      end

      system(prog)
      ecode = $?.to_i
      tmpfile.delete if tmpfile

      if ecode != 0
        raise "command returns #{ecode}: #{prog}"
      end
    end
  end
end
