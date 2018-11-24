module Api
  class CvController < ApplicationController

    def index
      @projects = Project.all
      respond_to do |format|
        format.json {
          render json: @projects
        }
      end
    end
  end
end
