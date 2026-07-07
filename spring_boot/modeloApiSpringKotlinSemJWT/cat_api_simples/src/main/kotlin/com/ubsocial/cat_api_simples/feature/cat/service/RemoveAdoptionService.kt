package com.ubsocial.cat_api_simples.feature.cat.service

import com.ubsocial.cat_api_simples.exception.ResourceNotFoundException
import com.ubsocial.cat_api_simples.feature.cat.mapper.CatMapper
import com.ubsocial.cat_api_simples.feature.cat.model.dto.CatResponse
import com.ubsocial.cat_api_simples.feature.cat.model.dto.RemoveAdoptionRequest
import com.ubsocial.cat_api_simples.feature.cat.model.enums.CatStatus
import com.ubsocial.cat_api_simples.feature.cat.repository.CatRepository
import com.ubsocial.cat_api_simples.feature.cat.validator.CatValidator
import org.springframework.stereotype.Service

@Service
class RemoveAdoptionService(
    private val catRepository: CatRepository,
    private val catMapper: CatMapper,
    private val catValidator: CatValidator
) {

    fun execute(
        id: Long,
        request: RemoveAdoptionRequest
    ): CatResponse {

        val cat = catRepository.findById(id)
            .orElseThrow {
                ResourceNotFoundException("Gato não encontrado com id: $id")
            }

        catValidator.validateAdopted(cat)

        cat.adopterName = null
        cat.status = CatStatus.AVAILABLE

        val updatedCat = catRepository.save(cat)
        return catMapper.toResponse(updatedCat)
    }
}