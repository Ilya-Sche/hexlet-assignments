# frozen_string_literal: true

class ExecutionTimer
  def initialize(app)
    @app = app
  end

  def call(env)
    start_time = Time.now
    status, headers, response = @app.call(env)
    elapsed_time = (Time.now - start_time) * 1_000_000
    body = response.join
    new_body = "#{body}\nExecution Time : #{elapsed_time.round} microseconds"
    [status, headers, [new_body]]
  end
end
