package com.example.call_panel.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.call_panel.model.entity.Call;

public interface CallRepository extends JpaRepository<Call, Long> {   
}