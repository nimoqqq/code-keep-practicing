package com.nimo.design.creatation.factory.method;

import com.nimo.design.creatation.factory.business.IRuleConfigParser;

/**
 * @author : chuf
 * @date : 2023-05-09
 **/
public interface IRuleConfigParserFactory {

    IRuleConfigParser createParser(String configFormat);
}
