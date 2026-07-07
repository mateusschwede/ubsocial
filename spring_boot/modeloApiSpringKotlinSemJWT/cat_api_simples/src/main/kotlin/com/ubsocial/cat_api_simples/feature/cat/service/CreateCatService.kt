package com.ubsocial.cat_api_simples.feature.cat.service

import com.ubsocial.cat_api_simples.feature.cat.mapper.CatMapper
import com.ubsocial.cat_api_simples.feature.cat.model.dto.CatResponse
import com.ubsocial.cat_api_simples.feature.cat.model.dto.CreateCatRequest
import com.ubsocial.cat_api_simples.feature.cat.model.entity.CatEntity
import com.ubsocial.cat_api_simples.feature.cat.repository.CatRepository
import com.ubsocial.cat_api_simples.feature.cat.utils.CatUtils
import org.springframework.stereotype.Service

@Service
class CreateCatService(
    private val catRepository: CatRepository,
    private val catMapper: CatMapper,
    private val catUtils: CatUtils
) {

    fun execute(request: CreateCatRequest): CatResponse {
        val cat = CatEntity(
            name = catUtils.normalizeName(request.name),
            breed = request.breed,
            age = request.age
        )

        val savedCat = catRepository.save(cat)
        return catMapper.toResponse(savedCat)
    }
}