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
- [ ] Handle different case postcodes


## Harden

- [ ] Handle invalid input
- [ ] Handle service failures
- [ ] Add caching


## Clean up

- [ ] Pretty postcode in allow message (PostcodeHelper)
- [ ] Add root redirect to /postcodes
- [ ] Remove unused gems

## Suggestions/Questions for future improvements

- A whitelist could be changed without server downtime or developer effort,
  depending on how often it changes and in what way (e.g. big list or single/few additions)
- I'd also ask whether the servable areas would change as these are currently hardcoded
