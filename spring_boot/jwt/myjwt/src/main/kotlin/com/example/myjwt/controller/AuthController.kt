package com.example.myjwt.controller

import com.example.myjwt.dto.LoginRequest
import com.example.myjwt.dto.RegisterRequest
import com.example.myjwt.dto.TokenResponse
import com.example.myjwt.security.JwtService
import com.example.myjwt.service.UserService
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/api/auth")
class AuthController(
    private val jwtService: JwtService,
    private val userService: UserService
) {

    @PostMapping("/register")
    fun register(@RequestBody request: RegisterRequest): String {
        userService.register(request.username, request.password)
        return "User registered successfully"
    }

    @PostMapping("/login")
    fun login(@RequestBody request: LoginRequest): TokenResponse {

        val isValid = userService.validate(request.username, request.password)

        if (!isValid) {
            throw RuntimeException("Invalid credentials")
        }

        val accessToken = jwtService.generateAccessToken(request.username)
        val refreshToken = jwtService.generateRefreshToken(request.username)
        return TokenResponse(accessToken, refreshToken)
    }
}