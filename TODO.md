## Prepare

- [x] Create Rails 6 App
- [x] Setup and run Rubocop


## Simplest working solution

- [x] Setup Headless Chrome with first, simple system test
- [x] Add postcode_io gem
- [x] Present search form on index page
- [x] Implement basic postcode lookup no error checking happy path
- [x] Allow "Southwark" and "Lambeth" LSOAs
- [x] Tiny bit of styling
- [x] Add whitelist for SH24 1AA and SH24 1AB
- [x] Handle different case postcodes


## Harden

- [x] Handle invalid input
- [x] Handle service failures


## Clean up

- [x] Make Whitelist and PostcodeService consistent
- [x] Remove attributes from Postcode.initialize
- [x] Pretty postcode in allow message (PostcodeHelper)
- [x] Add root redirect to /postcodes
- [x] Remove unused gems

