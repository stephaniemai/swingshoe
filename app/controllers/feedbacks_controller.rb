class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    if @feedback.valid?
      @feedback.save
      flash[:notice] = "Thank you for your message! We'll come back to you very soon 🙂"
      redirect_to shoes_path
    else
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:name, :email, :feedback)
  end
end
