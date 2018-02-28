namespace :jp_municipality do
  desc "Load municipalities to db."
  task load_data: :environment do
    JpMunicipality::Municipality.load_data!
  end
end
