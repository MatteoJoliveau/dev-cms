# frozen_string_literal: true

class Admin::AdminsController < Admin::ApplicationController
  before_action :load_admin, only: %i[edit update destroy]
  before_action :check_authentication, only: :update
  before_action :check_confirmation, only: %i[create update]

  def edit
    if himself?
      render locals: {
          page: Administrate::Page::Form.new(dashboard, requested_resource)
      }
    else
      flash[:error] = 'You cannot edit another admin'
      redirect_to admins_path
    end
  end

  def create
    resource = resource_class.new(resource_params)
    authorize_resource(resource)

    if resource.save
      flash[:notice] = translate_with_resource('create.success')
      redirect_to admins_path
    else
      render :new, locals: {
          page: Administrate::Page::Form.new(dashboard, resource)
      }
    end
  end

  def update
    if requested_resource.update(resource_params.reject { |_, v| v.blank? }) && himself?
      flash[:notice] = translate_with_resource('update.success')
      redirect_to admins_path
    else
      flash[:error] = 'You cannot update this admin' unless himself?
      render :edit, locals: {
          page: Administrate::Page::Form.new(dashboard, requested_resource)
      }
    end
  end

  def destroy
    if himself?
      flash[:error] = 'You cannot delete yourself.'
      redirect_to admins_path
    else
      super
    end
  end

  private

  def check_authentication
    password = params.dig(:admin, :current_password)
    return if @admin.authenticated?(password)
    flash[:error] = 'Invalid password'
    redirect_back(fallback_location: :admin_admins_path)
  end

  def check_confirmation
    password, confirmation = params[:admin].values_at(:password, :confirm_password)
    return if password == confirmation
    flash[:error] = "Password confirmation doesn't match Password"
    redirect_back fallback_location: admin_admins_path
  end

  # disable 'show' links
  def valid_action? name, resource = resource_class
    %w[show].exclude?(name.to_s) && super
  end

  def load_admin
    @admin = Admin.find(params[:id])
  end

  def himself?
    @himself ||= current_user == @admin
  end
end
