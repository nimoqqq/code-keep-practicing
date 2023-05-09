package com.nimo.design.creatation.factory.simpleness.A;

import com.nimo.design.creatation.factory.business.IRuleConfigParser;
import com.nimo.design.creatation.factory.business.RuleConfig;

/**
 * @author : chuf
 * @date : 2023-05-09
 **/
public class RuleConfigSourceB {

    public RuleConfig load(String ruleConfigFilePath) {
        String ruleConfigFileExtension = getFileExtension(ruleConfigFilePath);
        IRuleConfigParser parser = RuleConfigParserFactoryA.createParser(ruleConfigFileExtension);
        if (parser == null) {
            throw new RuntimeException(
                    "Rule config file format is not supported: " + ruleConfigFilePath);
        }

        String configText = "";
        //从ruleConfigFilePath文件中读取配置文本到configText中
        RuleConfig ruleConfig = parser.parse(configText);
        return ruleConfig;
    }

    private String getFileExtension(String filePath) {
        //...解析文件名获取扩展名，比如rule.json，返回json
        return "json";
    }
}
