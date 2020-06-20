class BlanksController < ApplicationController
  def new
    @blank = Blank.new
    @paragraph = Paragraph.find(params[:paragraph_id])
    @letter_array = @paragraph.sentence.split("")
    authorize @blank
  end

  def create

    #single version
    # @blank = Blank.new(blank_params)
    # paragraph = Paragraph.find(params[:paragraph_id])
    # @blank.paragraph = paragraph
    # authorize @blank

    # if @blank.save
    #   redirect_to folder_path(paragraph.folder)
    # else
    #   render 'new'
    # end


    # multiple version
    @paragraph = Paragraph.find(params[:paragraph_id]) #When it renders 'new', it doesn't read new's @paragraph. But I need paragraph in create action anyway.
    @letter_array = @paragraph.sentence.split("") #When it renders 'new', it doesn't read new's @letter_array
    @blank = Blank.new   #When it renders 'new', it doesn't read new's @blank
    authorize @blank

    first_indexis = params[:blank][:first_index] #この状態だとstring
    end_indexis = params[:blank][:end_index] #この状態だとstring
    blanks = []
    first_indexis.each_with_index do |first_index, index|
      #Condition for case that both of first index and end index don't exist
      if first_index != "" && end_indexis[index] != ""
        blanks << Blank.new(first_index: first_index.to_i, end_index: end_indexis[index].to_i)
      end
    end
    #error is happening here
    #Condition if there is now blanks being created.
    if blanks.count == 0
      render 'new'
    else
      blanks.each do |blank|
        blank.paragraph = @paragraph
        authorize blank
        if blank.save
          # redirect_to folder_path(paragraph.folder)
        else
          render 'new'
        end
      # have to think about when they were not successfully saved??
      end
      redirect_to folder_path(@paragraph.folder)
    end
  end

  private
  def blank_params
    params.require(:blank).permit(:first_index, :end_index)

  end
end
