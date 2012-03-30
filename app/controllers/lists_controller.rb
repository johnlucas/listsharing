class ListsController < ApplicationController

  # GET /lists
  def index
    @lists = List.order(:votes).reverse

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /lists/1
  def show
    @list = List.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /lists/new
  def new
    @list = List.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /lists/1/edit
  def edit
    @list = List.find(params[:id])
  end

  # POST /lists
  def create
    @list = List.new(params[:list])

    respond_to do |format|
      if @list.save
        format.html { redirect_to @list, notice: 'List was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /lists/1
  def update
    @list = List.find(params[:id])

    respond_to do |format|
      if @list.update_attributes(params[:list])
        format.html { redirect_to @list, notice: 'List was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /lists/1
  def destroy
    @list = List.find(params[:id])
    @list.destroy

    respond_to do |format|
      format.html { redirect_to lists_url }
    end
  end
  
  def voteup
    @list = List.find(params[:id])
    
    if not session[:lists_voted].include? @list.id
      @list.votes += 1
      @list.save
      session[:lists_voted] << @list.id
      flash[:notice] = "Thanks for voting!"
    else
      flash[:alert] = "You have voted this list already!"
    end
    
    respond_to do |format|
      format.html { redirect_to lists_path }
    end
  end
  
  def votedown
    @list = List.find(params[:id])
    
    if not session[:lists_voted].include? @list.id
      @list.votes -= 1
      @list.save
      session[:lists_voted] << @list.id
      flash[:notice] = "Thanks for voting!"
    else
      flash[:alert] = "You have voted this list already!"
    end
    
    respond_to do |format|
      format.html { redirect_to lists_path }
    end
  end
end
