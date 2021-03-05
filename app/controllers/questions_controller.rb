class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
  end

  def show
    render plain: "Question: #{Question.find(params[:id]).inspect}"
  end

  def new
  end

  def create
    question = Question.create(question_params)
    # render plain: "Question created: #{question.inspect}"
    redirect_to test_questions_path(@test)
  end

  def destroy
    # render plain: "Question destroy: #{Question.find(params[:id])} test #{@test} "
    @question = Question.find(params[:id])

    @question.destroy

    redirect_to test_questions_path(@test)
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.permit(:body, :test_id)
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end
end