module ApplicationHelper
	# níveis de privilegio:
	# 0: gerente, 1: garçon, 2: conzinheiro, 3: todos
	
	def satisfaz_privilegio?(necessario)
		return false if(not logged_in?)
		privilegio = current_funcionario.nivelAcesso + 1
		return (privilegio == 3 or (privilegio & necessario) != 0)
	end
	
	def redirecionar_privilegio(necessario)
	  if(not logged_in?)
	    redirect_to login_path
	  else
		if(not satisfaz_privilegio?(necessario))
			redirect_to current_funcionario, notice: 'Você não pode acessar este conteúdo. Contacte um gerente para isto.'
		end
	  end
	end
end
