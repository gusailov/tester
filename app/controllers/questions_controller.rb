class QuestionsController < ApplicationController
  def index
    render plain: Test.find(params[:test_id]).questions.inspect
  end

  def show
    render plain: Question.find(params[:id]).inspect
  end

  def new
  end

  def create
    question = Question.create(question_params)
    render plain: question.inspect
  end

  private

  def question_params
    params.permit(:body, :test_id)
  end
end
