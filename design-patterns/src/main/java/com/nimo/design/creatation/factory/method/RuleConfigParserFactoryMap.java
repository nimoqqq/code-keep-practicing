package com.nimo.design.creatation.factory.method;

import org.springframework.util.StringUtils;

import java.util.HashMap;
import java.util.Map;

/**
 * @author : chuf
 * @date : 2023-05-09
 **/
public class RuleConfigParserFactoryMap {

    private static final Map<String, IRuleConfigParserFactory> cachedFactories = new HashMap<>();

    static {
        cachedFactories.put("json", new JsonRuleConfigParserFactory());
        cachedFactories.put("xml", new XmlRuleConfigParserFactory());
        cachedFactories.put("yaml", new YamlRuleConfigParserFactory());
        cachedFactories.put("properties", new PropertiesRuleConfigParserFactory());
    }

    public static IRuleConfigParserFactory getParserFactory(String type) {
        if (StringUtils.isEmpty(type)) {
            return null;
        }

        return cachedFactories.get(type.toLowerCase());
    }
}
