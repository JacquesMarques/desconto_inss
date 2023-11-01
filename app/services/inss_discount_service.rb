# frozen_string_literal: true
class InssDiscountService
  attr_reader :salary

  def initialize(salary)
    @salary = salary.to_f
    @ranges = load_inss_ranges
  end

  def calculate
    calculate_discount.truncate(2)
  end

  private

  def load_inss_ranges
    ranges_file = Rails.root.join('db', 'seeds', 'tabela_descontos_inss.yml')
    YAML.load(File.read(ranges_file))
  end

  def calculate_discount
    discount = 0
    (1..4).each do |range|
      current_range = "faixa_#{range}"
      previous_range = "faixa_#{range - 1}"
      if range < 4 && @salary >= @ranges[current_range]['salario_final']
        discount += ((@ranges[current_range]['salario_final'] - previous_end_salary(previous_range)) *
          (@ranges[current_range]['aliquota'].to_f / 100)).truncate(2)
      else
        discount += ((@salary - @ranges[previous_range]['salario_final']) *
          (@ranges[current_range]['aliquota'].to_f / 100)).truncate(2)
        break
      end
    end
    discount.truncate(2)
  end

  def previous_end_salary(range)
    return 0 if range == 'faixa_0'

    @ranges[range]['salario_final']
  end
end
