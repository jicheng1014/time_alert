require 'thor'
require 'daemons'

require_relative "./time_alert/version"
require_relative "./cli"

module TimeAlert
  # Your code goes here...
  def self.alert(minutes)
    file_path = "/tmp/stop_alert"
    FileUtils.touch file_path
    Daemons.daemonize
    sleep minutes*60
    i = 0;
    while(File.exist? file_path) do
      #`say "bang bang bang"`
      system("say", "bang bang bang")

      sleep 0.5
      i += 1
      break if i > 100
    end
  end

  def self.stop
    begin
      File.delete "/tmp/stop_alert"
    rescue Errno::ENOENT => e
    end

  end
end
::CLI.start ARGV

