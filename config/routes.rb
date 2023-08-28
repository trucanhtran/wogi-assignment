Rails.application.routes.draw do
  mount Api::Root => '/'
  unless Rails.env.production?
    mount GrapeSwaggerRails::Engine, at: '/docs'
  end
end
