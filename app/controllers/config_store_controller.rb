class ConfigStoreController < ApplicationController
  def index
    # read config file
    config_file = File.read(".config")
    # split each line and create array
    config_file = config_file.split("\n")

    # initialize config hash
    @config = {}

    # loop through each line
    config_file.each do |x|
        # ignore comments
        next if x[0] == "#"

        # print error if line does not contain =
        if !x.include? "="
            print "Invalid config parameter: #{x}\n"
            next
        end

        # split line to get key value pairs
        line = x.split("=")

        # check for incomplete lines
        if line[0].blank? || line[1].blank?
            print "Invalid config parameter: #{x}\n"
            next
        end

        # remove leading and trailing whitespace
        line[0] = line[0].strip
        line[1] = line[1].strip

        # convert string to boolean value
        line[1] = helpers.convert_string_to_boolean(line[1])

        # if string is numeric convert to integer or float
        line[1] = helpers.convert_string_to_int_or_float(line[1])

        # store key value pair
        @config[line[0]] = line[1]
    end
  end
end
