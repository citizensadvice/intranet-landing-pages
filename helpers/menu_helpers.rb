module MenuHelpers
    def menu_items(show_on_page)
        data.menu.select do |item| 
            item.show_on.include?(show_on_page)
        end
    end
end