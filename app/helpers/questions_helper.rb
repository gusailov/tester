module QuestionsHelper
  def question_header(question)
    action = question.new_record? ? "New" : "Edit"

    "#{action} #{question.test.title} Question"
  end
end
