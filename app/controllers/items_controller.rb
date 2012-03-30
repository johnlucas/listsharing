class ItemsController < ApplicationController
  
  # GET /items
  def index
    @list = List.find(params[:list_id])
    @items = @list.items.order(:votes).reverse
    
    @breadcrumbs[0] = {'name' => "Lists", 'url' => "/" }  
    @breadcrumbs << {'name' => @list.name, 'last_child' => true}
    
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /items/1
  def show
    @item = Item.find(params[:id])
    @list = List.find(params[:list_id])

    @breadcrumbs[0] = {'name' => "Lists", 'url' => "/" }
    @breadcrumbs << {'name' => @list.name, 'url' => list_items_path(@list) }
    @breadcrumbs << {'name' => @item.name, 'last_child' => true}
    
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /items/new
  def new
    @item = Item.new
    @list = List.find(params[:list_id])

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
    @list = List.find(params[:list_id])
    
    @breadcrumbs[0] = {'name' => "Lists", 'url' => "/" }
    @breadcrumbs << {'name' => @list.name, 'url' => list_items_path(@list) }
    @breadcrumbs << {'name' => @item.name, 'url' => list_item_path(@list,@item)}    
    @breadcrumbs << {'name' => 'Edit', 'last_child' => true}    
  end

  # POST /items
  def create
    @list = List.find(params[:list_id])
    @item = Item.new(params[:item])
    @item.list = @list

    respond_to do |format|
      if @item.save
        format.html { redirect_to list_item_path(@list,@item), notice: 'Item was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /items/1
  def update
    @item = Item.find(params[:id])
    @list = List.find(params[:list_id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to list_item_path(@list,@item), notice: 'Item was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /items/1
  def destroy
    @item = Item.find(params[:id])
    @list = List.find(params[:list_id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to list_items_url }
    end
  end
  
  def voteup
    @item = Item.find(params[:id])
    @list = List.find(params[:list_id])
    
    if not session[:items_voted].include? @item.id
      @item.votes += 1
      @item.save
      session[:items_voted] << @item.id
      flash[:notice] = "Thanks for voting!"
    else
      flash[:alert] = "You have voted this item already!"
    end
    
    respond_to do |format|
      format.html { redirect_to list_items_path(@list) }
    end
  end
  
  def votedown
    @item = Item.find(params[:id])
    @list = List.find(params[:list_id])
    
    if not session[:items_voted].include? @item.id
      @item.votes -= 1
      @item.save
      session[:items_voted] << @item.id 
      flash[:notice] = "Thanks for voting!"
    else
      flash[:alert] = "You have voted this item already!"
    end
        
    respond_to do |format|
      format.html { redirect_to list_items_path(@list) }
    end
  end
  
end
