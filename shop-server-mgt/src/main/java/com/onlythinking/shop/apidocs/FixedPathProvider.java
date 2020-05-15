package com.onlythinking.shop.apidocs;

import springfox.documentation.spring.web.paths.AbstractPathProvider;

import static com.google.common.base.Strings.isNullOrEmpty;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
public class FixedPathProvider extends AbstractPathProvider {
    public static final String ROOT = "/";
    private String fixedPath;

    public FixedPathProvider(String fixedPath) {
        super();
    }

    public FixedPathProvider() {
        super();
    }

    @Override
    protected String applicationPath() {
        return isNullOrEmpty(fixedPath) ? ROOT : fixedPath;
    }

    @Override
    protected String getDocumentationPath() {
        return ROOT;
    }
}
