var pdtItensSelecionados = [];
var tabelaDeItens = document.getElementById("lista-de-itens");
var tabelaDeItensSelecionados = document.getElementById("tabela-selecionados");

function itemSel(){
    return JSON.stringify(pdtItensSelecionados);
}

$('#cdstr').click(function(){
    var input = $("<input>")
        .attr("type", "hidden")
        .attr("name", "items").val(itemSel());
    $('#new_produto').append($(input));
});

// function cadastrar(){
//     $.ajax({
//         url: '/produto/componentes', 
//         type: 'post', // performing a POST request
//         data : {
//             lista_componentes : pdtItensSelecionados,
//             // componentes_produto : {
//             //     id : -1,
//             //     idCompoe: -1,
//             //     idPrduto : document.getElementById("idProduto").value,
//             //     idItem : document.getElementById("idItem").value,
//             //     quantidade : document.getElementById("quantidade").value
//             // },
//         },
//         dataType: 'json', 
//         success: function(data) 
//         {
//             alert("Deu certo!")
//         } 
//     });
// }

function pdtChecarItensSelecionados() {    
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
                document.getElementById("alert_container").style.display = 'none';
                $('#nova-comanda').modal('hide');
                pdtListarItensSelecionados();
            }
        }
    }
}

var pdtListarItensSelecionados = function(){
    while (tabelaDeItensSelecionados.rows.length > 1) {
        document.getElementById('tabela-selecionados').deleteRow(1);
    }
    for (var item of pdtItensSelecionados) {
        tabelaDeItensSelecionados.innerHTML += item.getLinhaDaTabela();
    }
}
var pdtRemoverItem = function(indice) {
    var itemId = tabelaDeItensSelecionados.rows[indice].id;
    for (var i = 1; i < tabelaDeItens.rows.lengh; i++) {
        var linha = tabelaDeItens.rows[i];
        var coluna = linha.childNodes[1];
        var div = coluna.childNodes[1];
        var span = div.childNodes[0];
        var input = span.childNodes[0];
        if(input.id == itemId){
            pdtItemAlterado(input);
        }
    }
    tabelaDeItensSelecionados.deleteRow(indice);
}

var pdtItem = function(id, nome, marca,quantidade) {
    this.id = id;
    this.nome = nome;
    this.marca = marca;
    this.quantidade = quantidade;


    this.getLinhaDaTabela = function() {
        var linha = "<tr id="+ id +">";
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
var pdtItemAlterado = function(item_checkbox){
    if(!item_checkbox.checked){
         var linha = item_checkbox.parentNode.parentNode.parentNode.parentNode;
         linha.childNodes[7].childNodes[0].value  = "";
        for (var item of pdtItensSelecionados) {
            if (item.id === item_checkbox.value){
                index = pdtItensSelecionados.indexOf(item);
                pdtItensSelecionados.splice(item, 1);
                pdtListarItensSelecionados();
                break;
            }
        }
    }
}

//atualizar lista de item ao excluir
