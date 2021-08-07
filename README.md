# Gcrypt

It was meant to expose the GPG libgcrypt to Ruby user.

Unfortunately due to time constraint the struct gcry\_cipher\_handle of cipher\_internal.h is too daunting.

The many struct/union inside it make it too time comsuning to duplicate into Ruby world.

One day maybe will continue finish this project.

Was compile and tested on LinuxMint 20.2 x86\_64 (Kernel 5.4.0-80-generic), Ruby 3.0.2

Not ready for any operations except random number generator.

## Initial Motive

With compare to default OpenSSL engine:

* Smaller binary code base 
* Support Twofish block cipher
* Support Salsa20 stream cipher
* Support PC/SC


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gcrypt'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install gcrypt


## Contributing

Anyone welcome to clone and continue

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

