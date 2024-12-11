# frozen_string_literal: true

require 'open-uri'

class Hacker
  class << self
    def hack(email, password)
      url = 'https://rails-collective-blog-ru.hexlet.app/users/sign_up'
      
      response = URI.open(url)
      doc = Nokogiri::HTML(response)

      csrf_token = doc.at('input[name="authenticity_token"]')['value']

      cookie_header = response.meta['set-cookie']
      cookie_string = cookie_header.split('; ').first

      post_params = {
        'authenticity_token' => csrf_token,
        'user[email]' => email,
        'user[password]' => password,
        'user[password_confirmation]' => password,
      }

      post_uri = URI.parse('https://rails-collective-blog-ru.hexlet.app/users')
      request = Net::HTTP::Post.new(post_uri)
      request.set_form_data(post_params)
      request['Content-Type'] = 'application/x-www-form-urlencoded;charset=UTF-8'
      request['Cookie'] = cookie_string
      request['X-CSRF-Token'] = csrf_token
      request['User-Agent'] = 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36'
      request['Accept'] = 'text/vnd.turbo-stream.html, text/html, application/xhtml+xml'
      request['Accept-Language'] = 'ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7'
      request['Origin'] = 'https://rails-collective-blog-ru.hexlet.app'
      request['Referer'] = url

    end
  end
end

