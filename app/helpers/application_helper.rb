module ApplicationHelper
    def document_title
        if @title.present?
            "#{@title} - ShiroCan"
        else
            "ShiroCan"
        end
    end

    
end
