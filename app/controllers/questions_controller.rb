class QuestionsController < ApplicationController
  def index
    # render json: { questions: Question.all }
    result = ["Params: #{params.inspect}, test_id: #{params[:test_id]}"]
    render plain: Test.find(params[:test_id]).questions.inspect
  end

  def show
  end
end
