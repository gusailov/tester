module QuestionsHelper
  def question_header(question)
    action = question.new_record? ? t("new") : t("edit")

    "#{action} #{Question.model_name.human} #{question.test.title} "
  end
end
