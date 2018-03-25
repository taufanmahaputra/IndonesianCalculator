class CalculatorsController < ApplicationController
	before_action :split_text, only: [:create]
	
	def index
	end

	def create
		fill_stack

		operate!

		convert_result_to_string
		
		render plain: @result
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

	def string_to_number number, buffer_text
		@buffer_number = 0
		while (!buffer_text.empty?) do
			convert_to_number buffer_text.pop
		end
		@number << @buffer_number
	end

	def convert_to_number number_string
		case number_string
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
