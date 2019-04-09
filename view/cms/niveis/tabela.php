

<div class="linha_titulo">
    <div class="col_titulo" style="width:180px; border-left:">Nome nível</div>
    <div class="col_titulo" style="width:280px; border-left: 1px solid black;">Descrição</div>
    <div class="col_titulo" style="width:130px; border-left: 1px solid black;">Ações</div>
</div>

<?php
    //IMPORTANDO A CONTROLLER DE NIVEL
    require_once('controller/controllerNiveis.php');

    //INSTANCIANDO A CLASS CONTROLLERNIVEIS.PHP
    $controller_niveis = new ControllerNiveis();

    //$listar_niveis recebendo O OBJETO DE RETORNO DO METODO LISTAR_NIVEIS()
    $lista_niveis = $controller_niveis->listar_niveis();
    
    if(count($lista_niveis) < 1){
        echo "<img class='img_not_find' alt='Nada encontrado' src='view/imagem/magnify.gif'>";
        echo " <p class='aviso_tabela'> Nenhum nível encontrado!</p> ";
    }

    foreach($lista_niveis as $lista){
       
?>

<div class="linha_resposta">
    <div class="col_resposta" style="padding-top: 10px; width:180px;"><?php echo($lista->getNome_nivel())?></div>
    <div class="col_resposta" style="padding-top: 10px; width:280px;  border-left: 1px solid black;"><?php echo($lista->getDescricao())?></div>
    <div class="col_resposta" style="width:130px;  border-left: 1px solid black;">
        <img src="view/cms/imagem/icones/edit.png" alt="edit" title="Editar" onclick="buscar_dados('niveis', 'buscar', <?php echo($lista->getId_niveis())?>)">
        <img src="view/cms/imagem/icones/delete.png" alt="delete" title="Excluir" onclick="excluir_niveis('niveis', 'excluir', <?php echo($lista->getId_niveis())?>)">
        
    </div>
</div>

<?php
    }
?>