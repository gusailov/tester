class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render inline: 'Questions of test <%= @test.title %> :
      <ul>  <% @test.questions.map do |question| %>
        <li><%= question.body %></li>
        <% end %>
      </ul>'
  end

  def show
    render plain: "Question: #{Question.find(params[:id]).inspect}"
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

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end
end
