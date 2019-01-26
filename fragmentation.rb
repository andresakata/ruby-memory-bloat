require 'concurrent'
require 'get_process_mem'
require 'logger'

class FragmentationCreator
  def initialize(file_name: 'memory.log', threads: 30, jobs: 10000, array_size: 1024)
    @threads = threads
    @jobs = jobs
    @array_size = array_size
    @mem = GetProcessMem.new
    file = File.open(file_name, File::WRONLY | File::APPEND | File::CREAT)
    @logger = Logger.new(file)
  end

  def execute
    GC.start
    start_time = Time.now
    pool = Concurrent::FixedThreadPool.new(@threads)
    (1..@jobs).each do |index|
      pool.post { thread_process(index % 25 == 0) }
    end
    pool.shutdown
    pool.wait_for_termination
    @logger.info(Time.now - start_time)
  end

  def thread_process(big_array)
    array_size = big_array ? @array_size * 150 : @array_size
    array = Array.new(array_size) { 'a' * 1024 }
    # sleep(rand(0.1..0.5))
    @logger.info(@mem.mb.to_s)
    print(big_array ? 'x' : '.')
  end
end