# I wanted to process my controller logs to  be linux/cygwin log processing tools friendly
# used in a real project 
# written for rails 1.1.2 , 1.1.6

module ActionController
  class Base
	  
#get log in following format
#method|URL|session_id | timestamp | IP | Status | Controller | action | id |parameters | 0.00075 (1338 reqs/sec)| Rendering: 1.62710 (99%) | DB: 0.00000 (0%) |  
      def log_processing
        if logger
        	
        	data = []
        	#data << "\n\n" #empty line to seperate between records #not needed as it is single line for this ask
        	data << "#{request.method.to_s.upcase}"
        	#data << 
        	data << "#{@session.session_id}" if @session and @session.respond_to?(:session_id)
        	data << "#{request_origin}".gsub("at","|") #was giving output in  "IP at timestamp" format
        	#data <<
        	#data <<
        	data << "#{respond_to?(:filter_parameters) ? filter_parameters(@params).inspect : @params.inspect}"
        	logger.info data.join"|"
#          logger.info "\n\nProcessing #{controller_class_name}\##{action_name} (for #{request_origin}) [#{request.method.to_s.upcase}]"
 #         logger.info "  Session ID: #{@session.session_id}" if @session and @session.respond_to?(:session_id)
 #         logger.info "Senthil  Parameters: #{respond_to?(:filter_parameters) ? filter_parameters(@params).inspect : @params.inspect}"
        end
      end
end
end