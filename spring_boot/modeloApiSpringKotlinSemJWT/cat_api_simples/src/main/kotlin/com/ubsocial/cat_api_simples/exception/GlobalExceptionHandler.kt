package com.ubsocial.cat_api_simples.exception

import jakarta.servlet.http.HttpServletRequest
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.MethodArgumentNotValidException
import org.springframework.web.bind.annotation.ExceptionHandler
import org.springframework.web.bind.annotation.RestControllerAdvice
import java.time.LocalDateTime

@RestControllerAdvice
class GlobalExceptionHandler {

    @ExceptionHandler(ResourceNotFoundException::class)
    fun handleResourceNotFoundException(
        exception: ResourceNotFoundException,
        request: HttpServletRequest
    ): ResponseEntity<ErrorResponse> {

        val errorResponse = ErrorResponse(
            timestamp = LocalDateTime.now(),
            status = HttpStatus.NOT_FOUND.value(),
            error = HttpStatus.NOT_FOUND.reasonPhrase,
            message = exception.message ?: "Resource not found.",
            path = request.requestURI
        )

        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(errorResponse)
    }

    @ExceptionHandler(BusinessException::class)
    fun handleBusinessException(
        exception: BusinessException,
        request: HttpServletRequest
    ): ResponseEntity<ErrorResponse> {

        val errorResponse = ErrorResponse(
            timestamp = LocalDateTime.now(),
            status = HttpStatus.BAD_REQUEST.value(),
            error = HttpStatus.BAD_REQUEST.reasonPhrase,
            message = exception.message ?: "Business rule violation.",
            path = request.requestURI
        )

        return ResponseEntity.badRequest().body(errorResponse)
    }

    @ExceptionHandler(MethodArgumentNotValidException::class)
    fun handleValidationException(
        exception: MethodArgumentNotValidException,
        request: HttpServletRequest
    ): ResponseEntity<ErrorResponse> {

        val message = exception.bindingResult
            .fieldErrors
            .joinToString(", ") { "${it.field}: ${it.defaultMessage}" }

        val errorResponse = ErrorResponse(
            timestamp = LocalDateTime.now(),
            status = HttpStatus.BAD_REQUEST.value(),
            error = HttpStatus.BAD_REQUEST.reasonPhrase,
            message = message,
            path = request.requestURI
        )

        return ResponseEntity.badRequest().body(errorResponse)
    }

    @ExceptionHandler(Exception::class)
    fun handleException(
        exception: Exception,
        request: HttpServletRequest
    ): ResponseEntity<ErrorResponse> {

        val errorResponse = ErrorResponse(
            timestamp = LocalDateTime.now(),
            status = HttpStatus.INTERNAL_SERVER_ERROR.value(),
            error = HttpStatus.INTERNAL_SERVER_ERROR.reasonPhrase,
            message = "An unexpected error has occurred.",
            path = request.requestURI
        )

        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
            .body(errorResponse)
    }
}