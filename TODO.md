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
- [ ] Add whitelist for SH24 1AA and SH24 1AB


## Harden

- [ ] Handle invalid input
- [ ] Handle service failures
- [ ] Add caching


## Clean up

- [ ] Pretty postcode in allow message (PostcodeHelper)
- [ ] Add root redirect to /postcodes
- [ ] Remove unused gems

## Suggestions for future improvements

- Database based whitelist could be edited without server downtime or developer effort

