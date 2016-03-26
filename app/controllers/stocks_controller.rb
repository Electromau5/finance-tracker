class StocksController < ApplicationController

def search
	if params[:stock]
		@stock = Stock.ticker_find_by(params[:stock])
		@stock = Stock.new_from_lookup(params[:stock])
	end

	if @stock
		#render json: @stock
		render partial: 'lookup'
	else
		render status: :not_found, nothing: true
	end
end

end