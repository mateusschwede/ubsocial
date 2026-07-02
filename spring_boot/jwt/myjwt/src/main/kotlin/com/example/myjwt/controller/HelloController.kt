package com.example.myjwt.controller

import com.example.myjwt.dto.HelloResponse
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/api")
class HelloController {

    @GetMapping("/hello")
    fun hello(): HelloResponse {
        return HelloResponse(
            message = "API REST funcionando!",
            status = "OK"
        )
    }
}