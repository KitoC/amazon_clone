class StoresController < ApplicationController
  before_action :set_store, only: [:show, :edit, :update, :destroy]

   def index
     if params[:address] != nil
       @stores = Store.near(params[:address], 50, order: 'distance')
       @current_loc = params[:address]
       @nearest_me = @stores[0]
     else
       @stores = Store.all
     end
     rescue
       flash[:notice] = "Sorry couldn't find a store near you."
       redirect_to(:action => 'index') 
   end

   def show
   end

   def search

   end

   def edit
   end

   def update
     respond_to do |format|
       if @store.update(store_params)
         format.html { redirect_to @store, notice: 'Contact was successfully updated.' }
         format.json { render :show, status: :ok, location: @store }
       else
         format.html { render :edit }
         format.json { render json: @store.errors, status: :unprocessable_entity }
       end
     end
   end

   private

   def set_store
     @store = Store.find(params[:id])
   end

   def store_params
     params.require(:store).permit(:name)
   end

end
