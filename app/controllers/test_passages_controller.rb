class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show result update]
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

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def validate_answer_ids
    if params[:answer_ids].nil?
      flash.now[:notice] = "You need something to choose"
      render :show
    end
  end
end
