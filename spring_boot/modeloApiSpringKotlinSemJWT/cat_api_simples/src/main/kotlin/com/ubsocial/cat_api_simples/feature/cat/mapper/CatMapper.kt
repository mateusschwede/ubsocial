package com.ubsocial.cat_api_simples.feature.cat.mapper

import com.ubsocial.cat_api_simples.feature.cat.model.dto.CatResponse
import com.ubsocial.cat_api_simples.feature.cat.model.dto.CatSummaryResponse
import com.ubsocial.cat_api_simples.feature.cat.model.entity.CatEntity
import org.springframework.stereotype.Component

@Component
class CatMapper {
    fun toResponse(entity: CatEntity): CatResponse =
        CatResponse(
            id = entity.id!!,
            name = entity.name,
            breed = entity.breed,
            age = entity.age,
            status = entity.status,
            adopterName = entity.adopterName
        )

    fun toSummaryResponse(entity: CatEntity): CatSummaryResponse =
        CatSummaryResponse(
            id = entity.id!!,
            name = entity.name,
            status = entity.status
        )
}