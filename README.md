# Trabalho de Desenvolvimento de Software 2 #

**Período:** 2015.1

**Grupo:** 3

**Tema do projeto:** Restaurante

-----

## Componentes: ##

* Caique

* Cláudio

* Ícaro

* Florêncio

* Francisco

* Renato



## Especificações: ##

* Ruby on Rails

* MySQL

* Web



-----
**Ruby:** [https://www.ruby-lang.org/pt/downloads/](https://www.ruby-lang.org/pt/downloads/)

**Rails:** [http://www.rubyonrails.com.br/down](http://www.rubyonrails.com.br/down)
 
```
#!shell

sudo apt-get install ruby-full libmysqlclient-dev nodejs
gem install rails
cd /diretório/do/projeto
git clone https://>>>>seu_usuário<<<<@bitbucket.org/Ds2G3/restaurante-g3.git
cd ./restaurante-g3
rails server
```

-----
## Configurações do Banco de Dados ##

**Local do arquivo:**  /diretório/do/projeto/restaurante-g3/config/database.yml

**Nome:** br.com.ds2.restaurante 

**Usuário:** root

**Senha:** 

**Host:** bd.ds2.com.br

### Alterando Host ###

```
#!shell
sudo nano /etc/hosts
```
Altere a linha: 
```
#!text
127.0.0.1           localhost
```
Para:
```
#!text
127.0.0.1           localhost             bd.ds2.com.br
```