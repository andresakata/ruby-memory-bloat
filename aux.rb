require_relative 'fragmentation.rb'
FragmentationCreator.new(file_name: 'glibc.log').execute

require_relative 'fragmentation.rb'
FragmentationCreator.new(file_name: 'jemalloc.log').execute