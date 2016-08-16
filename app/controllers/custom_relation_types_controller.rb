class CustomRelationTypesController < ApplicationController
  before_action :set_relation, only: [:show, :edit, :update, :destroy]

  def new
    @relation = CustomRelationType.new
  end


  def create
    @relation = CustomRelationType.new(custom_relation_type_params)

    respond_to do |format|
      if @relation.save
        format.html { redirect_to '/settings/plugin/custom_issues_relations', notice: 'relation was successfully created.' }
        format.json { render :show, status: :created, location: @relation }
      else
        format.html { render :new }
        format.json { render json: @relation.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit

  end

  def update
    puts params.inspect
    respond_to do |format|
      if @relation.update(custom_relation_type_params)
        format.html { redirect_to '/settings/plugin/custom_issues_relations', notice: 'relation was successfully updated.' }
        format.json { render :show, status: :ok, location: @relation }
      else
        format.html { render :edit }
        format.json { render json: @relation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @relation.destroy
    respond_to do |format|
      format.html { redirect_to '/settings/plugin/custom_issues_relations', notice: 'relation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  private
  # Use callbacks to share common setup or constraints between actions.
  def set_relation
    @relation = CustomRelationType.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def custom_relation_type_params
    params.require(:custom_relation_type).permit(:title, :reverse_id, :order_index)
  end
end