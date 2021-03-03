class QuestionsController < ApplicationController
  def index
    render plain: Test.find(params[:test_id]).questions.inspect
  end

  def show
    render plain: Question.find(params[:id]).inspect
  end

  def create
  end
end
