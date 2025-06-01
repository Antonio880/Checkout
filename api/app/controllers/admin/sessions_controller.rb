# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  # layout 'admin'

  # Garante que as views use o escopo correto
  helper_method :resource_name, :resource, :devise_mapping

  def resource_name
    :admin_user
  end

  def resource
    @resource ||= AdminUser.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:admin_user]
  end

  protected

  def after_sign_in_path_for(resource)
    admin_courses_path
  end
end
