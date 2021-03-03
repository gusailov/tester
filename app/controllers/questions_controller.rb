class QuestionsController < ApplicationController
  before_action :find_test

  def index
    render plain: "Questions: #{@test.questions.inspect} of test: #{@test}"
  end

  def show
    render plain: "Questions: #{Question.find(params[:id]).inspect}"
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

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.permit(:body, :test_id)
  end
end
