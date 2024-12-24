class RepositoryLoaderJob < ApplicationJob
  queue_as :default

  def perform(repository)
    url = repository.link

    repo_name = url.split('/').last
    owner_name = url.split('/')[3]


    begin
      repository.start_fetching! if repository.created?

      repository.mark_fetched_updated! if repository.fetched?


      client = Octokit::Client.new
      repo_data = client.repo("#{owner_name}/#{repo_name}")

      repository.update!(
        link: url,
        owner_name: repo_data[:owner][:login],
        repo_name: repo_data[:name],
        description: repo_data[:description],
        default_branch: repo_data[:default_branch],
        watchers_count: repo_data[:watchers_count],
        language: repo_data[:language],
        repo_created_at: repo_data[:created_at],
        repo_updated_at: repo_data[:updated_at]
      )

      repository.mark_fetched!
      
    rescue => e
      Rails.logger.error("Failed to fetch repository: #{e.message}")
      repository.mark_failed
    end
  end
end
