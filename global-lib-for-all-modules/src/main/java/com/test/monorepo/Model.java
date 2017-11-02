package com.test.monorepo;

/**
 * Sample class model.
 * 
 * @author aayala
 *
 */
public class Model {

    private int a;
    private int b;

    public Model(int a, int b) {
        super();
        this.a = a;
        this.b = b;
    }

    public int getA() {
        return a;
    }

    public void setA(int a) {
        this.a = a;
    }

    public int getB() {
        return b;
    }

    public void setB(int b) {
        this.b = b;
    }

    @Override
    public String toString() {
        return "Model [a=" + a + ", b=" + b + "]";
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + a;
        result = prime * result + b;
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Model other = (Model) obj;
        if (a != other.a)
            return false;
        if (b != other.b)
            return false;
        return true;
    }

}
