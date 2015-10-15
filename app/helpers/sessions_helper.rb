module SessionsHelper

  def log_in(funcionario)
    session[:funcionario_id] = funcionario.id
  end

  def current_funcionario
    @current_funcionario ||= Funcionario.find_by(idFuncionario: session[:funcionario_id])
  end

  def logged_in?
    !current_funcionario.nil?
  end

  def log_out
    session.delete(:funcionario_id)
    @current_funcionario = nil
  end

end
