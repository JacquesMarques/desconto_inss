# frozen_string_literal: true

class QuantityByRangeService
  def initialize
    @ranges = load_inss_ranges
  end

  def ranges
    ranges = []
    (1..4).each do |range|
      range_name = "faixa_#{range}"
      salario_inicial = @ranges[range_name]['salario_inicial']
      salario_final = @ranges[range_name]['salario_final']
      where_clause = "salary >= #{salario_inicial} and salary <= #{salario_final}"

      count = Proponent.where(where_clause).count
      ranges[range - 1] = [salario_inicial, salario_final, count]
    end

    ranges
  end

  private

  def load_inss_ranges
    ranges_file = Rails.root.join('db', 'seeds', 'tabela_descontos_inss.yml')
    YAML.load(File.read(ranges_file))
  end
end
