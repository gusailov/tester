module QuestionsHelper
  def question_header(question)
    "#{params[:action]} '#{question.test.title}' question:"
  end
end
