package com.onlythinking.shop.mgt.core.utils;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLClassLoader;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Enumeration;
import java.util.List;
import java.util.jar.JarEntry;
import java.util.jar.JarFile;

/**
 * <p> The describe </p>
 *
 * @author Li Xingping
 */
@Slf4j
public class PackageUtils {

    /**
     * The package separator character: '.'
     */
    private static final char PACKAGE_SEPARATOR = '.';

    /**
     * The path separator character: '/'
     */
    private static final char PATH_SEPARATOR = '/';

    /**
     * The inner class separator character: '$'
     */
    private static final char INNER_CLASS_SEPARATOR = '$';

    /**
     * The CGLIB class separator: "$$"
     */
    public static final String CGLIB_CLASS_SEPARATOR = "$$";

    /**
     * The ".class" file suffix
     */
    public static final String CLASS_FILE_SUFFIX = ".class";

    /**
     * 获取某包下（包括该包的所有子包）所有类
     *
     * @param packageName 包名
     * @return 类的完整名称
     */
    public static List<String> getClassName(String packageName) throws IOException {
        return getClassName(packageName, true);
    }

    /**
     * 获取某包下所有类
     *
     * @param packageName  包名
     * @param childPackage 是否遍历子包
     * @return 类的完整名称
     */
    public static List<String> getClassName(String packageName, boolean childPackage) throws IOException {
        List<String> fileNames = new ArrayList<>();
        ClassLoader loader = Thread.currentThread().getContextClassLoader();
        String packagePath = packageName.replace(PACKAGE_SEPARATOR, PATH_SEPARATOR);
        Enumeration<URL> urls = loader.getResources(packagePath);
        while (urls.hasMoreElements()) {
            URL url = urls.nextElement();
            if (null == url) {
                continue;
            }
            log.info("文件地址：{}", url.toString());
            log.info("文件地址PATH：{}", url.getPath());
            String type = url.getProtocol();
            if ("file".equals(type)) {
                fileNames.addAll(getClassNameByFile(url.getPath(), childPackage));
            } else if ("jar".equals(type)) {
                fileNames.addAll(getClassNameByJar(url.getPath(), childPackage));
            }
        }
        fileNames.addAll(getClassNameByJars(((URLClassLoader) loader).getURLs(), packagePath, childPackage));
        return fileNames;
    }

    /**
     * 从项目文件获取某包下所有类
     *
     * @param filePath     文件路径
     *                     类名集合
     * @param childPackage 是否遍历子包
     * @return 类的完整名称
     * @throws UnsupportedEncodingException un support
     */
    private static List<String> getClassNameByFile(String filePath, boolean childPackage) throws UnsupportedEncodingException {
        List<String> classNames = new ArrayList<>();
        filePath = URLDecoder.decode(filePath, StandardCharsets.UTF_8.name());
        File file = new File(filePath);
        String[] extensions = new String[]{"class"};
        Collection<File> files = FileUtils.listFiles(file, extensions, childPackage);
        for (File childFile : files) {
            String childFilePath = childFile.getPath();
            log.info("找到文件:{}", childFilePath);
            if (StringUtils.containsAny(childFilePath, INNER_CLASS_SEPARATOR)) {
                continue;
            }
            childFilePath = childFilePath.substring(childFilePath.indexOf("/classes/") + 9, childFilePath.lastIndexOf(PACKAGE_SEPARATOR));
            childFilePath = childFilePath.replace(PATH_SEPARATOR, PACKAGE_SEPARATOR);
            classNames.add(childFilePath);
        }
        return classNames;
    }

    /**
     * 从jar获取某包下所有类
     *
     * @param jarPath      jar文件路径
     * @param childPackage 是否遍历子包
     * @return 类的完整名称
     * @throws UnsupportedEncodingException
     */
    private static List<String> getClassNameByJar(String jarPath, boolean childPackage) throws UnsupportedEncodingException {
        List<String> classNames = new ArrayList<>();
        String[] jarInfo = jarPath.split("!");
        String jarFilePath = jarInfo[0].substring(jarInfo[0].indexOf(PATH_SEPARATOR));
        jarFilePath = URLDecoder.decode(jarFilePath, StandardCharsets.UTF_8.name());
        log.info("Jar路径:{}", jarFilePath);
        String packagePath = jarInfo[1].substring(1);
        log.info("包路径:{}", packagePath);
        try {
            JarFile jarFile = new JarFile(jarFilePath);
            Enumeration<JarEntry> entries = jarFile.entries();
            while (entries.hasMoreElements()) {
                JarEntry jarEntry = entries.nextElement();
                String entryName = jarEntry.getName();
                if (entryName.endsWith(CLASS_FILE_SUFFIX)) {
                    if (childPackage) {
                        if (entryName.startsWith(packagePath)) {
                            log.info("EntryName:{}", entryName);
                            entryName = entryName.replace(PATH_SEPARATOR, PACKAGE_SEPARATOR).substring(0, entryName.lastIndexOf("."));
                            classNames.add(entryName);
                        }
                    } else {
                        int index = entryName.lastIndexOf(PATH_SEPARATOR);
                        String myPackagePath;
                        if (index != -1) {
                            myPackagePath = entryName.substring(0, index);
                        } else {
                            myPackagePath = entryName;
                        }
                        if (myPackagePath.equals(packagePath)) {
                            entryName = entryName.replace(PATH_SEPARATOR, PACKAGE_SEPARATOR).substring(0, entryName.lastIndexOf("."));
                            classNames.add(entryName);
                        }
                    }
                }
            }
        } catch (Exception e) {
            //SystemLog.Log(LogType.systemInfo, e.getMessage(), e);
        }
        return classNames;
    }

    /**
     * 从所有jar中搜索该包，并获取该包下所有类
     *
     * @param urls         URL集合
     * @param packagePath  包路径
     * @param childPackage 是否遍历子包
     * @return 类的完整名称
     */
    private static List<String> getClassNameByJars(URL[] urls, String packagePath, boolean childPackage) throws UnsupportedEncodingException {
        List<String> classNames = new ArrayList<String>();
        if (urls != null) {
            for (int i = 0; i < urls.length; i++) {
                URL url = urls[i];
                String urlPath = url.getPath();
                // 不必搜索classes文件夹
                if (urlPath.endsWith("classes/")) {
                    continue;
                }
                String jarPath = urlPath + "!/" + packagePath;
                classNames.addAll(getClassNameByJar(jarPath, childPackage));
            }
        }
        return classNames;
    }
}
