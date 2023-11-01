# frozen_string_literal: true

class HomeController < ApplicationController
  def index
  end

  def calcule_inss_discount
    CalculateInssDiscountJob.perform_later

    redirect_to root_path, notice: 'Cáclulo de Desconto de INSS solicitado. Aguarde...'
  end
end
