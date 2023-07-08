# Coding exercise - Application Report Trend

## Specifications

The task is to read a JSON file containing applications with their timestamps and omni-channels (sales, website, or qr). Provide a method that returns the average number (rounded up) of applications by hour (0 to 23) of the day across the total number of days available. The method also accepts a channel parameter (`all`, `sales`, `website`, and `qr`) to filter the results based on which channel the application came from. An `all` value returns all the applications.

A skeleton code (Ruby) and test (RSpec) has been provided to get you started. Write the necessary code to achieve the requirements and write tests for your solution.

## Data

A JSON data has been provided to get you started: `applications.json`. The fields are:

1. `id`: The ID of the application in UUID format.
2. `timestamp`: The time the application has been created which will be the basis of the report. This is in NZST timezone (+12).
3. `channel`: The omni-channel where the application came from. Valid values are `sales`, `website`, and `qr`.

The JSON file contains three days worth of data which will determine how you calculate the average. You may add more data if necessary to your tests.

## Suggestions

- Make it simple and straightforward.
- Use of code linter is recommended
- Remove unnecessary code or debuggers before submitting

## Deliverable

- Provide the public git repository URL, e.g. GitHub, or a zip archive.
- Update this README file containing the following:
  - Instructions how to run the specs
  - A technical overview of the implementation:
    - Summary or justification of design decisions or architecture
    - Areas to improve further

## Answer
- How to run the spec: rspec spec/application_report_spec.rb
- For improvement:
  - 3.to_f could be dynamic instead of a fixed integer.

# INFORMATION FOR THE COMPLETED ASSIGNMENT
## Instructions on how to run the specs
- Execute the following command from within the project root directory: `rspec spec`
  - to note: The tests were updated since they were testing for rounded down values.

## Summary or justification of design decisions or architecture
- For this task there was not a lot of infrastructure used, just implemented some services in the name of keeping it simple. There is the main `application-report` service, as provided by the tutorial example, and an additional `display service` to keep main simple. 
### More details
- A menu is shows which allows the user to input which channel to filter by, this allows either selecting the menu option, or entering the name of the channel. 
- The user input is checked, and invalid input will not be allowed.
- Upon selection the following logic is applied:
  - The data is filtered by the provided channel
  - The data is grouped per hour
  - The average is calculated in the following way:
    - The number of days is calculated by grouping per day and getting the count
    - If there is no value for a given hour then zero is returned as the average
    - Else the values is cast to a float to avoid an integer division problem, then it is divided by the number of days and the .ceil function is used to round up the value
    - This data is then stored in a hash which is returned and displayed

## Areas for improvement
- The application can be greatly improved by turning it into a full fledged application that has the necessary functionality, plus the additional functionality of being able to either upload a file, or directly integrate with the application services. 
- Additionally a file reading service can be added to allow users to input the file name, and to handle any file related errors

## HOW TO RUN
- use the terminal to navigate to the route directory for the application and execute the following command: `ruby app/main.rb`
  - Please note that if there are troubles with the file path, make sure that the command is not being executed from within the app directory
- To change which file to use, update the `FILE_PATH` variable in the `main.rb` file