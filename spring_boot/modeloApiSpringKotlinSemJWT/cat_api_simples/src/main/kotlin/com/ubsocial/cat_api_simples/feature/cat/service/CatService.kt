package com.ubsocial.cat_api_simples.feature.cat.service

import com.ubsocial.cat_api_simples.feature.cat.model.dto.*
 
interface CatService {

    fun create(request: CreateCatRequest): CatResponse

    fun update(id: Long, request: UpdateCatRequest): CatResponse

    fun delete(id: Long)

    fun findById(id: Long): CatResponse

    fun findAll(): List<CatSummaryResponse>

    fun adopt(id: Long, request: AdoptCatRequest): CatResponse

    fun removeAdoption(id: Long, request: RemoveAdoptionRequest): CatResponse
}