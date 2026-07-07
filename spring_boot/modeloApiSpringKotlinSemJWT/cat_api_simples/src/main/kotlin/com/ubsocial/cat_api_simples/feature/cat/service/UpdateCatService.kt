package com.ubsocial.cat_api_simples.feature.cat.service

import com.ubsocial.cat_api_simples.exception.ResourceNotFoundException
import com.ubsocial.cat_api_simples.feature.cat.mapper.CatMapper
import com.ubsocial.cat_api_simples.feature.cat.model.dto.CatResponse
import com.ubsocial.cat_api_simples.feature.cat.model.dto.UpdateCatRequest
import com.ubsocial.cat_api_simples.feature.cat.repository.CatRepository
import com.ubsocial.cat_api_simples.feature.cat.utils.CatUtils
import org.springframework.stereotype.Service

@Service
class UpdateCatService(
    private val catRepository: CatRepository,
    private val catMapper: CatMapper,
    private val catUtils: CatUtils
) {

    fun execute(
        id: Long,
        request: UpdateCatRequest
    ): CatResponse {

        val cat = catRepository.findById(id)
            .orElseThrow {
                ResourceNotFoundException("Gato não encontrado com id: $id")
            }

        cat.name = catUtils.normalizeName(request.name)
        cat.breed = request.breed
        cat.age = request.age

        val updatedCat = catRepository.save(cat)
        return catMapper.toResponse(updatedCat)
    }
}