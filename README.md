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

## Summary or justification of design decisions or architecture
- For this task there was not a lot of infrastructure used, just implemented some services in the name of keeping it simple. There is the main `application-report` service, as provided by the tutorial example, and an additional `display service` to keep main simple. 

## Areas for improvement
- The application can be greatly improved by turning it into a full fledged application that has the necessary functionality, plus the additional functionality of being able to either upload a file, or directly integrate with the application services. 

## HOW TO RUN
- use the terminal to navigate to the route directory for the application and execute the following command: `ruby app/main.rb`
  - Please note that if there are troubles with the file path, make sure that the command is not being executed from within the app directory
- To change which file to use, update the `FILE_PATH` variable in the `main.rb` file