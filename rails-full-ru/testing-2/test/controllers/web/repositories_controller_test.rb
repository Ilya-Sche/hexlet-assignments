# frozen_string_literal: true

require 'test_helper'

class Web::RepositoriesControllerTest < ActionDispatch::IntegrationTest
  # BEGIN
  test 'should create repository' do
    response_fixture = load_fixture('repositories.yml')

    stub_request(:get, 'https://github.com/').to_return(status: 200, body: response_fixture)
  end
  # END
end
