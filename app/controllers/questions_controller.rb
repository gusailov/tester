class QuestionsController < ApplicationController
  def index
    render plain: Test.find(params[:test_id]).questions.inspect
  end

  def show
    render plain: "Question show: #{Question.find(params[:id]).inspect}"
  end

  def new
  end

  def create
    question = Question.create(question_params)
    render plain: "Question created: #{question.inspect}"
  end

  def destroy
    render plain: "Question deleted: #{Question.find(params[:question_id]).inspect}"
    Question.delete(params[:question_id])
  end

  private

  def question_params
    params.permit(:body, :test_id)
  end
end
