class CalculatorsController < ApplicationController
	before_action :split_text, only: [:create]
	
	def index
	end

	def create
		fill_stack

		operate!

		convert_result_to_string

		if (@result >= 20)
			temp = @string_result.split(' ')

			@test_str = ""
			temp.reverse_each {|text| @test_str += " " + text}
		else
			@test_str = @string_result
		end

		@test_str = params[:perhitungan] + " adalah" + @test_str
	end

	private

	@buffer_number

	def fill_stack
		buffer_text = Queue.new
		@number = []
		@operator = []

		@texts.each do |text|
			if (!operator? text)
				buffer_text << (text)
			else
				@operator << (text)
				string_to_number @number, buffer_text
			end
		end

		string_to_number @number, buffer_text
	end

	def operate!
		operator = @operator.pop
		num_sec = @number.pop
		num_first = @number.pop

		case operator
		when "tambah"
			@result = num_first + num_sec
		when "kurang"
			@result = num_first - num_sec
		when "kali"
			@result = num_first * num_sec
		when "bagi"
			@result = num_first / num_sec
		when "pangkat"
			@result = num_first ** num_sec
		end
	end

	def convert_result_to_string
		@string_result = ""
		interval = 1

		result = @result
		while result > 0 do
			num = result % 10

			convert_to_string num
			
			if (result > 20)
				add_interval interval
			elsif (result > 10 && result < 20)
				@string_result += " belas"
				result = 0
			elsif (result.equal? 10)
				@string_result += " sepuluh"
				result = 0
			end
				

			interval += 1
			result /= 10
		end
	end

	def string_to_number number, buffer_text
		@buffer_number = 0
		while (!buffer_text.empty?) do
			convert_to_number buffer_text.pop
		end
		@number << @buffer_number
	end

	def add_interval interval
		@string_result += " "

		case interval
		when 1
			@string_result += "puluh"
		when 2
			@string_result += "ratus"
		when 3
			@string_result += "ribu"
		end
	end

	def convert_to_number number_string
		case number_string
		when "nol"
			@buffer_number += 0
		when "satu"
			@buffer_number += 1
		when "dua"
			@buffer_number += 2
		when "tiga"
			@buffer_number += 3
		when "empat"
			@buffer_number += 4
		when "lima"
			@buffer_number += 5
		when "enam"
			@buffer_number += 6
		when "tujuh"
			@buffer_number += 7
		when "delapan"
			@buffer_number += 8
		when "sembilan"
			@buffer_number += 9
		when "sepuluh"
			@buffer_number += 10
		when "sebelas"
			@buffer_number += 11
		when "belas"
			@buffer_number += 10
		when "puluh"
			@buffer_number *= 10
		when "ratus"
			@buffer_number *= 100
		when "ribu"
			@buffer_number *= 1000
		end		
	end

	def convert_to_string number
		@string_result += " "
		case number
		when 1
			@string_result += "satu"
		when 2
			@string_result += "dua"
		when 3
			@string_result += "tiga"
		when 4
			@string_result += "empat"
		when 5
			@string_result += "lima"
		when 6
			@string_result += "enam"
		when 7
			@string_result += "tujuh"
		when 8
			@string_result += "delapan"
		when 9
			@string_result += "sembilan"
		when 10
			@string_result += "sepuluh"
		when 11
			@string_result += "sebelas"
		end		
	end

	def split_text
		@texts = params[:perhitungan].split(' ')
	end

	def operator? str
		operators = ['tambah', 'kurang', 'kali', 'bagi', 'pangkat']
		operators.include? str
	end
end
