class SqlLogger < Logger
  def format_message(severity, timestamp, progname, msg)
    #"#{timestamp.to_formatted_s(:db)} #{severity} #{msg}\n" 
    "#{msg}\n"
  end 
end




logfile = File.open('log/sql.log', 'a')  
logfile.sync = true
$sql_log = SqlLogger.new(logfile)

module SqlLog



  def self.append_features(klass)
    super
    klass.class_eval do
      unless method_defined?(:log_info_without_trace)
        alias_method :log_info_without_trace, :log_info
        alias_method :log_info, :log_info_with_trace
      end
    end
   end

  
   def log_info_with_trace(sql, name, runtime)
    log_info_without_trace("SQL[ #{sql} ]SQL", name, runtime)
    $sql_log.info(sql)
  end
end  

class ::ActiveRecord::ConnectionAdapters::AbstractAdapter
  include SqlLog
end