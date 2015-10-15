# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150422121333) do

  create_table "comanda", id: false, force: :cascade do |t|
    t.integer  "idcomanda",        limit: 4,  null: false
    t.integer  "idFuncionario",    limit: 4,  null: false
    t.integer  "mesa",             limit: 4,  null: false
    t.datetime "dataAbertura",                null: false
    t.datetime "dataEncerramento",            null: false
    t.float    "valorFinal",       limit: 24, null: false
  end

  add_index "comanda", ["idFuncionario"], name: "fk_comanda_Funcionario1_idx", using: :btree

  create_table "componentes_produto", id: false, force: :cascade do |t|
    t.integer "idCompoe",   limit: 4, null: false
    t.integer "idProduto",  limit: 4, null: false
    t.integer "idItem",     limit: 4, null: false
    t.integer "quantidade", limit: 4, null: false
  end

  add_index "componentes_produto", ["idItem"], name: "fk_Produto_has_Item_Item1_idx", using: :btree
  add_index "componentes_produto", ["idProduto"], name: "fk_Produto_has_Item_Produto1_idx", using: :btree

  create_table "fornecedor", primary_key: "idFornecedor", force: :cascade do |t|
    t.string "nome",     limit: 45, null: false
    t.string "cnpj",     limit: 11, null: false
    t.string "cidade",   limit: 45, null: false
    t.string "estado",   limit: 45, null: false
    t.string "num",      limit: 45
    t.string "endereco", limit: 45, null: false
    t.string "telefone", limit: 11, null: false
  end

  create_table "funcionario", primary_key: "idFuncionario", force: :cascade do |t|
    t.string  "nome",            limit: 45, null: false
    t.string  "cpf",             limit: 9,  null: false
    t.string  "cidade",          limit: 45, null: false
    t.string  "estado",          limit: 45, null: false
    t.string  "num",             limit: 5,  null: false
    t.string  "endereco",        limit: 45, null: false
    t.string  "telefone",        limit: 11, null: false
    t.float   "salario",         limit: 24, null: false
    t.date    "dataContratacao",            null: false
    t.boolean "ativo",           limit: 1,  null: false
    t.integer "turno",           limit: 4,  null: false
    t.string  "login",           limit: 45, null: false
    t.string  "password_digest", limit: 60, null: false
    t.integer "nivelAcesso",     limit: 4,  null: false
  end

  add_index "funcionario", ["cpf"], name: "cpf_UNIQUE", unique: true, using: :btree
  add_index "funcionario", ["login"], name: "login_UNIQUE", unique: true, using: :btree

  create_table "item", primary_key: "idItem", force: :cascade do |t|
    t.string  "nome",             limit: 45,  null: false
    t.string  "marca",            limit: 45
    t.string  "descricao",        limit: 120, null: false
    t.integer "quantidade",       limit: 4,   null: false
    t.integer "quantidadeMinima", limit: 4
  end

  create_table "pedido", id: false, force: :cascade do |t|
    t.integer  "idPedido",        limit: 4, null: false
    t.integer  "idFuncionario",   limit: 4, null: false
    t.integer  "idProduto",       limit: 4, null: false
    t.integer  "idcomanda",       limit: 4, null: false
    t.datetime "dataPedido",                null: false
    t.datetime "dataFinalizacao",           null: false
    t.boolean  "cancelado",       limit: 1
  end

  add_index "pedido", ["idFuncionario"], name: "fk_Pedido_Funcionario1_idx", using: :btree
  add_index "pedido", ["idProduto"], name: "fk_Produto_has_comanda_Produto1_idx", using: :btree
  add_index "pedido", ["idcomanda"], name: "fk_Produto_has_comanda_comanda1_idx", using: :btree

  create_table "produto", primary_key: "idProduto", force: :cascade do |t|
    t.string "nome",      limit: 45,  null: false
    t.float  "valor",     limit: 24,  null: false
    t.string "descricao", limit: 120, null: false
  end

  create_table "tests", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vende", id: false, force: :cascade do |t|
    t.integer "idVende",      limit: 4,  null: false
    t.integer "idFornecedor", limit: 4,  null: false
    t.integer "idItem",       limit: 4,  null: false
    t.date    "data",                    null: false
    t.float   "valor",        limit: 24, null: false
  end

  add_index "vende", ["idFornecedor"], name: "fk_Fornecedor_has_Item_Fornecedor_idx", using: :btree
  add_index "vende", ["idItem"], name: "fk_Fornecedor_has_Item_Item1_idx", using: :btree
  add_index "vende", ["idVende"], name: "idVende", unique: true, using: :btree

  add_foreign_key "comanda", "Funcionario", column: "idFuncionario", primary_key: "idFuncionario", name: "fk_comanda_Funcionario1", on_delete: :cascade
  add_foreign_key "componentes_produto", "Item", column: "idItem", primary_key: "idItem", name: "fk_Produto_has_Item_Item1", on_delete: :cascade
  add_foreign_key "componentes_produto", "Produto", column: "idProduto", primary_key: "idProduto", name: "fk_Produto_has_Item_Produto1"
  add_foreign_key "pedido", "Produto", column: "idProduto", primary_key: "idProduto", name: "fk_Produto_has_comanda_Produto1", on_delete: :cascade
  add_foreign_key "pedido", "comanda", column: "idcomanda", primary_key: "idcomanda", name: "fk_Produto_has_comanda_comanda1", on_delete: :cascade
  add_foreign_key "pedido", "funcionario", column: "idFuncionario", primary_key: "idFuncionario", name: "fk_Pedido_Funcionario1", on_delete: :cascade
  add_foreign_key "vende", "Fornecedor", column: "idFornecedor", primary_key: "idFornecedor", name: "fk_Fornecedor_has_Item_Fornecedor"
  add_foreign_key "vende", "Item", column: "idItem", primary_key: "idItem", name: "fk_Fornecedor_has_Item_Item1", on_delete: :cascade
end
