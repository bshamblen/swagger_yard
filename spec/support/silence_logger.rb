module SilenceLogger
  def self.included(base)
    base.before do
      @logger = YARD::Logger.instance
      YARD::Logger.send :instance_variable_set, :@logger, stub_everything
    end

    base.after do
      YARD::Logger.send :instance_variable_set, :@logger, @logger
    end
  end
end
