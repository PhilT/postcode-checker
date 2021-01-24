# README

## Development

Tested on Ubuntu 20.04

For system tests, headless chrome install is required. If not installed do:

```
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt-get update
sudo apt-get install google-chrome-stable
```

Full details at https://www.imaginarycloud.com/blog/from-capybara-webkit-to-headless-chrome-and-chromedriver/

### Start server

```
rails s
```

### Navigate to

```
localhost:3000
```

Enter a postcode and click 'Check'.


### Run tests

```
rails test          # Unit (models, helpers) and integration tests (stubs web calls)
rails test:system   # Run end to end tests (uses real postcodes.io lookup) and Rubocop
rails test:all      # Run both the above
```

## Suggestions/Questions for improvements

A whitelist could be changed without server downtime or developer effort,
depending on how often it changes and in what way (e.g. complete new list or 1 or 2 additions).
This would probably require a database or S3 storage and add some extra work so left for a future
iteration.

I'd also ask whether the servable areas would change, how often and in what way (again)
as these are currently hardcoded but could also be stored in a database or a file on
secured S3 storage.

I could add caching to make repeated lookups a little faster and not hammer the Postcodes.IO
service but would need to get details on how likely repeated postcodes are to be looked up 
and performance test Postcodes.IO with more data.

Overall, I'm happy with the eventual design of the postcode model as it doesn't depend
directly on the postcode and whitelist services while still being clear, in my opinion.

Sorry, I couldn't resist adding the tiniest bit of styling. No one needs Times New Roman in 2021 ;)

## TODO

Please take a look at TODO.md for a run down of what I did.
