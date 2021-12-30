class ListLeadsController < ApplicationController
  before_action :set_list, only: %i[create ]

  def create
    @list.lead_ids = [@list.lead_ids + params[:ids].map(&:to_i)].flatten.uniq
    redirect_to list_path(@list)
  end
  
  private

  def set_list
    @list = List.find(params[:id])
  end
end
