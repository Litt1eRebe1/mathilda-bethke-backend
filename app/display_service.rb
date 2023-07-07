require_relative "application_report"

class DisplayService
    def initialize(file_name)
        @application_report = ApplicationReport.new(file_name)
    end

    def show_application
        exit_application = false
        while !exit_application
            show_main_menu
            choice = gets.chomp 
            if choice == terminating_character
                puts end_of_execution
                exit_application = true
                break
            end
            if (!valid_choices.include?(choice.downcase))
                puts invalid_selection
            else
                channel = valid_choices[valid_choices.find_index(choice) % 4]
                report = @application_report.retrieve_trend(channel)
                puts report
            end
        end
    end

    def show_main_menu 
        puts "===============================================================================\n"
        puts "SELECT ONE OF THE OPTIONS FOR APPLICATIONS: \n"
        puts "0: all \n"
        puts "1: sales \n"
        puts "2: website \n"
        puts "3: qr \n"
        puts "#{terminating_character}: TO EXIT APPLICATION \n"
    end

    def valid_choices
        [ "all", "sales", "website", "qr", "0", "1", "2", "3"]
    end 

    def end_of_execution 
        "Exiting application\n"
    end

    def invalid_selection
        "Invalid selection\n"
    end

    def terminating_character 
        "-99"
    end
end