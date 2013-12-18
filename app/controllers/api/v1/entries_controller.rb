class Api::V1::EntriesController < ApiController
  respond_to :json

  def index
    respond_with current_user.entries
  end

  def show
    respond_with current_user.entry.find(params[:id])
  end

  def create
    return _not_authorized unless signed_in?
    respond_with current_user.entries.create(entry_params)
  end

  private

  def entry_params
    params.require(:entry).permit(:activity_name, :score, :hours, :date)
  end

  def entry_url(entry)
    api_v1_entry_path(entry)
  end
  
end