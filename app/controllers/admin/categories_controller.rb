module Admin
  class CategoriesController < ApplicationController
    before_action :find_category, only: %i(destroy update)
    before_action :check_admin, only: %i(destroy update)

    def index
      if current_user.is_admin?
        @categories = Category.order_by_updated_at.paginate page: params[:page]
      else
        flash[:danger] = t ".not_admin"
      end
    end

    def destroy
      if @category && @category.documents.size.zero?
        category_destroy @category
      else
        render json: {success: false, response_text: t(".fail")}
      end
    end

    def update
      if @category && @category.update_attributes(style: params[:style])
        render json: {success: true, response_text: t(".success")}
      else
        render json: {success: false, response_text: t(".fail")}
      end
    end

    private

    def find_category
      @category = Category.find_by id: params[:id]
    end

    def category_destroy category
      return unless category.destroy
      render json: {success: true, response_text: t(".success")}
    end

    def check_admin
      return if current_user.is_admin?
      render json: {success: false, response_text: t(".not_admin")}
    end
  end
end
