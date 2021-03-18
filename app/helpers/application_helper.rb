module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to "#{repo.capitalize}", "https://github.com/#{author}/#{repo}", target: :blank
  end

  def flash_message(key)
    return unless flash[key]

    tag.p(flash[key], class: "flash #{key}")
  end
end
