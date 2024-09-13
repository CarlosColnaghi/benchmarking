package com.testing.benchmarking.service;

import java.math.BigInteger;

public class CalculatorService {
    public static final BigInteger factorial(Long number){
        if(number == 0 || number == 1){
            return BigInteger.ONE;
        } else {
            return BigInteger.valueOf(number).multiply(factorial(number - 1));
        }
    }
}
