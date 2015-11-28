var pdtItensSelecionados = [];
var tabelaDeItens = document.getElementById("lista-de-itens");
var tabelaDeItensSelecionados = document.getElementById("tabela-selecionados");

function pdtListarItensSelecionados() {
    
    var tamanho = tabelaDeItens.rows.length;
    for (var i = 1; i < tamanho; i++) {
        var linha = tabelaDeItens.rows[i];
        var coluna = linha.childNodes[1];
        var div = coluna.childNodes[1];
        var span = div.childNodes[0];
        var input = span.childNodes[0];

        if (input.checked) {
            if (linha.childNodes[7].childNodes[0].value === "0" || linha.childNodes[7].childNodes[0].value === "") {
                alert("Voce precisa definir a quantidade do item: " + linha.childNodes[3].textContent);
                break;
            } else {
                var itemAtual = new pdtItem(
                    input.value,             // Id
                    linha.childNodes[3].textContent,        // Nome
                    linha.childNodes[5].textContent,        // Marca
                    linha.childNodes[7].childNodes[0].value // Quantidade
                );

                if (pdtItensSelecionados.length === 0) {
                    pdtItensSelecionados.push(itemAtual);

                } else {
                    var cadastrado = false;
                    for (var j =0; j < pdtItensSelecionados.length;j++){
                        if (pdtItensSelecionados[j].id === itemAtual.id) {
                            pdtItensSelecionados[j].setQuantidade(itemAtual.quantidade);
                            cadastrado = true;
                            break;
                        }
                    }
                    if(!cadastrado){
                        pdtItensSelecionados.push(itemAtual);
                    }
                }
            }
        }
    }

    while (tabelaDeItensSelecionados.rows.length > 1) {
        document.getElementById('tabela-selecionados').deleteRow(1);
    }
    for (var item of pdtItensSelecionados) {
        tabelaDeItensSelecionados.innerHTML += item.getLinhaDaTabela();
    }

    $('#nova-comanda').modal('hide');

}

function pdtRemoverItem(indice) {
    tabelaDeItensSelecionados.deleteRow(indice);
    for (var row of tabelaDeItens.rows) {
        alert(row[0]);
    }
}

var pdtItem = function(id, nome, marca,quantidade) {
    this.id = id;
    this.nome = nome;
    this.marca = marca;
    this.quantidade = quantidade;


    this.getLinhaDaTabela = function() {
        var linha = "<tr>";
        linha += "<td>" + this.nome + "</td>";
        linha += "<td>" + this.marca + "</td>";
        linha += "<td>" + this.quantidade + "</td>";
        linha += "<td> <input type=\"button\" value=\"Excluir\" class=\"btn red\" onClick=\"pdtRemoverItem(this.parentNode.parentNode.rowIndex)\" /></td>";
        linha += "</tr>";
        return linha;
    }

    this.setQuantidade = function(qtd){
        this.quantidade = qtd;
    }
}
var produto_item_alterado = function(item_checkbox){
    if(!item_checkbox.checked){
         var linha = item_checkbox.parentNode.parentNode.parentNode.parentNode;
         linha.childNodes[7].childNodes[0].value  = "";
        for (var item of pdtItensSelecionados) {
            if (item.id === item_checkbox.value){
                index = pdtItensSelecionados.indexOf(item);
                pdtItensSelecionados.splice(item, 1);
                break;
            }
        }
    }
}