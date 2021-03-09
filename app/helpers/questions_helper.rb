module QuestionsHelper
  def question_header(test)
    "#{params[:action]} '#{test.title}' question:"
  end
end
