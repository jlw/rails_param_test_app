class BarsController < ApplicationController
  def index; end

  def search
    @foo = search_params[:foo]
    @user_id = search_params[:user_id]

    respond_to do |format|
      format.html
      format.json { render json: { search_params: search_params } }
    end
  end

  private

  def search_params
    param! :foo, String, transform: :presence
    param! :user_id, Integer, transform: :presence

    params.permit(:foo, :user_id)
  end
end
