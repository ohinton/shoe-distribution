require("bundler/setup")

Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file}

get '/' do
  @stores = Store.all
  @brands = Brand.all
  erb(:index)
end

post '/stores/new' do
  new_store = Store.new({:name => params[:store_name]})
  if new_store.save
    redirect to "/stores/#{new_store.id}"
  else
    redirect '/'
  end
end

get '/stores/:id' do
  @store = Store.find(params.fetch('id').to_i())
  @stores = Store.all
  @brands = Brand.all
  erb(:store_info)
end


post '/brands/new' do
  new_brand = Brand.new({:name => params[:brand_name]})
  if new_brand.save
    redirect to "/brands/#{new_brand.id}"
  else
    redirect '/'
  end
end

get '/brands/:id' do
  @brand = Brand.find(params.fetch('id').to_i())
  @brands = Brand.all
  @stores = Store.all
  erb(:brand_info)
end
