class ElephantidaesController < ApplicationController
    def index 
        elephantidaes = Elephantidae.all
        render json: elephantidaes
    end

    def show
        elephantidae = Elephantidae.find(params[:id])
        render json: elephantidae
    end

    def create
        elephantidae = Elephantidae.create(elephantidae_params)
        if elephantidae.valid?
            render json: elephantidae
        else
            render json: elephantidae.errors
        end
    end

    def update
        elephantidae = Elephantidae.find(params[:id])
        elephantidae.update(elephantidae_params)
        if elephantidae.valid?
            render json: elephantidae
        else
            render json: elephantidae.errors
        end
    end

    def destroy
        elephantidae = Elephantidae.find(params[:id])
        if elephantidae.destroy
            render json: elephantidae
        else
            render json: elephantidae.errors
        end
    end

    private
    def elephantidae_params
        params.require(:elephantidae).permit(:common_name, :scientific_binomial)
    end
end