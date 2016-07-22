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
