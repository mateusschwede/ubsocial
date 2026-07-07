package com.ubsocial.cat_api_simples.feature.cat.service

import com.ubsocial.cat_api_simples.exception.ResourceNotFoundException
import com.ubsocial.cat_api_simples.feature.cat.repository.CatRepository
import org.springframework.stereotype.Service

@Service
class DeleteCatService(
    private val catRepository: CatRepository
) {

    fun execute(id: Long) {

        val cat = catRepository.findById(id)
            .orElseThrow {
                ResourceNotFoundException("Cat not found with id: $id")
            }

        catRepository.delete(cat)
    }
}