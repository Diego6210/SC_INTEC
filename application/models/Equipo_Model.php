<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Equipo_Model
 *
 * @author SigueMED
 */
class Equipo_Model extends CI_Model {
    
    private $table;
    
    public function __construct() {
        parent::__construct();
        $this->table = "equipo";
        $this->load->database();
    }
    
    public function ConsultarEquipo()
    {
        $this->db->select($this->table.'.*');
        $this->db->from($this->table);
        $query = $this->db->get();

        return $query->result_array();
    }

    public function ConsultarEquipos($peticion,$IdCliente)
    {
        $this->db->select($this->table.'.*');
        $this->db->from($this->table);
        $this->db->where('IdCliente',$IdCliente);
        $this->db->where($this->table.$peticion);
        
        $query = $this->db->get();

        return $query->result_array();
    }

    public function InsertarProducto($Descripcion,$Marca,$Modelo,$NumService, $DivisionMedicion,$AlcanceMedicion,$ClaveId,$IdCliente)
    {
        $data = array('Descripcion' => $Descripcion,'Marca' => $Marca,'Modelo' => $Modelo,'NumService' => $NumService
        ,'ClaveId' => $ClaveId,'AlcanceMedicion' => $AlcanceMedicion,'DivisionMedicion' => $DivisionMedicion,'IdCliente' => $IdCliente);

        $this->db->insert($this->table,$data);  

        $insertId = $this->db->insert_id();
        return $insertId;  
    }   

    public function ConsultarEquipoOrdenPorId($id)
    {
        $this->db->select($this->table.'.*');
        $this->db->select('Descripcion,Marca, Modelo, NumService, ClaveId');
        $this->db->from($this->table);
        $this->db->join('equipo',$this->table.'.IdEquipo = equipo.IdEquipo');
        $this->db->where($this->table.'.IdEquipo',$id);
        $this->db->limit(1);

        return $query->row();
    }

    public function ConsultarEquipoID($id)
    {
        $this->db->select($this->table.'.*');
        $this->db->from($this->table);
        $this->db->where($this->table.'.IdEquipo',$id);
        $query = $this->db->get();

        return $query->result_array();
    }
    //put your code here
}
