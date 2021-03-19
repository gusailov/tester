module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to "#{repo.capitalize}", "https://github.com/#{author}/#{repo}", target: :blank
  end

  def flash_message
    return unless flash

    flash.map do |type, msg|
      tag.div(msg, class: "flash #{type}")
    end.join.html_safe
  end
end
