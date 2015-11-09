
$(document).on("keyup change", "#comanda-descontos", function(){
    comandaUpdateValorFinal();
});
$(document).on("keyup change", "#comanda-garcom", function(){
    comandaUpdateValorFinal();
});

function comandaUpdateValorFinal(){
    var valorInicial = parseFloat($("#comanda-valor-inicial").val());
    var valorDescontos = parseFloat($("#comanda-descontos").val());
    var valorGarcom = parseFloat($("#comanda-garcom").val());
    $("#comanda-valor-final").val(valorInicial+valorGarcom-valorDescontos);
}