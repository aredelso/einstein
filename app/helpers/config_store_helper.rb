module ConfigStoreHelper
    # converts a string to a boolean
    def convert_string_to_boolean string
        if string == "true" || string == "yes" || string == "on"
            true
        elsif string == "false" || string == "no" || string == "off"
            false
        else
            string
        end
    end

    # converts a string to a number
    def convert_string_to_int_or_float string
        if is_number?(string)
            if string.include? "."
                string.to_f
            else
                string.to_i
            end
        else
            string
        end
    end
    
    # check if string is a number
    def is_number? string
        true if Float(string) rescue false
    end
end
