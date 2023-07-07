require_relative '../app/display_service'

FILE_NAME = "applications.json"
display_service = DisplayService.new(FILE_NAME)
display_service.show_application