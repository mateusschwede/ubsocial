package com.ubsocial.cat_api_simples.feature.cat.utils

import org.springframework.stereotype.Component

@Component
class CatUtils {

    fun normalizeName(name: String): String =
        name.trim()
            .lowercase()
            .replaceFirstChar { it.uppercase() }
}