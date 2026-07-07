package com.ubsocial.cat_api_simples.feature.cat.service

import com.ubsocial.cat_api_simples.exception.ResourceNotFoundException
import com.ubsocial.cat_api_simples.feature.cat.mapper.CatMapper
import com.ubsocial.cat_api_simples.feature.cat.model.dto.AdoptCatRequest
import com.ubsocial.cat_api_simples.feature.cat.model.dto.CatResponse
import com.ubsocial.cat_api_simples.feature.cat.repository.CatRepository
import com.ubsocial.cat_api_simples.feature.cat.validator.CatValidator
import org.springframework.stereotype.Service

@Service
class AdoptCatService(
    private val catRepository: CatRepository,
    private val catMapper: CatMapper,
    private val catValidator: CatValidator
) {

    fun execute(
        id: Long,
        request: AdoptCatRequest
    ): CatResponse {

        val cat = catRepository.findById(id)
            .orElseThrow {
                ResourceNotFoundException("Cat not found with id: $id")
            }

        catValidator.validateAvailableForAdoption(cat)

        cat.adopterName = request.adopterName
        cat.status = com.ubsocial.cat_api_simples.feature.cat.model.enums.CatStatus.ADOPTED

        val adoptedCat = catRepository.save(cat)

        return catMapper.toResponse(adoptedCat)
    }
}