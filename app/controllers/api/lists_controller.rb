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

  def update
    @list = List.find(params[:id])
    @list.assign_attributes(list_params)
    if @list.permissions == "public" || @list.permissions == "private"
      @list.update(list_params)
      render json: @list
    else
      render json: { errors: "Permissions can only be public or private" }
    end
  end

  def destroy
    begin
      @list = List.find(params[:id])
      @list.destroy
      render json: {}, status: :no_content
    rescue ActiveRecord::RecordNotFound
      render :json => {}, :status => :not_found
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :permissions)
  end
end
