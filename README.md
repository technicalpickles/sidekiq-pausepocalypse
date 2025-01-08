# README

Reproducing https://github.com/sidekiq/sidekiq/issues/6574


## Reproduction

Setup:
```
bundle config --local enterprise.contribsys.com username:password
bundle install
```

Run:
```
bin/rails runner reproduce.rb
```

(it will prompt you to run `bin/sidekiq` and press enter once it's running, and press enter a few other times to give you a chance to review the output)

To see it work as expected, switch to good-version-7.3.3, and run the same commands again.