<?php
  session_start();

  if(isset($this->session->userdata("errore"))){
        $this->session->unset_userdata=array();}

  //input login values
  $username = $this->input->post('username');
  $password = $this->input->post('password');

  //looks if they haven't any value
  if($user=="" || $password==""){
   		$this->session->userdata("errore")=
      header("Location:");
            die();}

  //apply methods to input for security
  $username=mysql_real_escape_string($user);
  $username=stripslashes($user);
  $password=mysql_real_escape_string($password);
  $password=stripslashes($password);
  $password=md5($password);

  //ask to db and control inf they exisist
  $query=mysql_query("SELECT * FROM USERS WHERE username='$user' AND password='$password';");
  $result=mysql_fetch_array($query);
  if(mysql_num_rows($query)!=1){
     $_SESSION["errore"]="<div class='col_full sb-msg'><i class='icon-remove'></i><strong>Username o Password errati</strong></div>";
       header("Location:" . base_url('login');
       die();}
   else{
     $this->session->userdata["id"]=;//dargli l'id per verfica dell' amministartore

   //control if it is an admin or a simply user
   if($result[3]=="admin")
      header("Location: https://amministrazione.mobilimenaldo.it" ;
    else
      header("Location:" . base_url('home'));
