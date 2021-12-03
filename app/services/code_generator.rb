class CodeGenerator < ApplicationService
  def initialize(class_name, column_name, length)
    @class_name = class_name
    @column_name = column_name
    @length = length
  end

  def call
    loop do
      random_code = SecureRandom.alphanumeric(@length)
      break random_code unless @class_name.constantize.exists?(@column_name => random_code)
    end
  end
end
