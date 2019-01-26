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

## Benchmark

```
ruby run.rb log/glibc-arena-default.log
MALLOC_ARENA_MAX=2 ruby run.rb log/glibc-2-23-arena-2.log
MALLOC_ARENA_MAX=4 ruby run.rb log/glibc-2-23-arena-4.log
LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libjemalloc.so.1 ruby run.rb log/jemalloc-3-6.log
LD_PRELOAD=/home/linuxbrew/.linuxbrew/Cellar/jemalloc/5.1.0/lib/libjemalloc.so ruby run.rb log/jemalloc-5-1-arena-default.log
LD_PRELOAD=/home/linuxbrew/.linuxbrew/Cellar/jemalloc/5.1.0/lib/libjemalloc.so MALLOC_CONF=narenas:2 ruby run.rb log/jemalloc-5-1-arena-2.log
LD_PRELOAD=/home/linuxbrew/.linuxbrew/Cellar/jemalloc/5.1.0/lib/libjemalloc.so MALLOC_CONF=narenas:4 ruby run.rb log/jemalloc-5-1-arena-4.log
LD_PRELOAD=/usr/lib/libtcmalloc_minimal.so.4.2.6 ruby run.rb log/tcmalloc.log
```