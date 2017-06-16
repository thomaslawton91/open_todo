class Api::ListsController < ApiController
  before_action :authenticate

  def create
    @list = List.new(list_params)
    @list.user_id = @current_user.id

    if @list.save
      render json: @list
    else
      render json: { errors: @list.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :public)
  end
end
