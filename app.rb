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

delete('/stores/:id') do
  @store = Store.find(params.fetch('id').to_i())
  @store.destroy()
  @stores = Store.all
  @brands = Brand.all()
  erb(:index)
end

get '/stores/:id/edit' do
  @store = Store.find(params.fetch('id').to_i())
  erb(:store_edit)
end

patch '/stores/:id/edit' do
  store = Store.find(params.fetch('id').to_i())
  store_name = params[:store_name]
  store.update({:name => store_name})
  redirect to "/stores/#{store.id}"
end

patch '/stores/:id/brands' do
  store = Store.find(params.fetch('id').to_i())
  new_brand = Brand.find(params[:brand])
  store.brands.push(new_brand)
  redirect to "/stores/#{store.id}"
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

delete('/brands/:id') do
  @brand = Brand.find(params.fetch('id').to_i())
  @brand.destroy()
  @brands = Brand.all
  @stores = Store.all()
  erb(:index)
end

get '/brands/:id/edit' do
  @brand = Brand.find(params.fetch('id').to_i())
  erb(:brand_edit)
end

patch '/brands/:id/edit' do
  brand = Brand.find(params.fetch('id').to_i())
  brand_name = params[:brand_name]
  brand.update({:name => brand_name})
  redirect redirect to "/brands/#{brand.id}"
end
