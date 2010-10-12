class PageController < ApplicationController
    
    def show
      page_name = (params[:page] || 'home').gsub(/\s|-/, "_").downcase
      begin
        render :controller => "page", :action => page_name
      rescue ActionView::MissingTemplate 
        render :controller => "page", :action => 'missing_page'
      end
    end
      
end
