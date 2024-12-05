Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins '*',
      resource '*', 
               headers: :any, 
               methods: [:get, :post, :put, :patch, :delete, :options, :head], # Allow these HTTP methods
               credentials: true 
    end
  end