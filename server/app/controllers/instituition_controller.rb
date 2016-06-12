class InstituitionController < ApplicationController
    def index
        @instituitions = Instituition.all
    end
    def show
        @instituition = Instituition.find_by_id(params[:id])
    end
    def new
       @instituition = Instituition.new 
    end
    def create
        @instituition = Instituition.new(instituition_params)
        @instituition.access_token = false
        if @instituition.save
            redirect_to all_instituitions_path
        end
    end
    private
    def instituition_params
        params.require(:instituition).permit(:name, :description)
    end
end
