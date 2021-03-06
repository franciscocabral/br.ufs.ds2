class SessionsController < ApplicationController
  layout "login"
  def new
  end

  def create
    func = Funcionario.find_by(login: params[:session][:login])
    if func && func.authenticate(params[:session][:password])
      #then
      log_in func
      redirect_to func
    else
      #Erro
      flash.now[:danger] = 'Email/Senha Invalidos'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
