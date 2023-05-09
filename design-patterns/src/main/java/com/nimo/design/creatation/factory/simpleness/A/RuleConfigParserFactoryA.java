package com.nimo.design.creatation.factory.simpleness.A;

import com.nimo.design.creatation.factory.business.*;

/**
 * 第一种实现方法
 *
 * @author : chuf
 * @date : 2023-05-09
 **/
public class RuleConfigParserFactoryA {

    public static IRuleConfigParser createParser(String configFormat) {
        IRuleConfigParser parser = null;
        if ("json".equalsIgnoreCase(configFormat)) {
            parser = new JsonRuleConfigParser();
        } else if ("xml".equalsIgnoreCase(configFormat)) {
            parser = new XmlRuleConfigParser();
        } else if ("yaml".equalsIgnoreCase(configFormat)) {
            parser = new YamlRuleConfigParser();
        } else if ("properties".equalsIgnoreCase(configFormat)) {
            parser = new PropertiesRuleConfigParser();
        }
        return parser;
    }
}
