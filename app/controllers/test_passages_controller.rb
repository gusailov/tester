class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show result update gist]
  before_action :validate_answer_ids, only: %i[update]
  before_action :reward_check, only: %i[result]

  def show
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      if @test_passage.success?
        @test_passage.update(success: true)
        @rewards = RewardService.new(@test_passage).get_rewards
        if @rewards.present?
          current_user.rewards.push(@rewards)

          flash[:notice] = t('.get_reward')
        end
      end
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def result
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question)
    response = result.call

    if result.status_success?
      current_user.gists.create(gist_url: response.html_url,
                                question: @test_passage.current_question)

      flash[:notice] = t('.success', link: response.html_url)
    else
      flash[:alert] = t('.failure')
    end

    redirect_to @test_passage
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
