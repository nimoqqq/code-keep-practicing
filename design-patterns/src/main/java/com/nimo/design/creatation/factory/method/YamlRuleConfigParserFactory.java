package com.nimo.design.creatation.factory.method;


import com.nimo.design.creatation.factory.business.IRuleConfigParser;
import com.nimo.design.creatation.factory.business.YamlRuleConfigParser;

public class YamlRuleConfigParserFactory implements IRuleConfigParserFactory {
    @Override
    public IRuleConfigParser createParser(String configFormat) {
        return new YamlRuleConfigParser();
    }
}
