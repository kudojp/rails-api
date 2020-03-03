class V1::ContactsController < ApplicationController
    def index
        @contacts = Contact.all
        
        render json: @contacts, status: :ok
    end

    def create
        @contact = Contact.new(contact_params)
        @contact.save

        @contact.save
        render json: @contact, status: :created
    end

    def destroy
        @contact = Contact.where(id: params[:id]).first
        if @contact.destroy
            head(:ok)
        else
            head(:umprocessable_entity)
        end
    end


    private

    def contact_params
        params.require(:Contact).permit(:first_name, :last_name, :email)
    end
end
