# frozen_string_literal: true

class AdminPolicy
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    req = Rack::Request.new(env)

    if req.path.start_with?('/admin')
      return [403, { 'Content-Type' => 'text/plain' }, []]
    end
      @app.call(env)
    # END
  end
end
