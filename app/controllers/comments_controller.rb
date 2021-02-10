class CommentsController < ApplicationController
  before_action :set_fishing_area
  before_action :set_comment, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :is_owner_or_admin, only: [:edit, :update, :destroy]


  # GET fishing_area/1/comments
  def index
    @comments = @fishing_area.comments.paginate(page: params[:page], per_page: 5)
  end

  # GET /comments/1 or /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = @fishing_area.comments.build
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments or /comments.json
  def create
    @comment = @fishing_area.comments.build(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to fishing_area_comments_path(@fishing_area), notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to fishing_area_comment_path(@fishing_area), notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to fishing_area_comments_path(@fishing_area), notice: "Comment was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fishing_area
      @fishing_area = FishingArea.find(params[:fishing_area_id])
    end


    def set_comment
      #@comment = Comment.find(params[:id])
      @comment = @fishing_area.comments.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:body, :fishing_area_id)
    end

    def is_owner_or_admin
      unless current_user==@comment.user or current_user.admin?
        redirect_to root_path,  alert: 'Your account does not have access to this page!'
      end
    end
end
