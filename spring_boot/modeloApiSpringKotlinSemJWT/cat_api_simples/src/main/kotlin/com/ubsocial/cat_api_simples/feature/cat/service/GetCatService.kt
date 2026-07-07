package com.ubsocial.cat_api_simples.feature.cat.service

import com.ubsocial.cat_api_simples.exception.ResourceNotFoundException
import com.ubsocial.cat_api_simples.feature.cat.mapper.CatMapper
import com.ubsocial.cat_api_simples.feature.cat.model.dto.CatResponse
import com.ubsocial.cat_api_simples.feature.cat.repository.CatRepository
import org.springframework.stereotype.Service

@Service
class GetCatService(
    private val catRepository: CatRepository,
    private val catMapper: CatMapper
) {

    fun execute(id: Long): CatResponse {

        val cat = catRepository.findById(id)
            .orElseThrow {
                ResourceNotFoundException("Gato não encontrado com id: $id")
            }

        return catMapper.toResponse(cat)
    }
}