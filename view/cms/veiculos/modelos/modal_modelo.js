/*
* Chama uma modal para criação de um modelo 
* @params id int = id do tipo de veiculo
*/
function modelo_adicionar(id){
    $.ajax({url:'?cms/veiculos/modelos/modal_criar_editar.php&id='+id})
    .then(function(resposta){
        modal(resposta.toString());
    })
}
/*
* Chama uma modal para edição de um modelo
* @params id int = id do modelo
*/

function modelo_editar(id,id_modelo){
    $.ajax({url:'?cms/veiculos/modelos/modal_criar_editar.php&id='+ id + '&id_modelo='+id_modelo})
    .then(function(resposta){
        modal(resposta.toString());
    })
}


/* Funções que fazem o crud de modelos */
function modelo_insert(form){
    event.preventDefault();

    $.ajax({
        url:$(form).attr("action"),
        data:$(form).serialize(),
        type:'POST',
        method:'POST',
        success:function(resposta){
            console.log("Resposta : ",resposta);
            if(resposta.search("sucesso")>=0){
                $.notify(" Modelo gravado com sucesso! ","success");
                chamaModalModelos($(form).attr('data-idTipo'));
            }
        }
    })

}
function modelo_uptade(form){

    event.preventDefault();

    $.ajax({
        url:$(form).attr("action"),
        data:$(form).serialize(),
        type:'POST',
        method:'POST',
        success:function(resposta){
            console.log("Resposta : ",resposta);
            if(resposta.search("sucesso")>=0){
                
                $.notify(" Modelo atualizado com sucesso! ","success");

                chamaModalModelos($(form).attr('data-idTipo'));
            
            }
        }
    })

}
/*
* Chama uma modal para criação da marca
* @params id int = id do tipo de veiculo
*/
function marca_adicionar(id){
    $.ajax({url:'?cms/veiculos/modelos/modal_criar_editar.php&id_tipo_veiculo='+id})
    .then(function(resposta){
        modal(resposta.toString());
    })
}
/*
* Chama uma modal para edição de uma marca
* @params id int = id do modelo
*/

function marca_editar(id,id_modelo){
    $.ajax({url:'?cms/veiculos/modelos/modal_criar_editar.php&id='+ id + '&id_modelo='+id_modelo})
    .then(function(resposta){
        modal(resposta.toString());
    })
}
