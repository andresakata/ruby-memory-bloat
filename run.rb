require './fragmentation'

file_name = ARGV[0]

conf = {}

unless file_name.nil?
  conf[:file_name] = file_name
end

FragmentationCreator.new(conf).execute