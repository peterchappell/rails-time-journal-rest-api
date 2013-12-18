class Api::V1::EntriesController < ApiController
  respond_to :json

  def index
    respond_with current_user.entries
  end

  def show
    respond_with current_user.entry.find(params[:id])
  end

  private

  def entry_params
    params.require(:entry).permit(:name)
  end
end