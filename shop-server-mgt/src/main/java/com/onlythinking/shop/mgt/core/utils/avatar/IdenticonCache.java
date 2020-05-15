package com.onlythinking.shop.mgt.core.utils.avatar;

public interface IdenticonCache {
    byte[] get(String key);

    void add(String key, byte[] imageData);

    void remove(String key);

    void removeAll();
}
