package com.ubsocial.cat_api_simples.feature.cat.model.dto

import jakarta.validation.constraints.Min
import jakarta.validation.constraints.NotBlank

data class UpdateCatRequest(

    @field:NotBlank(message = "Nome do gato é obrigatório")
    val name: String,

    @field:NotBlank(message = "Raça do gato é obrigatória")
    val breed: String,

    @field:Min(value = 0, message = "Idade do gato deve ser maior ou igual a zero")
    val age: Int
)