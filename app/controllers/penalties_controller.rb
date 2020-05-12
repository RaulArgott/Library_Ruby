class PenaltiesController < ApplicationController

  def index
    if current_user.admin
      @penalties = Penalty.all
    else
      @penalties = current_user.penalties
    end
  end
  def show
    @penalty = Penalty.find(params[:id])
  end
  def pay
    penalty = Penalty.find(params[:id])
    penalty.paid = true
    penalty.save
    redirect_to penalty_path(penalty)
  end
end
