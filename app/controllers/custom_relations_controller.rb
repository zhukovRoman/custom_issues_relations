class CustomRelationsController < ApplicationController
  before_action :set_relation, only: [:destroy]



  def create

    @custom_relation = CustomRelation.new(custom_relation_params)

    saved = @custom_relation.save
    if saved && @custom_relation.custom_relation_type.has_reverse_relation?
      @custom_relation.create_revers_relation
    end
    respond_to do |format|
      if saved
        @issue =  @custom_relation.issue_from
        format.html { redirect_to issue_path(@issue) }
        format.js
        format.json { render :show, status: :created, location: @custom_relation }
      else
        format.html { render :new }
        format.js
        format.json { render json: @relation.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit

  end

  def destroy
    @relation.destroy

    respond_to do |format|
      format.html { redirect_to issue_path(@relation.issue_from) }
      format.js
      format.api  { render_api_ok }
    end
  end



  private
  # Use callbacks to share common setup or constraints between actions.
  def set_relation
    @relation = CustomRelation.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def custom_relation_params
    params.require(:custom_relation).permit(:issue_from_id, :issue_to_id, :custom_relation_type_id)
  end
end