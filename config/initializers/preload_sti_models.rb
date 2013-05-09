
# add config/initializers/preload_sti_models.rb:

if Rails.env.development?
  %w[status Editing_status Encoded_status Ingested_status PreComments_status QA_status Web_status].each do |c|
    require_dependency File.join("app","models","#{c}.rb")
  end
end