package com.ubsocial.cat_api_simples.feature.cat.controller

import com.ubsocial.cat_api_simples.feature.cat.model.dto.AdoptCatRequest
import com.ubsocial.cat_api_simples.feature.cat.model.dto.CatResponse
import com.ubsocial.cat_api_simples.feature.cat.model.dto.RemoveAdoptionRequest
import com.ubsocial.cat_api_simples.feature.cat.service.AdoptCatService
import com.ubsocial.cat_api_simples.feature.cat.service.RemoveAdoptionService
import jakarta.validation.Valid
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/cats")
class CatAdoptionController(
    private val adoptCatService: AdoptCatService,
    private val removeAdoptionService: RemoveAdoptionService
) {

    @PatchMapping("/{id}/adoption")
    fun adopt(
        @PathVariable id: Long,
        @Valid @RequestBody request: AdoptCatRequest
    ): ResponseEntity<CatResponse> {
        return ResponseEntity.ok(
            adoptCatService.execute(id, request)
        )
    }

    @DeleteMapping("/{id}/adoption")
    fun removeAdoption(
        @PathVariable id: Long,
        @RequestBody request: RemoveAdoptionRequest
    ): ResponseEntity<CatResponse> {
        return ResponseEntity.ok(
            removeAdoptionService.execute(id, request)
        )
    }
}