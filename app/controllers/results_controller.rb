class ResultsController < ApplicationController
  before_action :set_test_passage, only: %i[show result update]
  before_action :validate_answer_ids, only: %i[update]

  def show
  end

  def result
  end

  def update
    @result.accept!(params[:answer_ids])

    if @result.completed?
      redirect_to result_result_path(@result)
    else
      render :show
    end
  end

  private

  def set_test_passage
    @result = Result.find(params[:id])
  end

  def validate_answer_ids
    if params[:answer_ids].nil?
      flash[:notice] = "You need something to choose"
      render :show
    else
      flash[:notice] = nil
    end
  end
end
