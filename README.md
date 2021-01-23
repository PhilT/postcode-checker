# README

## Development

### Start server

    rails s

### Navigate to

    localhost:3000

Enter a postcode and click 'Check'.


### Run tests

    rails test          # Unit (models, helpers) and integration tests (stubs web calls)
    rails test:system   # Run end to end tests (uses real postcodes.io lookup) and Rubocop
    rails test:all      # Run both the above


## Suggestions/Questions for future improvements

- A whitelist could be changed without server downtime or developer effort,
  depending on how often it changes and in what way (e.g. complete new list or 1 or 2 additions)
- I'd also ask whether the servable areas would change as these are currently hardcoded
- I could add caching to make repeated lookups a little faster but would need to get details
  on how likely repeated postcodes are to be looked up and whether postcodes.io could handle
  the load anyway.
