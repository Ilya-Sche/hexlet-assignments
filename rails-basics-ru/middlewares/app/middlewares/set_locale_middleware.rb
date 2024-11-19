# frozen_string_literal: true

class SetLocaleMiddleware
  def initialize(app)
    @app = app
  end

  # BEGIN
  def call(env)
    user_locale = find_locale_from_header(env["HTTP_ACCEPT_LANGUAGE"])
    I18n.locale = user_locale if I18n.locale_available? user_locale
    @app.call(env)
  end

  def find_locale_from_header(header)
    return nil if header.nil?
    locale = header&.split(",").first
    return nil if locale.nil?
    locale.to_sym
  end
  # END
end
