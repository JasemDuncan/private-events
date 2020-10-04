class ApplicationController < ActionController::Base
    before_action :set_categories

    # protected

    # def is_normal_user?
    #     u_signed_in? && current_u.is_normal_user?
    # end
    # def is_editor?
    #     u_signed_in? && current_u.is_editor?
    # end
    # def is_admin?
    #     u_signed_in? && current_u.is_admin?
    # end

    private
    def set_categories
        @categories=Category.all
    end
end
