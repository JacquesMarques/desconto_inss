# frozen_string_literal: true

class Address < ApplicationRecord
  validates :street, :number, :city, :state, presence: true
end
