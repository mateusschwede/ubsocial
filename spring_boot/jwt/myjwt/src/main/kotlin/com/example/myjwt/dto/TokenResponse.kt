package com.example.myjwt.dto

data class TokenResponse(
    val accessToken: String,
    val refreshToken: String
)