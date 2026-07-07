package com.ubsocial.cat_api_simples.feature.cat.model.dto

import jakarta.validation.constraints.NotBlank

data class AdoptCatRequest(

    @field:NotBlank(message = "Adopter name is required.")
    val adopterName: String
)