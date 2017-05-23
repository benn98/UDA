<?php
  session_start();

  if(isset($this->session->userdata("errore"))){
        $this->session->unset_userdata=array();}

  //input login values
  $username = $this->input->post('username');
  $password = $this->input->post('password');
