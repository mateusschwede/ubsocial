package com.ubsocial.cat_api_simples.feature.cat.model.dto

import com.ubsocial.cat_api_simples.feature.cat.model.enums.CatStatus

data class CatSummaryResponse(
    val id: Long,
    val name: String,
    val status: CatStatus
)