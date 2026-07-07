package com.ubsocial.cat_api_simples.feature.cat.model.dto

import com.ubsocial.cat_api_simples.feature.cat.model.enums.CatStatus

data class CatResponse(
    val id: Long,
    val name: String,
    val breed: String,
    val age: Int,
    val status: CatStatus,
    val adopterName: String?
)