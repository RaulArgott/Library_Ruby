class PenaltiesController < ApplicationController
  def index
    @penalties = Penalty.all
  end
end
