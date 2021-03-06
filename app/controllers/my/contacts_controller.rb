module My
  class ContactsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_contact, only: [:show, :edit, :update, :destroy]

    def index
      @contacts = current_user.contacts
    end

    def show
    end

    def new
      @contact = current_user.contacts.build
    end

    def edit
    end

    def create
      @contact = current_user.contacts.build contact_params

      respond_to do |format|
        if @contact.save
          format.html { redirect_to [:my, @contact], notice: 'Contact was successfully created.' }
          format.json { render :show, status: :created, location: @contact }
        else
          format.html { render :new }
          format.json { render json: @contact.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @contact.update(contact_params)
          format.html { redirect_to [:my, @contact], notice: 'Contact was successfully updated.' }
          format.json { render :show, status: :ok, location: @contact }
        else
          format.html { render :edit }
          format.json { render json: @contact.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @contact.destroy
      respond_to do |format|
        format.html { redirect_to my_contacts_path, notice: 'Contact was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      def set_contact
        @contact = current_user.contacts.find params[:id]
      end

      def contact_params
        params.require(:contact).permit \
          :user_id,
          :first_name,
          :middle_name,
          :last_name,
          :email,
          phone_numbers_attributes: [:number]
      end
  end
end
