module Admin
  class SeriesController < ApplicationController
    def index
      @series = Serie.all
    end
  
  end
end

