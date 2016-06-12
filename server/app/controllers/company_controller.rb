class CompanyController < ApplicationController
    def new
       @company = Company.new 
    end
    def create
        @company = Company.new(company_params)
        access_token = Array.new(60){rand(36).to_s(36)}.join
        while (Company.find_by_access_token (access_token) != nil)
            access_token = Array.new(60){rand(36).to_s(36)}.join
        end
        @company.access_token = access_token
        if @company.save
            redirect_to new_company_path
        else
            redirect_to root_path
        end
    end
    private
    def company_params
        params.require(:company).permit(:name)
    end
end
