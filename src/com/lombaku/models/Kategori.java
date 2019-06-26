package com.lombaku.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.validator.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import static javax.persistence.GenerationType.IDENTITY;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;


@Entity
@Table(name = "kategori")
public class Kategori implements java.io.Serializable {
    
    private int id;
    private String kategori;
    
    public Kategori() {
    	
    }
    
    public Kategori(String kategori) {
        super();
        this.kategori = kategori;
    }
    
    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    @NotBlank(message = "Tidak boleh kosong")
    @Column(name = "kategori", nullable = false, length = 300)
    public String getKategori() {
        return kategori;
    }

    public void setKategori(String kategori) {
        this.kategori = kategori;
    }
}