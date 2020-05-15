package com.onlythinking.shop.mgt.core.utils.avatar;

import java.awt.image.BufferedImage;
import java.math.BigInteger;

/**
 * Identicon renderer interface.
 *
 * @author don
 */
public interface IdenticonRenderer {

    /**
     * Returns rendered identicon image for given identicon code encoded as a
     * 32-bit signed integer.
     *
     * @param code identicon code
     * @param size image size
     * @return identicon image
     */
    BufferedImage render(int code, int size);

    /**
     * Returns rendered identicon image for given identicon code.
     *
     * @param code identicon code
     * @param size image size
     * @return identicon image
     */
    BufferedImage render(BigInteger code, int size);
}
