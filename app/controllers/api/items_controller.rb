class Api::ItemsController < ApiController
  before_action :authenticate

  def create
    @item = Item.new(item_params)

    if @item.save
      render json: @item
    else
      render json: { errors: @item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      render json: @item
    else
      render json: { errors: "Permissions can only be public or private" }
    end
  end

  private

  def item_params
    params.require(:item).permit(:todo)
  end
end
