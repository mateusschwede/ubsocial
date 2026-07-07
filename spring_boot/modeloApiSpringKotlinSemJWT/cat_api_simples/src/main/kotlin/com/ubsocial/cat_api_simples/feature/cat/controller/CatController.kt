package com.ubsocial.cat_api_simples.feature.cat.controller

import com.ubsocial.cat_api_simples.feature.cat.model.dto.CatResponse
import com.ubsocial.cat_api_simples.feature.cat.model.dto.CreateCatRequest
import com.ubsocial.cat_api_simples.feature.cat.model.dto.UpdateCatRequest
import com.ubsocial.cat_api_simples.feature.cat.model.dto.CatSummaryResponse
import com.ubsocial.cat_api_simples.feature.cat.service.CreateCatService
import com.ubsocial.cat_api_simples.feature.cat.service.DeleteCatService
import com.ubsocial.cat_api_simples.feature.cat.service.GetCatService
import com.ubsocial.cat_api_simples.feature.cat.service.ListCatService
import com.ubsocial.cat_api_simples.feature.cat.service.UpdateCatService
import jakarta.validation.Valid
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/cats")
class CatController(
    private val createCatService: CreateCatService,
    private val updateCatService: UpdateCatService,
    private val deleteCatService: DeleteCatService,
    private val getCatService: GetCatService,
    private val listCatService: ListCatService
) {

    @PostMapping
    fun create(
        @Valid @RequestBody request: CreateCatRequest
    ): ResponseEntity<CatResponse> {

        return ResponseEntity
            .status(HttpStatus.CREATED)
            .body(createCatService.execute(request))
    }


    @PutMapping("/{id}")
    fun update(
        @PathVariable id: Long,
        @Valid @RequestBody request: UpdateCatRequest
    ): ResponseEntity<CatResponse> {

        return ResponseEntity.ok(
            updateCatService.execute(id, request)
        )
    }


    @DeleteMapping("/{id}")
    fun delete(
        @PathVariable id: Long
    ): ResponseEntity<Void> {

        deleteCatService.execute(id)

        return ResponseEntity.noContent().build()
    }


    @GetMapping("/{id}")
    fun findById(
        @PathVariable id: Long
    ): ResponseEntity<CatResponse> {

        return ResponseEntity.ok(
            getCatService.execute(id)
        )
    }


    @GetMapping
    fun findAll(): ResponseEntity<List<CatSummaryResponse>> {

        return ResponseEntity.ok(
            listCatService.execute()
        )
    }
}