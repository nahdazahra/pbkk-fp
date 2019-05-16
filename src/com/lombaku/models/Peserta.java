package com.lombaku.models;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import static javax.persistence.GenerationType.IDENTITY;

import java.util.Date;


@Entity
@Table(name = "peserta")
public class Peserta implements java.io.Serializable {
    
    private int id;
    private User user;
    private Lomba lomba;
    private Date tanggalDaftar;

    public Peserta(User user, Lomba lomba, Date tanggalDaftar) {
        super();
        this.user = user;
        this.lomba = lomba;
        this.tanggalDaftar = tanggalDaftar;
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

    @Column(name = "tanggal_daftar", nullable = false)
    public Date getTanggalDaftar() {
        return tanggalDaftar;
    }

    public void setTanggalDaftar(Date tanggalDaftar) {
        this.tanggalDaftar = tanggalDaftar;
    }

    @ManyToOne
    @JoinColumn(name = "user")
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @ManyToOne
    @JoinColumn(name = "lomba")
    public Lomba getLomba() {
        return lomba;
    }

    public void setLomba(Lomba lomba) {
        this.lomba = lomba;
    }
    
}