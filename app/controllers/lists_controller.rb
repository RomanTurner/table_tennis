class ListsController < ApplicationController
  before_action :set_list, only: %i[show edit update destroy]

  # GET /lists or /lists.json
  def index
    @q = List.ransack(params[:q])
    @lists = @q.result
    @pagy, @lists = pagy(@lists)
  end

  # GET /lists/1 or /lists/1.json
  def show
    @q = @list.leads.ransack(params[:q])
    @leads = @q.result
    @pagy, @leads = pagy(@leads)
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # GET /lists/1/edit
  def edit; end

  # POST /lists or /lists.json
  def create
    @list = List.new(list_params)

    respond_to do |format|
      if @list.save
        format.html do
          redirect_to list_url(@list), notice: 'List was successfully created.'
        end
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1 or /lists/1.json
  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html do
          redirect_to list_url(@list), notice: 'List was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  def bulk_update
    @list = List.find(params[:list_id])
    @leads = Lead.find(params[:ids])
    @leads.each { |lead| ListLead.destroy_by(list: @list, lead: lead) }
    flash[:confetti] = 'List was successfully updated.'
    redirect_to list_path(@list)
  end

  # DELETE /lists/1 or /lists/1.json
  def destroy
    @list.destroy

    respond_to do |format|
      format.html do
        redirect_to lists_url, notice: 'List was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_list
    @list = List.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def list_params
    params.require(:list).permit(:title)
  end
end
