package com.ubsocial.cat_api_simples.feature.cat.model.dto

import jakarta.validation.constraints.NotBlank

data class AdoptCatRequest(

    @field:NotBlank(message = "Nome do adotante não pode ser nulo ou vazio")
    val adopterName: String
)