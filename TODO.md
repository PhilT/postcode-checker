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
- [ ] Pretty postcode in allow message (PostcodeHelper)
- [ ] Add root redirect to /postcodes
- [x] Remove unused gems

## Suggestions/Questions for future improvements

- A whitelist could be changed without server downtime or developer effort,
  depending on how often it changes and in what way (e.g. complete new list or 1 or 2 additions)
- I'd also ask whether the servable areas would change as these are currently hardcoded
- Could show a nicer message when the postcode is invalid as opposed to just being outside the service area.
- I could add caching to make repeated lookups a little faster but would need to get details
  on how likely repeated postcodes are to be looked up and whether postcodes.io could handle
  the load anyway.
