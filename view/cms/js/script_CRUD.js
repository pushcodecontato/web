//Mensagem: variavel para passar a mensagem que será mostrada para o usuário depois de uma ação
let mensagem = "";
let msg = "";
let type = "" ;

let caminho = "";
var href = window.location.href;
var caminho_absoluto = 'view/cms/';

function conteudo_subMenu(nome_pagina, teste){
    if(teste){
        $.ajax({
            type:'GET',
            url:'?cms/'+nome_pagina,
            success:function(html){
                $('.conteudo').html(html);
            }
        })

    }
}
function inserir_nivel(){
    form = $('#formNiveis');
    event.preventDefault();
    $.ajax({
        type:"POST",
        url: form.attr('action'),
        data: form.serialize(),
        async: true,
        success:function(dados){
            $.notify("Nível inserido com sucesso", "success");
            conteudo_subMenu('niveis/tabela_niveis', true);
        }
    });
}
function atualizar_nivel(){
    form = $('#formNiveis');
    event.preventDefault();
    $.ajax({
        type:"POST",
        url: form.attr('action'),
        data: form.serialize(),
        async: true,
        success:function(dados){
            $.notify("Nível editado com sucesso", "success"); 
            conteudo_subMenu('niveis/tabela_niveis', true);
        }
    });
   
}

function excluir_niveis(controller, modo, id_item){
    $.ajax({
        type:"GET",
        url: `router.php?`,
        data: {controller: controller, modo: modo, id:id_item},
        success:function(dados){
            
            $.notify("Nível excluído com sucesso", "success");
            conteudo_subMenu('niveis/tabela_niveis', true);
        }            
    });
}
function buscar_dados(controller, modo, id_item){
    $.ajax({
        type:"GET",
        url: `router.php?`,
        data: {controller: controller, modo: modo, id:id_item},
        success:function(dados){
            modal(dados);
           
        }               
    });
}

/* Crud de Usuario */
function usuario_getById(id){
	event.preventDefault();
	 $.ajax({
		type:'post',
		method:'post',
		url:'router.php?controller=usuarios&modo=select',
		data:{id},
		success:function(dados){
			modal(dados);
		}
	})
}

function usuario_getDados(){

	conteudo_subMenu('usuarios/tabela',true);

}
function usuario_insert(form){

	event.preventDefault();
	console.log("Hellow!!!!!!")
	$.ajax({
		type:'post',
		method:'post',
		url:$(form).attr('action'),
		data: $(form).serialize(),
		success:function(dados){
			console.log("Hellow@",dados);
			if(dados.toString().search('sucesso')>=0){

				$.notify("usuario Cadastrado com sucesso", "success");

				conteudo_subMenu('usuarios/tabela',true);
				fecharModal();
			}
		}
	})
}
function usuario_update(form){

	event.preventDefault();

	$.ajax({
		type:'post',
		method:'post',
		url:$(form).attr('action'),
		data: $(form).serialize(),
		success:function(dados){

			if(dados.toString().search('sucesso')>=0){

				$.notify("usuario Atualizado com sucesso", "success");

				conteudo_subMenu('usuarios/tabela',true);
				
				fecharModal()


			}
		}
	})
}

function usuario_delete(id){
	event.preventDefault();
	$.ajax({
		type:'post',
		method:'post',
		url:'router.php?controller=usuarios&modo=excluir&id='+id,
		success:function(dados){
			if(dados.toString().search('sucesso')>=0){

				$.notify("usuario Deletado com sucesso", "info");

				conteudo_subMenu('usuarios/tabela',true);
				

			}
		}
	});
}

/* logar função  temporario */
function logar(formulario){
	// Desativa o submit do formualrio par a tela não piscar
	event.preventDefault();

	$.ajax({
		type:'post',
		method: 'post',
		url:'router.php?controller=usuarios&modo=logar',
		data:$(formulario).serialize()
	}).then(function(resposta){
		
		console.log("Resposta: ",resposta);

		if(resposta.toString().search('sucesso')>=0){

			$.notify("usuario logado com sucesso", "success");

			//var redirecionamento = window.location.origin + window.location.pathname + '?cms/home';
			
			window.location.href = '?cms/home_cms';

		}else{

			$.notify("Erro ao logar com usuario !", "error");
		
		}
	})
}

/* Crud de Tipo de veiculo */
function tipo_veiculo_cadastro(form){
	
	event.preventDefault();

	$.ajax({
		type:'POST',
		url:$(form).attr('action'),
		data:$(form).serialize(),
		success:function(resposta){
			console.log("RESPOSTA:",resposta);
			if(resposta.toString().search('sucesso')>=0){
				$.notify("Tipo de veiculo cadastrado",'success');
				conteudo_subMenu('veiculos/tipo_veiculo',true);
			}
		}
	})

}

function tipo_veiculo_atualizar(form){

	event.preventDefault();

	$.ajax({
		type:'POST',
		url:$(form).attr('action'),
		data:$(form).serialize(),
		success:function(resposta){
			console.log("RESPOSTA:",resposta);
			if(resposta.toString().search('sucesso')>=0){
				$.notify("Tipo de veiculo atualixado",'success');
				conteudo_subMenu('veiculos/tipo_veiculo',true);
			}
		}
	})
}

function tipo_veiculo_getById(id){
	event.preventDefault();
	 $.ajax({
		type:'GET',
		method:'GET',
		url:'router.php?controller=tipo_veiculo&modo=select&id='+id,
		success:function(dados){
 			$('.conteudo').html(dados);
		}
	})
}



/* Ignore isso!!! */
function chamaModalAcessorios(id_tipo_veiculo){

	if(id_tipo_veiculo < 1)return;
	
	$.get('?cms/veiculos/acessorios/modal_tabela.php&id_tipo_veiculo='+id_tipo_veiculo)
	 .then(function(res){
		modal(res.toString());
	});
}

function chamaModalModelos(id_tipo_veiculo){
	
	if(id_tipo_veiculo < 1)return;

	$.get('?cms/veiculos/modelos/modal_tabela.php&id='+id_tipo_veiculo)
	 .then(function(res){
		modal(res.toString());
	});

}
function chamaModalFip(id_tipo_veiculo){
	$.get('?cms/veiculos/fip/modal_fip.php&id_tipo_veiculo='+id_tipo_veiculo)
	 .then(function(res){
		modal(res.toString());
	});
}

function chamaModalMarcas(id_tipo_veiculo){
	
	if(id_tipo_veiculo < 1)return;

	$.get('?cms/veiculos/modelos/marcas/modal_tabela.php&id='+id_tipo_veiculo)
	 .then(function(res){
		modal(res.toString());
	});

}


function chamaModalAnunciosAprova(){
	$.get('?cms/anuncios/modal_anuncios_pendentes.php')
	 .then(function(res){
		modal(res.toString());
    })
}

function chamaModalFaleConosco(id_fale_conosco){
	$.get('?cms/fale_conosco/modal_fale_conosco.php&id_fale_conosco='+ id_fale_conosco)
     .then(function(res){
		modal(res.toString());
	});
}

function chamaModalVeiculosAprova(id){
	$.get('?cms/veiculos/modal_veiculos_pendentes.php&id_veiculo='+id)
	 .then(function(res){
		modal(res.toString());
    })
}
// FAQ
function inserir_faq(){
	alert('teste');



}

// PAGINA GANHE DINHEIRO

// SEJA PARCEIRO

// SOBRE NOS

// TERMOS DE USO

// PAGINA HOME - SESSÕES



/* Função que exporta csv 
 * params csv = String = texto com o csv:
 * 'exmplo@dsdsd.sdsd;joão;(11)4323-2545\n'
 * 'valor;valor;valor;valor\n'
 *	\n = quebra linha
 */

	function toCSV(nome,csv = 0){
 	/* Algumas validações */
 	var nomeArquivo = (csv != 0)? nome: 'export';
	var csvExport = (csv != 0)? csv: nome;
 	// Cria um link para ser ativar o download
 	var a    = document.createElement('a');
	// Diz ao browser que o conteudo sera um texto do tipo csv
	a.href        = 'data:text/csv;charset=UTF-8,' + csvExport;
	a.target      = '_blank';
	a.download    = nomeArquivo + new Date().getTime() +'.csv';
	document.body.appendChild(a);
	a.click();
 }