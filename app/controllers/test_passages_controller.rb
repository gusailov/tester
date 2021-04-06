class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show result update gist]
  before_action :validate_answer_ids, only: %i[update]

  def show
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def result
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call

    if result.html_url?
      flash_options = { notice: t('.success', link: result.html_url) }
      gist_params = { question_id: @test_passage.current_question.id,
                      gist_url: result.html_url,
                      user: current_user.email }
      Gist.create(gist_params)
    else
      flash_options = { alert: t('.failure') }
    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def validate_answer_ids
    if params[:answer_ids].nil?
      flash.now[:notice] = t('.validate')
      render :show
    end
  end
end
