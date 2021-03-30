module ApplicationHelper
    def document_title
        if @title.present?
            "#{@title} - しろくまCanvas"
        else
            "しろくまCanvas"
        end
    end

    
end
