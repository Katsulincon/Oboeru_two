class BlanksController < ApplicationController
  def new
    @blank = Blank.new
    @paragraph = Paragraph.find(params[:paragraph_id])
    authorize @blank
  end

  def create

  end
end
