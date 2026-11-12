package com.example.call_panel.controller;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.example.call_panel.model.entity.Call;
import com.example.call_panel.service.CallService;
import com.example.call_panel.model.dto.CallDTO;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;

@RestController
@RequestMapping("/call")
public class CallController {

    private final CallService callService;
    private final SimpMessagingTemplate simpMessagingTemplate;

    public CallController(CallService callService, SimpMessagingTemplate simpMessagingTemplate) {
        this.callService = callService;
        this.simpMessagingTemplate = simpMessagingTemplate;
    }

    @PostMapping()
    public Call createCall(@RequestBody CallDTO callDTO) {
        Call call = callService.save(callDTO);
        simpMessagingTemplate.convertAndSend("/topic/calls", call);
        return call;
    }
}