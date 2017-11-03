package com.test.monorepo;

/**
 * Some Utilities for Strings. Additional comment
 * 
 * @author aayala
 *
 */
public class UtilsForServiceA {

    /**
     * Transform a String to uppercase
     * 
     * @param entry
     * @return
     */
    public String doSomethingWithString(String entry) {
        return entry.toUpperCase();
    }

    /**
     * Transform a String to lowercase
     * 
     * @param entry
     * @return
     */
    public String doAnotherThingWithString(String entry) {
        return entry.toLowerCase();
    }

}
