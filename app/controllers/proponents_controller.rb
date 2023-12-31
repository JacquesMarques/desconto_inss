# frozen_string_literal: true

class ProponentsController < ApplicationController
  before_action :set_proponent, only: %i[show edit update destroy]

  # GET /proponents or /proponents.json
  def index
    @proponents = Proponent.page(params[:page]).per(5)
  end

  # GET /proponents/1 or /proponents/1.json
  def show; end

  # GET /proponents/new
  def new
    @proponent = Proponent.new
    @proponent.build_address
  end

  # GET /proponents/1/edit
  def edit; end

  # POST /proponents or /proponents.json
  def create
    @proponent = Proponent.new(proponent_params)

    respond_to do |format|
      if @proponent.save
        format.html { redirect_to proponent_url(@proponent), notice: 'Proponente foi criado com sucesso.' }
        format.json { render :show, status: :created, location: @proponent }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @proponent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proponents/1 or /proponents/1.json
  def update
    respond_to do |format|
      if @proponent.update(proponent_params)
        format.html { redirect_to proponent_url(@proponent), notice: 'Proponente foi atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @proponent }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @proponent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proponents/1 or /proponents/1.json
  def destroy
    @proponent.destroy

    respond_to do |format|
      format.html { redirect_to proponents_url, notice: 'Proponente foi excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  def inss_discount
    inss_discount = InssDiscountService.new(params[:salary]).calculate
    respond_to do |format|
      format.json { render json: { discount: inss_discount } }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_proponent
    @proponent = Proponent.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def proponent_params
    params.require(:proponent).permit(:name, :document, :birthday, :address_id, :personal_phone,
                                      :references_phone, :salary, :inss_discount,
                                      address_attributes: [Address.column_names - %w[created_at updated_at]])
  end
end
