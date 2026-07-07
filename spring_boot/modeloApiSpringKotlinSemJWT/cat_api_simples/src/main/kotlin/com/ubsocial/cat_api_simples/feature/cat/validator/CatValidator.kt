package com.ubsocial.cat_api_simples.feature.cat.validator

import com.ubsocial.cat_api_simples.exception.BusinessException
import com.ubsocial.cat_api_simples.feature.cat.model.entity.CatEntity
import com.ubsocial.cat_api_simples.feature.cat.model.enums.CatStatus
import org.springframework.stereotype.Component

@Component
class CatValidator {

    fun validateAvailableForAdoption(cat: CatEntity) {
        if (cat.status == CatStatus.ADOPTED) {
            throw BusinessException("Cat is already adopted.")
        }
    }

    fun validateAdopted(cat: CatEntity) {
        if (cat.status != CatStatus.ADOPTED) {
            throw BusinessException("Cat is not adopted.")
        }
    }
}