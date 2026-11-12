package com.example.call_panel.service;

import org.springframework.stereotype.Service;
import com.example.call_panel.model.dto.CallDTO;
import com.example.call_panel.model.entity.Call;
import com.example.call_panel.repository.CallRepository;
//import lombok.AllArgsConstructor;

@Service
//@AllArgsConstructor
public class CallService {

    private final CallRepository callRepository;

    private CallService(CallRepository callRepository) {
        this.callRepository = callRepository;
    }

    public Call save(CallDTO callDTO) {
        return callRepository.save(new Call(callDTO));
    }
}