module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to "Tester |", "https://github.com/#{author}/#{repo}", target: :blank
  end
end
