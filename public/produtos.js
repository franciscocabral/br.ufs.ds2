var pdtItensSelecionados = [];

function pdtListarItensSelecionados() {
    var tabelaDeItens = document.getElementById("lista-de-itens");
    var tabelaDeItensSelecionados = document.getElementById("tabela-selecionados");

    var tamanho = tabelaDeItens.rows.length;
    for (var i = 1; i < tamanho; i++) {
        var linha = tabelaDeItens.rows[i];
        var coluna = linha.childNodes[1];
        var div = coluna.childNodes[1];
        var span = div.childNodes[0];
        var input = span.childNodes[0];

        if (input.checked) {
            if (linha.childNodes[7].childNodes[0].value !== "0") {
                var itemAtual = new pdtItem(
                    coluna.childNodes[0].value,             // Id
                    linha.childNodes[3].textContent,        // Nome
                    linha.childNodes[5].textContent,        // Marca
                    linha.childNodes[7].childNodes[0].value // Quantidade
                );

                if (pdtItensSelecionados.length === 0) {
                    pdtItensSelecionados.push(itemAtual);

                } else {
                    var cadastrado = false;
                    for (var j =0; j < pdtItensSelecionados.length;j++){
                        if (pdtItensSelecionados[j].id == itemAtual.id) {
                            pdtItensSelecionados[j].quantidade = itemAtual.quantidade;
                            cadastrado = true;
                            break;
                        }
                    }
                    if(!cadastrado){
                        pdtItensSelecionados.push(itemAtual);
                    }
                }
            } else {
                alert("Voce precisa colocar a quantidade dos itens selecionados")
            }
        }
    }
    while (tabelaDeItensSelecionados.rows.length > 1) {
        document.getElementById('tabela-selecionados').deleteRow(1);
    }
    for (var item of pdtItensSelecionados) {
        tabelaDeItensSelecionados.innerHTML += item.getLinhaDaTabela();
    }

}

function pdtRemoverItem(indice) {
    document.getElementById('tabela-selecionados').deleteRow(indice)
}

var pdtItem = function(id, nome, marca,quantidade) {
    this.id = id;
    this.nome = nome;
    this.marca = marca;
    this.quantidade = quantidade;


    this.getLinhaDaTabela = function() {
        var linha = "<tr>";
        linha += "<td>" + nome + "</td>";
        linha += "<td>" + marca + "</td>";
        linha += "<td>" + quantidade + "</td>";
        linha += "<td> <input type=\"button\" value=\"Excluir\" class=\"btn red\" onClick=\"pdtRemoverItem(this.parentNode.parentNode.rowIndex)\" /></td>";
        linha += "</tr>";
        return linha;
    }

}
