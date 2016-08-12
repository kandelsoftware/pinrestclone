class PinsController < ApplicationController
	before_action :find_pin, only:[:show,:edit,:update,:destroy]

	def index
		@pins=Pin.all.order("Created_at DESC")
	end

  def show
  end

	def new
		@pin=current_user.pins.build
	end
	
	def create
    @pin= current_user.pins.build(pins_params)
    if @pin.save 
    redirect_to @pin, notice: "Successfully Created New Pin"
    else 
    render :new
    end

	end

	def edit	
	end
	def update
		if @pin.update(pins_params)
			redirect_to @pin,notice: "Pin was Successfully update"
		else
			render :edit
		end

	end

	def delete
		@pin.destroy
		respone_to do |format|
		format.html {redirect_to pin_url, notice: 'pin was successfully destroyed.'}
	  end
	end
  


	private 
    
    def pins_params
     params.require(:pin).permit(:title,:description)	
    end

    def find_pin
    	@pin=Pin.find(params[:id])	
    end
end
