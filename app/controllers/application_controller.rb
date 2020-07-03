class ApplicationController < ActionController::Base
    # read config file
    config_file = File.read(".config")
    # split each line
    config_file = config_file.split("\n")

    config = {}

    config_file.each do |x|
        next if x[0] == "#"

        if !x.include? "="
            print "Invalid config parameter: #{x}\n"
            next
        end

        line = x.split("=")

        if line[0].blank? || line[1].blank?
            print "Invalid config parameter: #{x}\n"
            next
        end

        line[0] = line[0].strip
        line[1] = line[1].strip

        if line[1] == "true" || line[1] == "yes" || line[1] == "on"
            line[1] = true
        elsif line[1] == "false" || line[1] == "no" || line[1] == "off"
            line[1] = false
        elsif helpers.is_number?(line[1])
            if line[1].include? "."
                line[1] = line[1].to_f            
            else
                line[1] = line[1].to_i
            end
        end

        config[line[0]] = line[1]
    end

    puts config
end
