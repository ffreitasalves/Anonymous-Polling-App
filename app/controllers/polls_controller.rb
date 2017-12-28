class PollsController < ApplicationController
  def index
    @polls = Poll.all
  end

  def new
    @poll = Poll.new
    @poll.vote_options.build
  end

  def create
    @poll = Poll.new(poll_params)
    if @poll.save
      flash[:success] = 'Poll was created!'
      redirect_to polls_path
    else
      redirect_to new_poll_path
    end
  end

  private

  def poll_params
    params.require(:poll).permit(:topic, vote_options_attributes: [:id, :title, :_destroy])
  end
end