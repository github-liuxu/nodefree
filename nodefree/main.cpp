//
//  main.cpp
//  nodefree
//
//  Created by 刘东旭 on 2024/4/14.
//

#include <iostream>
#include "restclient-cpp/restclient.h"
#include <unistd.h>
#include <fstream>
#include "nodefree-Swift.h"

std::string replaceStr(std::string str, std::string patten, std::string replacestr) {
    std::string result = str;
    std::string::size_type index = 0;
    while (std::string::size_type pos = result.find(patten, index)) {
        if (pos < result.size()) {
            result = result.replace(pos, patten.size(), replacestr);
            index = pos + replacestr.size();
        } else {
            break;
        }
    }
    return result;
}

int main(int argc, const char * argv[]) {
    // insert code here...
    const char * type = "0";
    if (argc > 1) {
        type = argv[1];
    }
    
    nodefree::Help help = nodefree::Help::init(std::stoi(type));
    RestClient::Response r = RestClient::get(help.ClashUrlString());
    if (r.code == 200) {
        std::string result = replaceStr(r.body,"&quot;","'");
        std::string clashfile = help.ClashDir();
        std::ofstream outfile(clashfile);
        outfile.clear();
        outfile << result;
        outfile.close();
        std::cout << "请求成功:" << result << std::endl;
    } else {
        std::cout << "请求失败:" << r.code << std::endl;
    }
    return 0;
}
