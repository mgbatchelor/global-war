module ApplicationHelper

  def ng_controller_name
    self.controller.class.name.gsub!("Controller", "Ctrl")
  end

end
