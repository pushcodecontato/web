<?php

class Cliente{

    private $id_cliente;
    private $nome_cliente;
    private $cpf;
    private $telefone;
    private $celular;
    private $email;
    private $senha;
    private $cep;
    private $rua;
    private $complemento;
    private $bairro;
    private $cidade;
    private $uf;
    private $cnh_foto;
    private $foto_cliente;
    private $status;
    private $dt_nascimento;
    private $numero;
    
    public function __construct(){

    }
    public function setId($id_cliente){
        $this->id_cliente = $id_cliente;
        return $this;        
    }
    public function getId(){
        return $this->id_cliente;
    }

    public function setNome($nome_cliente){
        $this->nome_cliente = $nome_cliente;
        return $this;
    }
    public function getNome(){
        return $this->nome_cliente;
    }

    public function setCPF($cpf){
        $this->cpf = $cpf;
        return $this;
    }
    public function getCPF(){
        return $this->cpf;
        
    }

    public function setTelefone($telefone){
        $this->telefone = $telefone;
        return $this;
    }
    public function getTelefone(){
        return $this->telefone;
    }

    public function setCelular($celular){
        $this->celular = $celular;
        return $this;
    }
    public function getCelular(){
        return $this->celular;
    }

    public function setEmail($email){
        $this->email = $email;
        return $this;
    }
    public function getEmail(){
        return $this->email;
    }

    public function setSenha($senha){
        $this->senha = $senha;
        return $this;
    }
    public function getSenha(){
        return $this->senha;
    }

    public function setCEP($cep){
        $this->cep = $cep;
        return $this;
    }
    public function getCEP(){
        return $this->cep;
    }

    public function setRua($rua){
        $this->rua = $rua;
        return $this;
    }
    public function getRua(){
        return $this->rua;
    }
    
    public function setComplemento($complemento){
        $this->complemento = $complemento;
        return $this;
    }
    public function getComplemento(){
        return $this->complemento;
    }

    public function setBairro($bairro){
        $this->bairro = $bairro;
        return $this;
    }
    public function getBairro(){
        return $this->bairro;
    }

    public function setCidade($cidade){
        $this->cidade = $cidade;
        return $this;
    }
    public function getCidade(){
        return $this->cidade;
    }
    
    
//    get e set status
     public function setStatus($status){
        $this->status = $status;
        return $this;
    }
    public function getStatus(){
        return $this->status;
    }
    
    
    
    

    public function setUF($uf){
        $this->uf = $uf;
        return $this;
    }
    public function getUF(){
        return $this->uf;
    }

    public function setCNHFoto($url){
        $this->cnh_foto = $url;
        return $this;
    }
    public function getCNHFoto(){
        return $this->cnh_foto;
    }

    public function setFoto($url){
        $this->foto_cliente = $url;
        return $this;
    }
    public function getFoto(){
        return $this->foto_cliente;
    }

    public function setNumero($numero){
        $this->numero = $numero;
        return $this;
    }
    public function getNumero(){
        return $this->numero;
    }

    /* Funções  de Login */
    // gera o hash da senha
	public function genSenha(){
		//return password_hash( $this->senha ,CRYPT_BLOWFISH,['cost'=>12] );
		return md5($this->senha);
	}

	// verifica se a senha passada por paramentro esta correta
	public function verificar( $senha ){
		//return password_verify( $senha , $this->senha );
		return md5($senha) == $this->senha;

    }

    public function setDt_nascimento($dt_nascimento){
        if(strpos($dt_nascimento, '/')){
            $this->dt_nascimento = date('Y-m-d', strtotime($dt_nascimento));
        }
        elseif(strpos($dt_nascimento, '-')){
            $this->dt_nascimento = date('d/m/Y', strtotime($dt_nascimento));
        }
        
        return $this;
    }
    public function getDt_nascimento(){
        return $this->dt_nascimento;
    }

    public function to_json($seguro = false){
    	if(!$seguro){
    		return array('id_cliente'=>$this->id_cliente,
    					 'nome_cliente'=>$this->nome_cliente,
    					 'cidade'=>$this->cidade,
    					 'uf'=>$this->uf,
    					 'email'=>$this->email,
    					 'status'=>$this->status);
    	}else{
    		/* Modo seguro passa dados interesantes!So usar no cms ou talves no painel de usuario(no painel seria interesante fzer um filtro para tirar datdos sencifeis) */
			return array('id_cliente'=>$this->id_cliente,
    					 'nome_cliente'=>$this->nome_cliente,
    					 'cidade'=>$this->cidade,
    					 'cpf'=>$this->cpf,
    					 'telefone'=>$this->telefone,
    					 'celular'=>$this->celular,
    					 'email'=>$this->email,
    					 'cep'=>$this->cep,
    					 'rua'=>$this->rua,
    					 'complemento'=>$this->complemento,
    					 'bairro'=>$this->bairro,
    					 'cidade'=>$this->cidade,
    					 'uf'=>$this->uf,
    					 'cnh_foto'=>$this->cnh_foto,
    					 'foto_cliente'=>$this->foto_cliente,
    					 'status'=>$this->status,
    					 'dt_nascimento'=>$this->dt_nascimento,);
    	}
    	
    }
    
}





?>