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
    question = Question.create(body: params[:body], test_id: params[:test_id])
    render plain: question.inspect
  end
end
