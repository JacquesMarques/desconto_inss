# frozen_string_literal: true

class CalculateInssDiscountJob < ApplicationJob
  queue_as :default

  def perform
    proponents = Proponent.all
    proponents.each do |proponent|
      discount = InssDiscountService.new(proponent.salary).calculate
      proponent.inss_discount = discount
      proponent.save!
    end
  end
end
