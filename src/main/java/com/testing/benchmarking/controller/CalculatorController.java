package com.testing.benchmarking.controller;

import java.math.BigInteger;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.testing.benchmarking.service.CalculatorService;

@RestController
@RequestMapping("/api/calculator")
public class CalculatorController {

    @GetMapping("/factorial/{number}")
    public ResponseEntity<BigInteger> factorial(@PathVariable Long number){
        return ResponseEntity.ok(CalculatorService.factorial(number));
    }
}
