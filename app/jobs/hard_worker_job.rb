class HardWorkerJob
  include Sidekiq::Job

  def perform(*args)
    puts "Executando HardWorker com argumentos: #{args.inspect}"
    sleep 1
    puts "HardWorker finalizado!"
  end
end