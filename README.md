## Installation

- [Install Ruby](https://www.ruby-lang.org/en/documentation/installation/)
- [Install bundler](https://bundler.io/) `gem install bundler`
- Clone the project `git clone git@github.com:andresakata/ruby-memory-bloat.git`
- Install dependencies `bundle install`

## Usage

You can execute the `run.rb` script to run the test passing the log file name by argument.

```
ruby run.rb glibc.log
MALLOC_ARENA_MAX=2 ruby run.rb glibc-arena-2.log
LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libjemalloc.so.1 ruby run.rb jemalloc-3-6.log
```