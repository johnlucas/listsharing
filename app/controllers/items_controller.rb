class ItemsController < ApplicationController
  # GET /items
  # GET /items.json
  def index
    @list = List.find(params[:list_id])
    @items = @list.items.order(:votes).reverse
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])
    @list = List.find(params[:list_id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/new
  # GET /items/new.json
  def new
    @item = Item.new
    @list = List.find(params[:list_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
    @list = List.find(params[:list_id])
  end

  # POST /items
  # POST /items.json
  def create
    @list = List.find(params[:list_id])
    @item = Item.new(params[:item])
    @item.list = @list

    respond_to do |format|
      if @item.save
        format.html { redirect_to list_items_path(@list), notice: 'Item was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.json
  def update
    @item = Item.find(params[:id])
    @list = List.find(params[:list_id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to list_items_path(@list), notice: 'Item was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item = Item.find(params[:id])
    @list = List.find(params[:list_id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to list_items_url }
    end
  end
end
