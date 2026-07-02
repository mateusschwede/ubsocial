package com.example.myjwt.service

import org.springframework.stereotype.Service

@Service
class UserService {

    private val users = mutableMapOf<String, String>()

    fun register(username: String, password: String) {
        if (users.containsKey(username)) {
            throw RuntimeException("User already exists")
        }
        users[username] = password
    }

    fun validate(username: String, password: String): Boolean {
        return users[username] == password
    }
}