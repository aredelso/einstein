module ConfigStoreHelper
    def convert_string_to_boolean string
        if string == "true" || string == "yes" || string == "on"
            true
        elsif string == "false" || string == "no" || string == "off"
            false
        else
            string
        end
    end

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
    
    def is_number? string
        true if Float(string) rescue false
    end
end
