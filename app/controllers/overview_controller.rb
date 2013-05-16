class OverviewController < ApplicationController
  def index
    
  end
  
  def update
    Resque.enqueue(UpdateWorker)
    flash[:notice] = "The update has been started."
    redirect_to overview_index_path
  end
end