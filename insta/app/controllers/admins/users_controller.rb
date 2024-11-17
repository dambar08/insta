# frozen_string_literal: true

module Admins
  class UsersController < ManagementController
    before_action :set_admins_user, only: [:show, :edit, :update, :destroy]

    # GET /admins/users or /admins/users.json
    def index
      @users = User.page(params[:page]).per(params[:per])
    end

    # GET /admins/users/1 or /admins/users/1.json
    def show
    end

    # GET /admins/users/new
    def new
      @user = User.new
    end

    # GET /admins/users/1/edit
    def edit
    end

    # POST /admins/users or /admins/users.json
    def create
      @user = User.new(admins_user_params)

      respond_to do |format|
        if @user.save
          format.html { redirect_to(admins_user_url(@user), notice: "User was successfully created.") }
          format.json { render(:show, status: :created, location: @user) }
        else
          format.html { render(:new, status: :unprocessable_entity) }
          format.json { render(json: @user.errors, status: :unprocessable_entity) }
        end
      end
    end

    # PATCH/PUT /admins/users/1 or /admins/users/1.json
    def update
      respond_to do |format|
        if @user.update(admins_user_params)
          format.html { redirect_to(admins_user_url(@user), notice: "User was successfully updated.") }
          format.json { render(:show, status: :ok, location: @user) }
        else
          format.html { render(:edit, status: :unprocessable_entity) }
          format.json { render(json: @user.errors, status: :unprocessable_entity) }
        end
      end
    end

    # DELETE /admins/users/1 or /admins/users/1.json
    def destroy
      @user.destroy

      respond_to do |format|
        format.html { redirect_to(admins_users_url, notice: "User was successfully destroyed.") }
        format.json { head(:no_content) }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_admins_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admins_user_params
      params.fetch(:user, {})
    end
  end
end
