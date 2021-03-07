class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create destroy new]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
  end

  def show
    render plain: "Question: #{Question.find(params[:id]).inspect}"
  end

  def new
    @question = Question.new
  end

  def create
    Question.create(question_params)
    redirect_to test_path(@test)
  end

  def destroy
    @question = Question.find(params[:id])

    @question.destroy

    redirect_to test_questions_path(@test)
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body, :test_id)
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end
end
