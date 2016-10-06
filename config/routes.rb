Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "xml_converter#home"
  get "index" => "xml_converter#index", :defaults => { :format => 'xml' }
end
