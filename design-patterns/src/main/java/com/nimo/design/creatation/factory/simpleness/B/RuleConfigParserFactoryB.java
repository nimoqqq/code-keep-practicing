package com.nimo.design.creatation.factory.simpleness.B;

import com.nimo.design.creatation.factory.business.*;

import java.util.HashMap;
import java.util.Map;

/**
 * 简单工厂第二种方式，提前创建对象。放到缓存中
 *
 * @author : chuf
 * @date : 2023-05-09
 **/
public class RuleConfigParserFactoryB {

    private static final Map<String, IRuleConfigParser> cachedParsers = new HashMap<>();

    static {
        cachedParsers.put("json", new JsonRuleConfigParser());
        cachedParsers.put("xml", new XmlRuleConfigParser());
        cachedParsers.put("yaml", new YamlRuleConfigParser());
        cachedParsers.put("properties", new PropertiesRuleConfigParser());
    }


    public static IRuleConfigParser createParser(String configFormat) {
        if (configFormat == null || configFormat.isEmpty()) {
            return null;
        }
        return cachedParsers.get(configFormat.toLowerCase());
    }
}
