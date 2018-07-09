module ApplicationHelper
  def full_title page_title = ""
    base_title = t "admin.base_title"
    page_title.empty? ? base_title : page_title + " | " + base_title
  end

  def load_menu
    @menu = Menu.all
  end

  def load_menu_template menus
    html = ""
    menus.each do |menu|
      html << "<div class=\"mm1-com mm1-cour-com mm1-s3\">"
        html << "<h4>#{menu.name}</h4>"
        html << "<ul>"
          menu.dishes.limit(Settings.settings.limit_dish).offset(Settings.settings.offset_dish).each do |dishes|
            html << "<li>"
             html << link_to(dishes.name, dish_path(dishes))
            html << "</li>"
          end
          if menu.dishes.limit(Settings.settings.limit_dish).offset(Settings.settings.offset_dish).length >= Settings.settings.limit_dish
            html << "<li>"
              html << link_to(t("menu.load_more"), menu_path(menu), class: "menu_header")
            html << "</li>"
          end
        html << "</ul>"
      html << "</div>"
    end
    html
  end

  def number_format price
    number_to_currency price, precision: Settings.settings.precision, delimiter: "."
  end

  def gravatar_for_dish dish
    if dish.images.first.nil?
      image_tag Settings.settings.default_image_product,
        alt: dish.name, class: "img-responsive"
    else
      image_tag dish.images.first.image_url, alt: dish.name, class: "img-responsive"
    end
  end
end
