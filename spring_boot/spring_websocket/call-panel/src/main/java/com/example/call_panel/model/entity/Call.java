package com.example.call_panel.model.entity;

import com.example.call_panel.model.dto.CallDTO;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class Call {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String room;

    public Call(CallDTO callDTO) {
        this.name = callDTO.getName();
        this.room = callDTO.getRoom();
    }
}