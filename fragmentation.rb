require 'concurrent'
require 'newrelic_rpm'
require 'logger'

class FragmentationCreator
  def initialize(file_name: 'memory.log', threads: 25, jobs: 5000, array_size: 1024)
    @threads = threads
    @jobs = jobs
    @array_size = array_size
    file = File.open(file_name, File::WRONLY | File::APPEND | File::CREAT)
    @logger = Logger.new(file)
  end

  def execute
    GC.start
    pool = Concurrent::FixedThreadPool.new(@threads)
    (1..@jobs).each do |index|
      pool.post { thread_process(index % 25 == 0) }
    end
    pool.shutdown
    pool.wait_for_termination
  end

  def thread_process(big_array)
    array_size = big_array ? @array_size * 100 : @array_size
    array = Array.new(array_size) { 'a' * 1024 }
    sleep(rand(0.1..0.5))
    @logger.info(current_memory_usage.to_s)
    print(big_array ? 'x' : '.')
  end

  def current_memory_usage
    NewRelic::Agent::Samplers::MemorySampler.new.sampler.get_sample
  end
end
