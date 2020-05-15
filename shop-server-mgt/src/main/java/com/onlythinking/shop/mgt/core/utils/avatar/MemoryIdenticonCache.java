package com.onlythinking.shop.mgt.core.utils.avatar;

public class MemoryIdenticonCache implements IdenticonCache {

    @Override
    public byte[] get(String key) {
        return new byte[0];
    }

    @Override
    public void add(String key, byte[] imageData) {

    }

    @Override
    public void remove(String key) {

    }

    @Override
    public void removeAll() {

    }
}
