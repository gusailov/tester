module QuestionsHelper
  def question_header(test)
    "#{params[:action]} '#{test.title}' question:"
  end

  def current_year
    Time.now.strftime("%Y")
  end

  def github_url(author, repo)
    "https://github.com/#{author}/#{repo}"
  end
end
