package com.ubsocial.cat_api_simples.feature.cat.model.dto

import jakarta.validation.constraints.Min
import jakarta.validation.constraints.NotBlank

data class UpdateCatRequest(

    @field:NotBlank(message = "Cat name is required.")
    val name: String,

    @field:NotBlank(message = "Cat breed is required.")
    val breed: String,

    @field:Min(value = 0, message = "Cat age must be greater than or equal to zero.")
    val age: Int
)