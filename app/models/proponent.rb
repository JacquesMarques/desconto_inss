# frozen_string_literal: true

class Proponent < ApplicationRecord
  belongs_to :address
  accepts_nested_attributes_for :address

  validates :name, :document, :birthday, :salary, :inss_discount, :address, presence: true
end
