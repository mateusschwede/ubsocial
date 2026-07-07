package com.ubsocial.cat_api_simples.feature.cat.service

import com.ubsocial.cat_api_simples.feature.cat.mapper.CatMapper
import com.ubsocial.cat_api_simples.feature.cat.model.dto.CatSummaryResponse
import com.ubsocial.cat_api_simples.feature.cat.repository.CatRepository
import org.springframework.stereotype.Service

@Service
class ListCatService(
    private val catRepository: CatRepository,
    private val catMapper: CatMapper
) {

    fun execute(): List<CatSummaryResponse> {
        return catRepository.findAll()
            .map(catMapper::toSummaryResponse)
    }
}