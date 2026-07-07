package com.ubsocial.cat_api_simples.feature.cat.model.entity

import com.ubsocial.cat_api_simples.feature.cat.model.enums.CatStatus
import jakarta.persistence.*

@Entity
@Table(name = "cats")
class CatEntity(

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    var id: Long? = null,

    @Column(name = "name", nullable = false)
    var name: String,

    @Column(name = "breed", nullable = false)
    var breed: String,

    @Column(name = "age", nullable = false)
    var age: Int,

    @Enumerated(EnumType.STRING)
    @Column(name = "status", nullable = false)
    var status: CatStatus = CatStatus.AVAILABLE,

    @Column(name = "adopter_name")
    var adopterName: String? = null
)