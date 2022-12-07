class PropertiesController < ApplicationController
  before_action :set_property, only: %i[ show edit update destroy ]

  def index
    @properties = Property.all
  end

  def show
  end

  def new
    @property = Property.new
    2.times{@property.nearests.build}
  end

  def edit
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      redirect_to properties_path notice: "投稿作成しました！"
    else
      render :new
    end
  end

  def update
    if @property.update(property_params)
      redirect_to properties_path notice: "編集しました！"
    else
      render :edit
    end
  end

  # DELETE /properties/1 or /properties/1.json
  def destroy
    @property.destroy
    redirect_to properties_path notice:"削除しました！"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def property_params
      params.require(:property).permit(:name, :rent, :address, :age, :remarks,nearests_attributes:[:id,:route,:station,:walk])
    end
end
