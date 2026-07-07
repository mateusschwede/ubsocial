package com.ubsocial.cat_api_simples.feature.cat.repository

import com.ubsocial.cat_api_simples.feature.cat.model.entity.CatEntity
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository

@Repository
interface CatRepository : JpaRepository<CatEntity, Long>