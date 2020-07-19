require 'sinatra'

get '/' do
  erb :index
end

get '/adm' do
  erb :login
end
post '/adm' do
  @login = params[:login]
  @password = params[:password]
  if @login == 'hd321kbps' && @password == 'admin'
    erb :welcome
  else
    erb :error
  end
end

get '/contacts' do
  @title = 'Контакты'
  @message = 'На этой странице можно свзяаться с автором этого сайта.'
  erb :page
end
get '/faq' do
  @title = 'Чаво'
  @message = 'Часто задаваемые вопросы'
  erb :page
end
get '/about' do
  @title = 'О авторе'
  @message = 'Информация о авторе.'
  erb :page
end