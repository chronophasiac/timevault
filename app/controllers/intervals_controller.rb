class IntervalsController < ApplicationController
  def index
    @intervals = Interval.all
  end

  def show
    @interval = Interval.find(params[:id])
  end
end
